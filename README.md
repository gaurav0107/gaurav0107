<!-- ─────────────────────────  HERO  ───────────────────────── -->
<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:0F172A,40:0E7490,80:06B6D4,100:F97316&height=220&section=header&text=Gaurav%20Dubey&fontSize=56&fontColor=ffffff&fontAlignY=36&desc=Agentic%20systems%20%E2%80%A2%20LLM%20platforms%20%E2%80%A2%20Fraud%20%26%20risk&descSize=17&descAlignY=62&animation=twinkling" alt="Gaurav Dubey" />
</p>

<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=500&size=19&duration=3000&pause=900&color=06B6D4&center=true&vCenter=true&width=780&lines=Agentic+coding%2C+but+shipped+to+production.;MCP-native.+Eval-gated.+Tokenised+by+default.;Autonomous+agents+for+fraud+investigation.;LangGraph+DAGs+with+durable+checkpoints." alt="What I do" />
</p>

<p align="center">
  <a href="https://www.linkedin.com/in/gaurav1792/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn" /></a>
  <a href="https://gauravdubey.com/"><img src="https://img.shields.io/badge/gauravdubey.com-0D1117?style=flat-square&logo=firefox&logoColor=F97316" alt="Site" /></a>
  <a href="mailto:gauravdubey0107@gmail.com"><img src="https://img.shields.io/badge/Email-F97316?style=flat-square&logo=gmail&logoColor=white" alt="Email" /></a>
  <img src="https://img.shields.io/badge/Senior%20SDE-Expedia%20Fraud%20%26%20Risk-0F172A?style=flat-square&labelColor=0E7490" alt="Role" />
</p>

---

### &nbsp;//&nbsp; about

Senior engineer shipping **agentic systems for fraud &amp; risk** at **Expedia Group**. I build the infra between LLMs and sensitive data: privacy-preserving gateways, MCP servers, LangGraph agents, and eval harnesses that gate prompts in CI.

> *Agentic coding, minus the vibes.*

---

## &nbsp;&#x1f916;&nbsp; Agentic stack

```text
  ┌──────────────┐   ┌──────────────────┐   ┌────────────┐
  │  investigator│──▶│ LangGraph agent  │──▶│ MCP tools  │──▶ fraud data
  │   / trigger  │   │ (DAG · Postgres  │   │ (JSON-RPC  │
  │              │   │  checkpoints)    │   │  + SSE)    │
  └──────────────┘   └────────┬─────────┘   └────────────┘
                              ▼
                     ┌────────────────────┐
                     │ Tokenisation Layer │  PII never crosses the trust boundary
                     │ ── schema-aware    │  HKDF master → per-convo salt
                     │ ── Presidio + NER  │  HMAC-SHA256 token IDs
                     │ ── Bedrock guard   │  CRC8 hallucination checksums
                     └─────────┬──────────┘
                               ▼
                     hosted LLM  (Bedrock / SageMaker / OSS)
```

-  &#x1f512;&nbsp; **Privacy-preserving LLM gateway** — three-tier tokenisation, deterministic + reversible within conversation, `60-bit → 115-bit` trade-off analysis
-  &#x1f517;&nbsp; **MCP servers** — tool-centric access, dual transport, schema-gated queries
-  &#x1f9ea;&nbsp; **Agent DAGs** — LangGraph + Postgres checkpointing, YAML-compiled tasks, Selenium browser agents
-  &#x1f4ca;&nbsp; **Eval harnesses** — calibrated LLM-as-judge, structural rubrics, CI exit codes (see [diffprompt](https://github.com/gaurav0107/diffprompt))
-  &#x1f9ec;&nbsp; **Vector + RAG** — embedding similarity over historical fraud patterns; hybrid rules + ML

---

## &nbsp;&#x1f4e6;&nbsp; Stack

```text
  AI       LangGraph · LangChain · MCP SDK · FastAPI · Pydantic · Presidio · spaCy
  Models   Bedrock · SageMaker · OpenAI · Groq · Ollama · OpenRouter
  Data     PostgreSQL · DynamoDB · Redis · Elasticsearch · Kafka · Airflow
  Core     Java · Python · Golang · TypeScript · AWS · Docker · K8s · Vault
  Crypto   HKDF · HMAC-SHA256 · CRC8 · per-conversation key derivation
```

---

## &nbsp;&#x1f31f;&nbsp; Open-source contributions

Sorted by upstream star count. Open + merged PRs only (closed-unmerged skipped). Agentic-coding repos bolded.

| Repo | Stars | Open | Merged |
|---|---:|:---:|:---:|
| [**openclaw/openclaw**](https://github.com/openclaw/openclaw) | 363k | 1 | — |
| [**affaan-m/everything-claude-code**](https://github.com/affaan-m/everything-claude-code) | 166k | 1 | 1 |
| [huggingface/transformers](https://github.com/huggingface/transformers) | 160k | — | 1 |
| [**google-gemini/gemini-cli**](https://github.com/google-gemini/gemini-cli) | 102k | 1 | — |
| [apache/airflow](https://github.com/apache/airflow) | 45k | — | 1 |
| [**langchain-ai/langchain-google**](https://github.com/langchain-ai/langchain-google) | 367 | 1 | — |
| [**LambdaTest/agent-skills**](https://github.com/LambdaTest/agent-skills) | 227 | 3 | — |

---

## &nbsp;&#x1f4d0;&nbsp; Principles

-  **Benchmarks over vibes** — datastores picked with IOPS + `$/hr`; LLM routes picked with eval numbers
-  **Security is the first tenet, not the last** — name the threats, name the controls
-  **Entity thinking** — if you're debugging individual events, you're already behind the fraud ring

---

<table>
  <tr>
    <td><img src="https://github-readme-stats.vercel.app/api?username=gaurav0107&show_icons=true&theme=react&title_color=06B6D4&icon_color=F97316&border_color=1E293B&bg_color=0D1117&include_all_commits=true&count_private=true" alt="GitHub stats" /></td>
    <td><img src="https://github-readme-stats.vercel.app/api/top-langs/?username=gaurav0107&layout=compact&theme=react&title_color=06B6D4&border_color=1E293B&bg_color=0D1117&langs_count=8" alt="Top languages" /></td>
  </tr>
</table>

<p align="center"><em>Building secure agent infra or fraud platforms? Let's talk.</em></p>

<p align="center">
  <img src="https://komarev.com/ghpvc/?username=gaurav0107&color=06B6D4&style=flat-square&label=Profile+Views" alt="Profile views" />
</p>

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:F97316,100:0E7490&height=100&section=footer" alt="footer" />
</p>
