#!/usr/bin/env bash
# Regenerates PULLS.md: all open PRs, then every open/merged PR grouped by the
# week it was opened (Monday start). Unlike the README block, no star/owner filter.
set -euo pipefail

USER="gaurav0107"
OUT="${OUT:-PULLS.md}"

for c in gh jq; do command -v "$c" >/dev/null || { echo "missing: $c" >&2; exit 1; }; done

gh api -X GET 'search/issues' \
  -f q="type:pr author:${USER}" \
  -f per_page=100 \
  --paginate \
  --jq '.items[] | {
    repo: (.repository_url | split("/")[-2:] | join("/")),
    number: .number,
    title: .title,
    state: .state,
    draft: (.draft // false),
    created_at: .created_at,
    merged_at: .pull_request.merged_at,
    url: .html_url
  }' \
| jq -rs --arg today "$(date -u +%Y-%m-%d)" '
  def pr:     "[\(.repo)#\(.number)](\(.url))";
  def ttl:    .title | gsub("[|\r\n]"; " ") | gsub("`"; "");
  def status: if .merged_at then .merged_at[0:10] elif .draft then "draft" else "open" end;
  def monday: fromdate | (. - . % 86400) as $m | ($m - ((($m | gmtime | .[6]) + 6) % 7) * 86400) | strftime("%Y-%m-%d");

  map(select(.merged_at != null or .state == "open")) as $prs
  | ($prs | map(select(.merged_at == null))) as $open
  | "# Pull requests",
    "",
    "_last synced · \($today)_ · [← back to profile](README.md)",
    "",
    "**\($prs | map(select(.merged_at != null)) | length)** merged · **\($open | length)** open",
    "",
    "## Open now",
    "",
    (if ($open | length) == 0 then "_None._" else
      "| PR | title | opened |", "|---|---|---|",
      ($open | sort_by(.created_at) | reverse[] | "| \(pr) | \(ttl) | \(.created_at[0:10]) |")
    end),
    "",
    "## By week opened",
    "",
    ($prs | group_by(.created_at | monday) | reverse[]
      | "### Week of \(.[0].created_at | monday) · \(length) opened · \(map(select(.merged_at != null)) | length) merged",
        "",
        "| PR | title | opened | merged |", "|---|---|---|---|",
        (sort_by(.created_at) | reverse[] | "| \(pr) | \(ttl) | \(.created_at[0:10]) | \(status) |"),
        "")
' > "$OUT"

echo "Updated $OUT"
