#!/usr/bin/env bash
# Regenerates the OSS contributions block in README.md between
# <!-- OSS:START --> and <!-- OSS:END -->.
set -euo pipefail

USER="gaurav0107"
EXCLUDE_OWNERS=(gaurav0107 wealthscore PressPlayTV whatthedough)
README="${README:-README.md}"

need() { command -v "$1" >/dev/null || { echo "missing: $1" >&2; exit 1; }; }
need gh
need jq
need awk

tmp_raw=$(mktemp) ; tmp_stars=$(mktemp) ; tmp_block=$(mktemp)
trap 'rm -f "$tmp_raw" "$tmp_stars" "$tmp_block"' EXIT

gh api -X GET 'search/issues' \
  -f q="type:pr author:${USER}" \
  -f per_page=100 \
  --paginate \
  --jq '.items[] | {
    repo: (.repository_url | split("/")[-2:] | join("/")),
    owner: (.repository_url | split("/")[-2]),
    number: .number,
    title: .title,
    state: .state,
    merged_at: .pull_request.merged_at,
    draft: .draft,
    created_at: .created_at,
    url: .html_url
  }' | jq -s '.' > "$tmp_raw"

EXCLUDE_JSON=$(printf '%s\n' "${EXCLUDE_OWNERS[@]}" | jq -R . | jq -s .)

jq --argjson ex "$EXCLUDE_JSON" '
  map(select(.draft == false))
  | map(select((.owner as $o | $ex | index($o)) | not))
  | map(select(.merged_at != null or .state == "open"))
' "$tmp_raw" > "${tmp_raw}.filtered"
mv "${tmp_raw}.filtered" "$tmp_raw"

echo '{}' > "$tmp_stars"
while IFS= read -r repo; do
  stars=$(gh api "repos/$repo" --jq '.stargazers_count' 2>/dev/null || echo 0)
  jq --arg r "$repo" --argjson s "$stars" '. + {($r): $s}' "$tmp_stars" > "${tmp_stars}.tmp"
  mv "${tmp_stars}.tmp" "$tmp_stars"
done < <(jq -r '.[].repo' "$tmp_raw" | sort -u)

jq --slurpfile stars "$tmp_stars" '
  map(. + { stars: ($stars[0][.repo] // 0) })
' "$tmp_raw" > "${tmp_raw}.stars"
mv "${tmp_raw}.stars" "$tmp_raw"

MERGED=$(jq '[.[] | select(.merged_at != null)] | length' "$tmp_raw")
OPEN=$(jq '[.[] | select(.state == "open")] | length' "$tmp_raw")
TOTAL_STARS=$(jq -r '[.[] | {repo, stars}] | unique_by(.repo) | map(.stars) | add // 0' "$tmp_raw")

humanize_k() {
  local n="$1"
  if   [ "$n" -ge 1000000 ]; then awk -v n="$n" 'BEGIN{printf "%.1fM", n/1000000}'
  elif [ "$n" -ge 1000 ];    then awk -v n="$n" 'BEGIN{printf "%dk", int(n/1000 + 0.5)}'
  else                            printf '%d' "$n"
  fi
}
STARS_H=$(humanize_k "$TOTAL_STARS")

sparkline_30d() {
  local today
  today=$(date -u +%Y-%m-%d)
  jq -r '.[].created_at' "$tmp_raw" \
    | cut -c1-10 \
    | sort \
    | uniq -c \
    | awk '{print $2"\t"$1}' > /tmp/pr_bydate.$$ || true

  local buckets=()
  for i in $(seq 29 -1 0); do
    local d
    if date -u -v-"${i}"d +%Y-%m-%d >/dev/null 2>&1; then
      d=$(date -u -v-"${i}"d +%Y-%m-%d)
    else
      d=$(date -u -d "$today - $i days" +%Y-%m-%d)
    fi
    local c
    c=$(awk -v d="$d" '$1==d{print $2}' /tmp/pr_bydate.$$ 2>/dev/null || echo "")
    buckets+=("${c:-0}")
  done
  rm -f /tmp/pr_bydate.$$

  local max=0
  for v in "${buckets[@]}"; do [ "$v" -gt "$max" ] && max="$v"; done

  local chars=(" " "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")
  local out=""
  for v in "${buckets[@]}"; do
    if [ "$max" -eq 0 ]; then
      out+="${chars[0]}"
    else
      local idx=$(( v * 8 / max ))
      [ "$idx" -gt 8 ] && idx=8
      out+="${chars[$idx]}"
    fi
  done
  printf '%s' "$out"
}
SPARK=$(sparkline_30d)

PILL_MERGED='https://img.shields.io/badge/merged-8957E5?style=flat-square'
PILL_OPEN='https://img.shields.io/badge/open-238636?style=flat-square'

clean_title() {
  awk '{
    gsub(/\|/, "");
    gsub(/`/, "");
    gsub(/ +/, " ");
    if (length($0) > 70) $0 = substr($0, 1, 67) "..."
    print
  }'
}

human_stars() {
  local s="$1"
  if   [ "$s" -ge 1000 ]; then awk -v s="$s" 'BEGIN{printf "%dk", s/1000}'
  else                         printf '%d' "$s"
  fi
}

{
  echo '<!-- OSS:START -->'
  TODAY=$(date -u +%Y-%m-%d)
  printf '_last synced · %s_\n\n' "$TODAY"

  cat <<EOF
\`\`\`
┌─ impact ──────────────────────────────────────────────────────────────┐
│ ${MERGED} merged  ·  ${OPEN} open  ·  ${STARS_H}⭐ reached
│ ${SPARK}  prs over last 30 days
└───────────────────────────────────────────────────────────────────────┘
\`\`\`

EOF

  echo '| repository | ⭐ | merged | open | latest title |'
  echo '|---|---:|---|---|---|'

  # Group PRs by repo. One row per repo. Separate columns for merged vs open
  # PR numbers. Sort rows: any-merged first, then stars desc.
  jq -r '
    group_by(.repo)
    | map({
        repo: .[0].repo,
        stars: .[0].stars,
        any_merged: any(.[]; .merged_at != null),
        merged_nums: ([.[] | select(.merged_at != null) | .number] | sort | reverse),
        open_nums:   ([.[] | select(.merged_at == null and .state == "open") | .number] | sort | reverse),
        latest: (sort_by(.created_at) | last)
      })
    | sort_by([ (if .any_merged then 0 else 1 end), -(.stars) ])
    | .[]
    | [
        .repo, (.stars|tostring),
        ((.merged_nums | map(tostring) | join(",")) | if . == "" then "-" else . end),
        ((.open_nums   | map(tostring) | join(",")) | if . == "" then "-" else . end),
        .latest.title
      ]
    | @tsv
  ' "$tmp_raw" | while IFS=$'\t' read -r repo stars merged_csv open_csv title; do
    sh=$(human_stars "$stars")
    t=$(printf '%s' "$title" | clean_title)

    render_cell() {
      local csv="$1"
      if [ -z "$csv" ] || [ "$csv" = "-" ]; then
        printf '%s' "—"
        return
      fi
      local out="" first=1
      IFS=',' read -r -a nums <<< "$csv"
      for n in "${nums[@]}"; do
        [ $first -eq 1 ] || out+=" "
        out+="[#${n}](https://github.com/${repo}/pull/${n})"
        first=0
      done
      printf '%s' "$out"
    }
    merged_cell=$(render_cell "$merged_csv")
    open_cell=$(render_cell "$open_csv")

    printf '| [%s](https://github.com/%s) | %s | %s | %s | %s |\n' \
      "$repo" "$repo" "$sh" "$merged_cell" "$open_cell" "$t"
  done

  echo
  echo '<!-- OSS:END -->'
} > "$tmp_block"

if ! grep -q '<!-- OSS:START -->' "$README" || ! grep -q '<!-- OSS:END -->' "$README"; then
  echo "ERROR: $README is missing <!-- OSS:START --> / <!-- OSS:END --> markers." >&2
  exit 2
fi

awk -v block_file="$tmp_block" '
  BEGIN {
    while ((getline line < block_file) > 0) block = block line "\n"
    close(block_file)
    sub(/\n$/, "", block)
  }
  /<!-- OSS:START -->/ { print block; inside=1; next }
  /<!-- OSS:END -->/   { inside=0; next }
  !inside { print }
' "$README" > "${README}.new"
mv "${README}.new" "$README"

echo "Updated $README"
