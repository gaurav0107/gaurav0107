<!-- ───────────────────  terminal masthead  ─────────────────── -->
<p align="left">
  <img src="https://capsule-render.vercel.app/api?type=soft&color=0:010409,100:0d1117&height=6&section=header&reversal=false" width="100%" alt="" />
</p>

```text
┌─────────────────────────────────────────────────────────────┐
│  GAURAV DUBEY · agentic systems engineer                    │
│  expedia group · gurgaon, india · ↑ since 2018              │
└─────────────────────────────────────────────────────────────┘
```

<p align="left">
  <a href="https://github.com/gaurav0107">
    <img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=600&size=18&duration=2400&pause=900&color=FF9A3C&vCenter=true&width=760&height=30&lines=gaurav%40expedia%3A~%24+whoami;gaurav%40expedia%3A~%24+cat+%2Fetc%2Fabout;gaurav%40expedia%3A~%24+ls+.%2Fagents%2F;gaurav%40expedia%3A~%24+curl+-s+gaurav.dev" alt="prompt" />
  </a>
</p>

> 🟢 &nbsp; I build **agentic systems** that catch fraud before it ships — LLMs orchestrated through deterministic graphs, grounded in policy, and observable enough to put on call.
>
> <sub>9 years in. Java & distributed systems → Python & ML platforms → now full-time on agent infrastructure.</sub>

---

## <img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=700&size=18&duration=1200&pause=60000&color=FF9A3C&width=220&height=28&lines=%23+now" alt="# now" />

| | |
|---|---|
| **role** | Senior SDE II · Expedia · Trust & Safety platform |
| **building** | Multi-agent fraud reasoning over `LangGraph` + `MCP` |
| **shipped** | Privacy-preserving LLM gateway · three-tier tokenisation · eval-gated in CI |
| **writing** | A field guide to deterministic agents — *wip* |
| **open to** | collaborating on agent infra · eval tooling · MCP servers |

---

## <img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=700&size=18&duration=1400&pause=60000&color=FF9A3C&width=220&height=28&lines=%23+stack" alt="# stack" />

```text
  AI       LangGraph · LangChain · MCP SDK · FastAPI · Pydantic · Presidio · spaCy
  Models   Bedrock · SageMaker · Claude · OpenAI · Groq · Ollama · OpenRouter
  Data     PostgreSQL · DynamoDB · Redis · Elasticsearch · Kafka · Airflow
  Core     Java · Python · Golang · TypeScript · AWS · Docker · K8s · Vault
  Crypto   HKDF · HMAC-SHA256 · CRC8 · per-conversation key derivation
  Eval     LangSmith · OpenTelemetry · Grafana · property-based · golden sets
```

---

## <img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=700&size=18&duration=1600&pause=60000&color=FF9A3C&width=260&height=28&lines=%23+featured" alt="# featured" />

<table>
<tr>
<td width="50%" valign="top">

**📘 [diffprompt](https://github.com/gaurav0107/diffprompt)** &nbsp;<sub>`Public`</sub>

Calibrated LLM-as-judge with structural rubrics. CI exit codes that block regressions before they merge — the thing I always wished I had.

<sub>🟦 &nbsp;Python</sub>

</td>
<td width="50%" valign="top">

**📘 fraud-graph** &nbsp;<sub>`Private · wip`</sub>

Multi-agent LangGraph runtime for transactional fraud — policy nodes, vector recall, a verifier loop, and deterministic replay.

<sub>🟦 &nbsp;Python</sub>

</td>
</tr>
<tr>
<td width="50%" valign="top">

**📘 mcp-policy-server** &nbsp;<sub>`Private · wip`</sub>

An MCP server that exposes risk policies as typed tools. Plugs into Claude / Bedrock; ships with golden cases.

<sub>🟦 &nbsp;TypeScript</sub>

</td>
<td width="50%" valign="top">

**📘 agent-eval** &nbsp;<sub>`Private · wip`</sub>

Property-based evaluation harness for agent traces. Diffs two runs, surfaces drift, blocks deploys on regressions.

<sub>🟦 &nbsp;Python</sub>

</td>
</tr>
</table>

---

## <img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=700&size=18&duration=1800&pause=60000&color=FF9A3C&width=320&height=28&lines=%23+contributions" alt="# contributions" />

<!-- OSS:START -->
_last synced · 2026-04-27_

```
┌─ impact ──────────────────────────────────────────────────────────────┐
│ 3 merged  ·  11 open  ·  900k⭐ reached
│                     ▅█  █▂▂▂█   prs over last 30 days
└───────────────────────────────────────────────────────────────────────┘
```

| repository | ⭐ | merged | open | latest title |
|---|---:|---|---|---|
| [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code) | 167k | [#1490](https://github.com/affaan-m/everything-claude-code/pull/1490) | [#1567](https://github.com/affaan-m/everything-claude-code/pull/1567) | fix(hooks): bypass gateguard friction gates inside subagent invocat... |
| [huggingface/transformers](https://github.com/huggingface/transformers) | 159k | [#45611](https://github.com/huggingface/transformers/pull/45611) | — | Raise clear error for problem_type="single_label_classification" wi... |
| [apache/airflow](https://github.com/apache/airflow) | 45k | [#65685](https://github.com/apache/airflow/pull/65685) | [#65887](https://github.com/apache/airflow/pull/65887) | Fix Triggerer subprocess sys.path gap for DAG bundle helpers |
| [openclaw/openclaw](https://github.com/openclaw/openclaw) | 364k | — | [#70287](https://github.com/openclaw/openclaw/pull/70287) | fix(msteams): drop unsupported $search on msteams:search (AI-assisted) |
| [google-gemini/gemini-cli](https://github.com/google-gemini/gemini-cli) | 102k | — | [#26011](https://github.com/google-gemini/gemini-cli/pull/26011) [#25822](https://github.com/google-gemini/gemini-cli/pull/25822) | fix(cli): propagate TLS env vars from .gemini/.env in parent process |
| [danny-avila/LibreChat](https://github.com/danny-avila/LibreChat) | 36k | — | [#12825](https://github.com/danny-avila/LibreChat/pull/12825) | fix: graceful MCP OAuth revoke cleanup when tokens are missing (#12... |
| [mastra-ai/mastra](https://github.com/mastra-ai/mastra) | 23k | — | [#15769](https://github.com/mastra-ai/mastra/pull/15769) | fix(core): reject plain functions as individual tool entries in Age... |
| [langchain-ai/langchain-google](https://github.com/langchain-ai/langchain-google) | 367 | — | [#1708](https://github.com/langchain-ai/langchain-google/pull/1708) | fix(genai): wrap batch texts in Content objects for correct embeddi... |
| [LambdaTest/agent-skills](https://github.com/LambdaTest/agent-skills) | 230 | — | [#5](https://github.com/LambdaTest/agent-skills/pull/5) [#4](https://github.com/LambdaTest/agent-skills/pull/4) [#3](https://github.com/LambdaTest/agent-skills/pull/3) | feat(api): standardize frontmatter, update validation, register 24 ... |

<!-- OSS:END -->

<sub>Sorted by upstream star count. Closed-unmerged PRs skipped.</sub>

---

## <img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=700&size=18&duration=1400&pause=60000&color=FF9A3C&width=280&height=28&lines=%23+principles" alt="# principles" />

- &rsaquo; &nbsp;**Benchmarks over vibes** — datastores picked with IOPS + `$/hr`; LLM routes picked with eval numbers
- &rsaquo; &nbsp;**Security is the first tenet, not the last** — name the threats, name the controls
- &rsaquo; &nbsp;**Entity thinking** — if you're debugging individual events, you're already behind the fraud ring

---

## <img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=700&size=18&duration=1300&pause=60000&color=FF9A3C&width=240&height=28&lines=%23+contact" alt="# contact" />

<p align="left">
  <a href="mailto:gauravdubey0107@gmail.com">
    <img src="https://img.shields.io/badge/%E2%86%92%20open%20for%20collab-FF9A3C?style=for-the-badge&labelColor=0d1117&color=FF9A3C" alt="open for collab" />
  </a>
  &nbsp;
  <a href="https://www.linkedin.com/in/gaurav1792/">
    <img src="https://img.shields.io/badge/linkedin.com%2Fin%2Fgaurav1792-0d1117?style=for-the-badge&logo=linkedin&logoColor=FF9A3C&labelColor=0d1117" alt="linkedin" />
  </a>
  &nbsp;
  <a href="mailto:gauravdubey0107@gmail.com">
    <img src="https://img.shields.io/badge/gauravdubey0107%40gmail.com-0d1117?style=for-the-badge&logo=gmail&logoColor=FF9A3C&labelColor=0d1117" alt="email" />
  </a>
</p>

<p align="left">
  <img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=500&size=14&duration=1200&pause=120000&color=9198A1&vCenter=true&width=760&height=26&lines=gaurav%40expedia%3A~%24+exit" alt="exit" />
</p>

<sub><img src="https://komarev.com/ghpvc/?username=gaurav0107&color=ff9a3c&style=flat-square&label=visits" alt="visits" /></sub>
