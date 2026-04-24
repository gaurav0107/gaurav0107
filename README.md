<!-- ───────────────────────────────────────────────────────────────
     HERO · waving gradient anchored in teal → cyan → orange
     ─────────────────────────────────────────────────────────────── -->
<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:0F172A,30:0E7490,70:06B6D4,100:F97316&height=260&section=header&text=Gaurav%20Dubey&fontSize=58&fontColor=ffffff&fontAlignY=36&desc=I%20build%20the%20AI%20layer%20for%20fraud%20detection%20at%20scale&descSize=16&descAlignY=62&animation=twinkling" alt="Gaurav Dubey" />
</p>

<!-- ───────────────────────────────────────────────────────────────
     TAGLINE · lean into AI-systems identity
     ─────────────────────────────────────────────────────────────── -->
<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=500&size=20&duration=3200&pause=900&color=06B6D4&center=true&vCenter=true&width=820&lines=Privacy-preserving+LLM+gateways.;MCP+servers+that+investigators+actually+trust.;LangGraph+agents+with+durable+checkpoints.;Eval+harnesses+that+gate+prompts+in+CI.;Entity+thinking.+Benchmarks+over+vibes." alt="What I do" />
</p>

<!-- ───────────────────────────────────────────────────────────────
     QUICK LINKS · compact, high-contrast, single row
     ─────────────────────────────────────────────────────────────── -->
<p align="center">
  <a href="https://www.linkedin.com/in/gaurav1792/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn" /></a>
  <a href="https://gauravdubey.com/"><img src="https://img.shields.io/badge/gauravdubey.com-0D1117?style=flat-square&logo=firefox&logoColor=F97316" alt="Personal site" /></a>
  <a href="mailto:gauravdubey0107@gmail.com"><img src="https://img.shields.io/badge/Email-F97316?style=flat-square&logo=gmail&logoColor=white" alt="Email" /></a>
  <img src="https://img.shields.io/badge/Gurgaon%2C%20India-06B6D4?style=flat-square&logo=googlemaps&logoColor=white" alt="Location" />
  <img src="https://img.shields.io/badge/Senior%20SDE-%23%20Fraud%20%26%20Risk-0F172A?style=flat-square&labelColor=0E7490" alt="Role" />
</p>

<br/>

<!-- ───────────────────────────────────────────────────────────────
     ABOUT · tight, factual, positioned
     ─────────────────────────────────────────────────────────────── -->

### &nbsp;//&nbsp; about

I'm a senior software engineer at **Expedia Group**, on the fraud &amp; risk platform team. My day-job is designing the systems that sit between LLMs and sensitive fraud data — **tokenising PII, orchestrating agents, and giving investigators superpowers without giving up trust boundaries**.

I've shipped production infra at **Blinkit** (Feature Store / CDP), **OYO** (Engineering Manager, Promotions &amp; Ordering), **airtel X Labs** (distributed ingress on CEPH), **Knowlarity** (cloud telephony at high availability), and **PressPlay TV** (data pipeline &amp; payments). **B.Tech in Computer Science, Jaypee University of Information Technology ('15).**

> *Builder &amp; Tinkerer — I don't just use tools, I take them apart.*

---

<!-- ───────────────────────────────────────────────────────────────
     AI SYSTEMS · promoted to its own section, top of content
     ─────────────────────────────────────────────────────────────── -->

## &nbsp;&#x1f9e0;&nbsp; AI systems I build

This is where my work lives in 2026. Production systems, not demos.

### &nbsp;&#x1f512;&nbsp; Privacy-preserving LLM gateways

Three-tier tokenisation pipeline — PII never leaves the trust boundary. The tokens that go to the LLM are **opaque, deterministic, reversible within the conversation, and cryptographically distinguishable from hallucinated lookalikes**.

```text
  ┌───────────┐    ┌─────────────────────┐    ┌───────────┐
  │   User    │───▶│  TOKENISATION LAYER │───▶│    LLM    │
  │  request  │    │                     │    │  (hosted) │
  └───────────┘    │  Tier 1  Schema-aware (sub-ms, deterministic)
                   │  Tier 2  Presidio + spaCy NER (ML catch-all)
                   │  Tier 3  Bedrock Guardrails (fail-safe)
                   │                     │
                   │  HKDF master key    │
                   │    └── per-convo salt → SHA-256 derived key
                   │         └── HMAC-SHA256 token IDs
                   │              └── CRC8 hallucination check
                   │                                    ▲
  ┌───────────┐    │  Detokenise response ──────────────┘
  │ Response  │◀───│  (only within original trust scope)
  └───────────┘    └─────────────────────┘
```

**Trade-offs I think about.** 60-bit vs 115-bit token security (36 years vs 10¹⁵ years brute-force). Per-conversation salts to break cross-session linkability. Redis vault with TTL, scoped to `transaction_id · session_id · chat_id`. GDPR / PCI-aware by construction.

### &nbsp;&#x1f517;&nbsp; MCP servers for fraud decisioning

Model Context Protocol servers that expose decision data to agents through **tools, not static resources** — following the pattern proven by Atlassian's MCP (72 tools / 0 resources). Dual-transport (HTTP/JSON-RPC + SSE). Schema-driven `isSearchableByMCP` flags act as guardrails on what agents can ask. Tool-centric access means every query is explicit, logged, and permissioned.

### &nbsp;&#x1f9ea;&nbsp; Agent orchestration

**LangGraph DAGs** with Postgres checkpointing for durability across crashes and retries. YAML-defined tasks compile to Python functions — non-engineers author workflows, engineers review the compilation target. FastAPI control plane for the graph itself. Browser agents (Selenium + LLM-guided interaction) for vendor portals that don't have APIs.

### &nbsp;&#x1f4ca;&nbsp; Eval harnesses

Prompt changes shouldn't merge on vibes. I build pairwise eval harnesses (see **[diffprompt](https://github.com/gaurav0107/diffprompt)**) that run calibrated LLM-as-judge, structural-JSON rubrics, and CI-gating exit codes — so a prompt regression fails the build the same way a unit-test regression does.

### &nbsp;&#x1f9ec;&nbsp; Vector search &amp; RAG for investigations

Conversation and event embeddings, similarity search against historically flagged patterns, hybrid rule-based + ML retrieval. Embeddings are a *recall* tool; rules and graph traversal are *precision* tools. They complement each other; neither replaces the other.

---

<!-- ───────────────────────────────────────────────────────────────
     FRAUD PLATFORMS · supporting specialisation, kept concise
     ─────────────────────────────────────────────────────────────── -->

## &nbsp;&#x1f578;&#xfe0f;&nbsp; Fraud &amp; risk platforms

The AI layer sits on top of a fraud platform I've spent years designing.

<table>
  <tr>
    <td valign="top" width="50%">

**Entity-based modeling**
Users, devices, IPs, payment instruments as nodes in a behavioral graph. Multi-hop traversal to surface fraud rings. Relationship-change detection beats event-change detection.

**Real-time signal generation**
Anomaly pipelines, state-transition tracking, velocity stores. Multi-threaded aggregation tuned for `throughput · latency · memory`. High recall without drowning reviewers.

   </td>
    <td valign="top" width="50%">

**Entity-snapshot investigation**
Time-windowed consolidated views that collapse hours of manual drill-down into seconds. Optimised for fast lookup by entity ID.

**Decision pipelines**
Real-time (ms SLA) · near-real-time (seconds) · batch (minutes). State machines, checkpointing, replay. Pick the tier with cost-per-hour math, not preference.

   </td>
  </tr>
</table>

---

<!-- ───────────────────────────────────────────────────────────────
     SYSTEM-LEVEL DIAGRAM · shows how the two halves connect
     ─────────────────────────────────────────────────────────────── -->

## &nbsp;&#x1f3d7;&#xfe0f;&nbsp; How the pieces fit

```text
   ╔════════════════════════════╗           ╔══════════════════════════════╗
   ║   ENTITIES & EVENTS        ║           ║   LLM / AGENT LAYER          ║
   ║   user · device · ip · pi  ║           ║   investigation · summaries  ║
   ╚──────────────┬─────────────╝           ╚──────────────┬───────────────╝
                  │                                        │
      ┌───────────┼───────────┐                   ┌────────┴────────┐
      ▼           ▼           ▼                   ▼                 ▼
   signals   relationships  snapshots     MCP tool surface    eval harness
   (anomaly,  (graph ops,   (time-win    (schema-gated,       (pairwise,
    velocity)  multi-hop)    views)       dual transport)      LLM-judge,
      │           │           │                 │               CI gate)
      └───────────┴───────────┘                 │                 │
                  │                             ▼                 ▼
          ┌───────▼────────┐            ┌────────────────────────────┐
          │   Decisioning  │            │  Privacy-Preserving Gateway │
          │   RT · NRT · B │◀───────────│  HKDF · HMAC · CRC · vault  │
          └────────────────┘            └────────────────────────────┘
```

---

<!-- ───────────────────────────────────────────────────────────────
     STACK · monospace code blocks, grouped
     ─────────────────────────────────────────────────────────────── -->

## &nbsp;&#x1f4e6;&nbsp; Stack

```text
  languages    Java   Python   Golang   TypeScript   Scala   Angular
  ai / agents  LangGraph   LangChain   MCP SDK   FastAPI   asyncio   Pydantic
               SageMaker   Bedrock Guardrails   Presidio   spaCy   Ollama
  eval / ops   diffprompt   LLM-as-judge   Langfuse   Helicone   LangSmith
  data         PostgreSQL   MongoDB   DynamoDB   Elasticsearch   Redis   Kafka   Airflow
  infra        AWS   Docker   Kubernetes   Vault   Spring Boot   CEPH
  crypto       HKDF   HMAC-SHA256   CRC8   per-conversation key derivation
  patterns     JSON-RPC   SSE   REST   Event sourcing   CQRS   State machines
```

---

<!-- ───────────────────────────────────────────────────────────────
     PROJECTS · real repos, tight descriptions
     ─────────────────────────────────────────────────────────────── -->

## &nbsp;&#x1f9ea;&nbsp; Open-source

<table>
  <tr>
    <td valign="top" width="28%">&nbsp;<a href="https://github.com/gaurav0107/diffprompt"><b>diffprompt</b></a></td>
    <td valign="top">Pairwise prompt-evaluation CLI + GitHub Action. Calibrated LLM-as-judge, CI-gating exit codes, pluggable providers (OpenAI · Groq · OpenRouter · Ollama), structural-JSON and LLM rubrics, seed from Langfuse / Helicone / LangSmith. Treats prompts like production code.</td>
  </tr>
  <tr>
    <td valign="top">&nbsp;<a href="https://github.com/gaurav0107/GdPlayer"><b>GdPlayer</b></a></td>
    <td valign="top">Android media player built on ExoPlayer with custom UI and FFmpeg integration.</td>
  </tr>
  <tr>
    <td valign="top">&nbsp;<a href="https://github.com/gaurav0107/FileDownloader"><b>FileDownloader</b></a></td>
    <td valign="top">Android file downloader with a companion React UI.</td>
  </tr>
  <tr>
    <td valign="top">&nbsp;<a href="https://github.com/gaurav0107/janusgraph-utils"><b>janusgraph-utils</b></a></td>
    <td valign="top">Graph database utilities — schema, bulk loading, traversal helpers on JanusGraph.</td>
  </tr>
</table>

**Upstream contributions (2026) —** `apache/airflow` · `huggingface/transformers` · `google-gemini/gemini-cli` · `langchain-ai/langchain-google` · `open-webui/open-webui` · `anthropics/skills`

---

<!-- ───────────────────────────────────────────────────────────────
     PHILOSOPHY · short, opinionated, true
     ─────────────────────────────────────────────────────────────── -->

## &nbsp;&#x1f4d0;&nbsp; How I work

-  **Every design doc, same shape —** Problem &rarr; Tenets &rarr; Conceptual Model &rarr; Architecture &rarr; Components &rarr; Flows &rarr; Security/Ops &rarr; Future
-  **Separate the tenets** — functional, security, and reliability tenets live in different sections, not the same bullet list
-  **Benchmarks over opinions** — datastores picked with IOPS + cost-per-hour math; LLM routes picked with eval-harness numbers
-  **Security is baseline, not decoration** — name the threats (cross-conversation linkage, hallucinated tokens, reconstruction, memorisation leakage) and name the specific controls
-  **Simple &amp; composable &gt; clever** — three clear lines beat one clever abstraction
-  **Entity thinking** — if you're debugging individual events, you're already behind the fraud ring

---

<!-- ───────────────────────────────────────────────────────────────
     PUBLICATION
     ─────────────────────────────────────────────────────────────── -->

## &nbsp;&#x1f4c4;&nbsp; Publication

*Implementing Security Technique on Generic Database*

---

<!-- ───────────────────────────────────────────────────────────────
     STATS · kept, themed consistently
     ─────────────────────────────────────────────────────────────── -->

## &nbsp;&#x1f4c8;&nbsp; GitHub

<table>
  <tr>
    <td>
      <img src="https://github-readme-stats.vercel.app/api?username=gaurav0107&show_icons=true&theme=react&title_color=06B6D4&icon_color=F97316&border_color=1E293B&bg_color=0D1117&include_all_commits=true&count_private=true" alt="GitHub stats" />
    </td>
    <td>
      <img src="https://github-readme-stats.vercel.app/api/top-langs/?username=gaurav0107&layout=compact&theme=react&title_color=06B6D4&border_color=1E293B&bg_color=0D1117&langs_count=8" alt="Top languages" />
    </td>
  </tr>
</table>

<p align="center">
  <img src="https://github-readme-streak-stats.herokuapp.com/?user=gaurav0107&theme=react&ring=06B6D4&fire=F97316&currStreakLabel=06B6D4&background=0D1117&border=1E293B" alt="GitHub streak" />
</p>

<p align="center">
  <img src="https://github-readme-activity-graph.vercel.app/graph?username=gaurav0107&theme=react-dark&bg_color=0D1117&color=06B6D4&line=F97316&point=06B6D4&area=true&hide_border=true" alt="Contribution graph" />
</p>

---

<!-- ───────────────────────────────────────────────────────────────
     CLOSING · invitation, not summary
     ─────────────────────────────────────────────────────────────── -->

<p align="center">
  <em>Building secure LLM infrastructure, MCP servers, agent pipelines,</em><br/>
  <em>fraud platforms, or graph analysis? I'm always open to deep technical discussions.</em>
</p>

<p align="center">
  <img src="https://komarev.com/ghpvc/?username=gaurav0107&color=06B6D4&style=flat-square&label=Profile+Views" alt="Profile views" />
</p>

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:F97316,100:0E7490&height=120&section=footer" alt="footer" />
</p>
