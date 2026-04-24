<!-- ─────────────────────────  BANNER  ───────────────────────── -->
<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:0E7490,50:06B6D4,100:F97316&height=220&section=header&text=Gaurav%20Dubey&fontSize=52&fontColor=ffffff&fontAlignY=36&desc=Senior%20Software%20Engineer%20%C2%B7%20Fraud%20%26%20Risk%20%C2%B7%20Distributed%20Systems%20%C2%B7%20LLM%20Platforms&descSize=15&descAlignY=62&animation=twinkling" alt="Gaurav Dubey" />
</p>

<!-- ─────────────────────────  TAGLINE  ───────────────────────── -->
<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=500&size=20&duration=3200&pause=900&color=06B6D4&center=true&vCenter=true&width=760&lines=I+design+systems+that+think+in+entities%2C+not+events.;Fraud+platforms+at+scale.+LLM+systems+that+don%27t+leak.;Benchmarks+over+vibes.+Tenets+over+opinions." alt="What I do" />
</p>

<!-- ─────────────────────────  QUICK LINKS  ───────────────────────── -->
<p align="center">
  <a href="https://www.linkedin.com/in/gaurav1792/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn" /></a>
  <a href="https://gauravdubey.com/"><img src="https://img.shields.io/badge/gauravdubey.com-0D1117?style=flat-square&logo=firefox&logoColor=F97316" alt="Personal site" /></a>
  <a href="mailto:gauravdubey0107@gmail.com"><img src="https://img.shields.io/badge/Email-F97316?style=flat-square&logo=gmail&logoColor=white" alt="Email" /></a>
  <img src="https://img.shields.io/badge/Gurgaon%2C%20India-06B6D4?style=flat-square&logo=googlemaps&logoColor=white" alt="Location" />
  <img src="https://img.shields.io/badge/Open%20to%20deep%20technical%20discussions-0D1117?style=flat-square&logo=signal&logoColor=06B6D4" alt="Open to deep technical discussions" />
</p>

---

### &nbsp;About

Senior Software Engineer at **Expedia Group** — Fraud &amp; Risk.
Tech lead for platform architecture: I design systems that model users as entities, process events in real time, and surface high-signal decisions to investigators and automated pipelines.

Previously: **Blinkit** · Feature Store &amp; CDP · **OYO** · Engineering Manager, Promotions &amp; Ordering · **airtel X Labs** · distributed ingress on CEPH · **Knowlarity** · cloud telephony at scale · **PressPlay TV** · data pipeline &amp; payments.
**B.Tech, Computer Science — Jaypee University of Information Technology (2011 – 2015).**

> *Builder &amp; Tinkerer — I don't just use tools, I take them apart.*

---

### &nbsp;What I work on

<table>
  <tr>
    <td valign="top" width="50%">

**&#x1f578;&#xfe0f;  Entity-based fraud modeling**
Users, devices, IPs, and payment instruments as nodes in a behavioral graph. Multi-hop traversal to surface fraud rings. Relationship-change detection beats event-change detection.

**&#x26a1;  Real-time signal generation**
Behavioral anomaly pipelines, state-transition tracking, velocity stores, multi-threaded aggregation tuned for throughput &middot; latency &middot; memory.

**&#x1f50e;  Entity-snapshot investigation**
Time-windowed consolidations that collapse hours of manual drill-down into seconds for human reviewers.

**&#x1f9ed;  Graph-based analysis**
Cluster detection, shared-infrastructure traversal, graph-DB vs computed-join trade-off evaluation.

   </td>
    <td valign="top" width="50%">

**&#x1f9ec;  Vector search for fraud**
Embedding representations of conversations and events; similarity search against historically flagged patterns.

**&#x1f916;  LLM systems engineering**
Secure MCP servers, agent DAG orchestration (LangGraph), three-tier PII tokenization (schema-aware &rarr; NER &rarr; Guardrails), HKDF/HMAC-SHA256 key hierarchies, checksummed tokens, privacy-preserving intelligence gateways.

**&#x1f3d7;&#xfe0f;  Architecture &amp; system design**
HLDs, LLDs, API &amp; data contracts, design reviews. Pick datastores with IOPS and cost-per-hour math, not vibes.

**&#x1f91d;  Cross-functional translation**
Turn ambiguous risk/product problem statements into implementable, reviewed systems.

   </td>
  </tr>
</table>

---

### &nbsp;How I think about systems

```text
                       ┌────────────────────────────────────────┐
                       │                ENTITY                  │
                       │   user · device · ip · instrument      │
                       └────────────────┬───────────────────────┘
                                        │ event stream
                  ┌─────────────────────┼─────────────────────┐
                  │                     │                     │
          ┌───────▼────────┐   ┌────────▼────────┐   ┌────────▼────────┐
          │    Signals     │   │  Relationships  │   │   Snapshots     │
          │  (anomalies,   │   │   (graph ops,   │   │ (time-windowed  │
          │   velocities)  │   │   multi-hop)    │   │  investigation) │
          └───────┬────────┘   └────────┬────────┘   └────────┬────────┘
                  │                     │                     │
                  └─────────────────────┼─────────────────────┘
                                        │
                               ┌────────▼────────┐
                               │   Decisioning   │
                               │  RT · NRT · Batch│
                               └─────────────────┘
```

**Tenets.** Model the problem before the system. Design for scale early. Optimise on real bottlenecks. Prefer simple composition over clever abstractions.

---

### &nbsp;Current focus — 2026

Building the AI layer for fraud operations: privacy-preserving LLM gateways, MCP servers that expose decision data safely to agents, LangGraph-based investigation workflows with durable checkpointing, and evaluation harnesses that gate prompt changes in CI.

---

### &nbsp;Stack

```text
  Languages   Java   ·  Python  ·  Golang  ·  TypeScript  ·  Scala  ·  Angular
  AI / Agents LangGraph · LangChain · MCP SDK · FastAPI · SageMaker · Bedrock · Presidio · spaCy
  Data        PostgreSQL · MongoDB · DynamoDB · Elasticsearch · Redis · Kafka · Airflow
  Infra       AWS · Docker · Kubernetes · Vault · Spring Boot · CEPH
  Crypto      HKDF · HMAC-SHA256 · CRC · per-conversation key derivation
  Patterns    JSON-RPC · SSE · REST · Event sourcing · CQRS · State machines
```

---

### &nbsp;Selected projects

<table>
  <tr>
    <th align="left">Project</th>
    <th align="left">What it is</th>
  </tr>
  <tr>
    <td>&nbsp;&#x1f9ea;&nbsp; <a href="https://github.com/gaurav0107/diffprompt"><b>diffprompt</b></a></td>
    <td>Pairwise prompt-evaluation CLI + GitHub Action. Calibrated LLM-as-judge, CI-gating exit codes, pluggable providers (OpenAI / Groq / OpenRouter / Ollama), structural-JSON and LLM rubrics, seed from Langfuse / Helicone / LangSmith.</td>
  </tr>
  <tr>
    <td>&nbsp;&#x1f4f1;&nbsp; <a href="https://github.com/gaurav0107/GdPlayer"><b>GdPlayer</b></a></td>
    <td>Android media player built on ExoPlayer with custom UI and FFmpeg integration.</td>
  </tr>
  <tr>
    <td>&nbsp;&#x2b07;&#xfe0f;&nbsp; <a href="https://github.com/gaurav0107/FileDownloader"><b>FileDownloader</b></a></td>
    <td>Android file downloader with a companion React UI.</td>
  </tr>
  <tr>
    <td>&nbsp;&#x1f578;&#xfe0f;&nbsp; <a href="https://github.com/gaurav0107/janusgraph-utils"><b>janusgraph-utils</b></a></td>
    <td>Graph database utilities — schema, bulk loading, traversal helpers on JanusGraph.</td>
  </tr>
</table>

**Recent upstream contributions —** `apache/airflow` · `huggingface/transformers` · `google-gemini/gemini-cli` · `langchain-ai/langchain-google` · `open-webui/open-webui` · `anthropics/skills`.

---

### &nbsp;How I work

-  **Every design doc, same shape —** Problem &rarr; Tenets &rarr; Conceptual Model &rarr; Architecture &rarr; Components &rarr; Flows &rarr; Security/Ops &rarr; Future.
-  **Benchmarks over opinions —** datastores picked with IOPS + cost-per-hour math; LLM routes picked with eval harness numbers.
-  **Security is baseline, not an afterthought —** name the threats, name the controls, keep trust boundaries explicit.
-  **Simple &amp; composable &gt; clever —** three clear lines beat one clever abstraction.
-  **Entity thinking —** if you're debugging individual events, you're already behind the fraud ring.

---

### &nbsp;Publication

&#x1f4c4; &nbsp; *Implementing Security Technique on Generic Database*

---

### &nbsp;GitHub

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

<p align="center">
  <em>Working on fraud systems, large-scale data platforms, graph analysis, or LLM infrastructure?</em><br/>
  <em>I'm always open to deep technical discussions.</em>
</p>

<p align="center">
  <img src="https://komarev.com/ghpvc/?username=gaurav0107&color=06B6D4&style=flat-square&label=Profile+Views" alt="Profile views" />
</p>

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:F97316,100:06B6D4&height=120&section=footer" alt="footer" />
</p>
