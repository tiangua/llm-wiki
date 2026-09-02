# 📚 LLM Wiki 索引

**最后更新**: 2026-09-02  
**总页面数**: 25  
**人物页面**: 3  
**公司页面**: 1  
**项目页面**: 11  
**论文页面**: 4  
**概念页面**: 6

---

## 🧭 主题地图

> 本库已形成一条清晰主线：**Agent 记忆与自进化**。

### 主线一：Agent 记忆系统
- [[EverOS]] — 自进化 Agent 记忆操作系统 (EverMind-AI)
- [[TencentDB-Agent-Memory]] — 团队级记忆中枢：四种记忆资产 + L0-L3 分层（腾讯云）
- [[MemQ]] — Q-Learning + 溯源 DAG 的可学习记忆检索（arXiv:2605.08374）
- [[gbrain]] — Garry Tan 主导的 AI 记忆/知识产品
- [[Hermes Agent]] — Nous Research 的 Agent 框架（Skill 系统被 TencentDB Agent Memory 复用）

### 主线二：技能自进化
- [[执行层与知识层分离]] — ⭐ **本主线的统摄性原则**：可变执行层 + 不可变知识层，回滚只回滚执行层
- [[达尔文.skill]] — 技能进化系统（评估→改进→测试→回滚，棘轮机制）
- [[EvoSkill]] — 失败分析驱动的技能发现 (arXiv:2603.02766)
- [[EvoSkills]] — 协同进化验证 (arXiv:2604.01687)
- [[WikiSkill]] — 持久知识层驱动：技能可回滚、wiki 永不回滚 (arXiv:2608.27454，已超越 EvoSkill)
- [[SKILL.state]] — 互补的另一半：显式执行状态取代对话历史，管技能怎么跑 (arXiv:2608.26263，EMNLP)
- [[PRAXIST]] — 自主研究编排：类型化证据图 + 世代合成（Sapient Intelligence, arXiv:2608.25955）
- [[自进化技能]] — 核心概念，对比上述四种方案
- [[自主进化]] — 更宏观的自进化理念（自我监控/反思/更新/迭代）

### 主线三：评估与验证
- [[VAKRA-Benchmark]] — 企业级 Agent 工具推理基准（IBM Research）
- [[harden-v0]] — Hacker-Fixer 对抗循环加固基准验证器（arXiv:2606.08960）
- [[协同进化验证]] — 无需真实测试数据的对抗式验证方法
- [[运营Agent对抗测试系统]] — 楼澈的三层组合测试方案（对抗测试 + 评分加固 + 持续回归，内化 harden-v0 方法论）

### 本库自身的元知识
- [[楼澈]] — 本库主人，提问驱动本库主线
- [[Lunar]] — 本库维护者，与楼澈协作沉淀
- [[LLM Wiki (Karpathy)]] — 本库遵循的思想源头（LLM 维护、增量增长的知识产物）
- [[AI 研发范式]] — 楼澈设计的 Agent 研发新范式（三层记忆 + 主动代理 + 自我提升）
- [[编译真相 + 时间线]] — gbrain 调研中沉淀的方法论

---

## 🗂️ 按类型分类

### 👥 人物 (People)
- [[楼澈]] — 本库主人，[[AI 研发范式]] 负责人
- [[Lunar]] — 本库维护者，楼澈的常驻 Agent 伙伴
- [[Garry Tan]] — Y Combinator CEO，gbrain 主导者

### 🏢 公司 (Companies)
- [[Nous Research]] — Hermes Agent 背后的 AI 实验室

### 🚀 项目 (Projects)
- [[AI 研发范式]]
- [[EverOS]]
- [[gbrain]]
- [[Hermes Agent]]
- [[TencentDB-Agent-Memory]]
- [[MemQ]]
- [[达尔文.skill]]
- [[VAKRA-Benchmark]]
- [[harden-v0]]
- [[PRAXIST]]
- [[运营Agent对抗测试系统]]

### 📄 论文 (Papers)
- [[EvoSkill]] (arXiv:2603.02766)
- [[EvoSkills]] (arXiv:2604.01687)
- [[WikiSkill]] (arXiv:2608.27454)
- [[SKILL.state]] (arXiv:2608.26263，EMNLP)

### 💡 概念 (Concepts)
- [[执行层与知识层分离]]
- [[自主进化]]
- [[自进化技能]]
- [[协同进化验证]]
- [[编译真相 + 时间线]]
- [[LLM Wiki (Karpathy)]]

---

## 🔗 待创建页面（死链清单）

> 被引用但尚未创建的页面，按引用次数排序。创建后从此清单移除。

### 高优先（引用 ≥ 3 次）
- [ ] [[OpenKedge]]（7 次）— 论文：执行边界设计（arXiv 待查）
- [ ] [[执行边界]]（5 次）— OpenKedge 相关概念

### 中优先（引用 2 次）
- [ ] [[Honcho]] — Agent 记忆相关项目
- [ ] [[OpenClaw]] — 曾维护本库的 Agent 框架
- [ ] [[OSWorld]] — 计算机使用基准
- [ ] [[WebVoyager]] — Web 导航基准
- [ ] [[Tool-Use-Benchmarks]] — 工具使用基准对比页
- [ ] [[AI-Agent-Evaluation]] — Agent 评估方法综述
- [ ] [[三层记忆体系]] — L1/L2/L3 记忆架构
- [ ] [[自我提升]] / [[自学习 Agent]] — 概念页
- [ ] [[self-improving-agent]] — 项目/论文待查

### 低优先（引用 1 次，或属于外部事物暂不建页）
- [[Andrej Karpathy]]、[[Y Combinator]]、[[Supabase]]、[[pgvector]]、[[PGLite]]、[[Obsidian]]、[[Git]]、[[OpenAI Embeddings]]、[[agentskills.io]]、[[知识管理]]、[[混合搜索]]、[[个人知识库]]、[[Enterprise-AI-Deployment]]、[[Proactive Agent]]

> 注：`[[LLM Wiki]]`（12 次）与 `[[LLM Wiki (Karpathy)]]` 指向混淆，多数语境指本库自身或 Karpathy 思想——建议在各页面中逐步统一为后者。

---

## 📅 最近更新

- 2026-09-02: 新增 [[WikiSkill]]、[[SKILL.state]] 两篇 Google 论文页；抽象并新增统摄性概念页 [[执行层与知识层分离]]；回补 [[EvoSkill]] 的「后续进展」与 [[自进化技能]] 的方案 3；主线二重整
- 2026-09-02: 补建高优先死链 [[楼澈]]（8 次引用）；连带补建 [[Lunar]]（5 次引用，避免新死链）；记录协作偏好与工作方式约定
- 2026-08-30: 新增 [[运营Agent对抗测试系统]]（楼澈×Lunar 方案设计，挂入主线三）
- 2026-08-30: 新增 [[PRAXIST]]；新增 [[TencentDB-Agent-Memory]]、[[MemQ]]、[[harden-v0]]；目录结构统一（Projects 并入 Entities/Projects）；重建索引
- 2026-04-20: 新增 [[EverOS]]
- 2026-04-16: 新增 [[VAKRA-Benchmark]]
- 2026-04-14: 新增 [[达尔文.skill]]、[[EvoSkill]]、[[EvoSkills]]、[[协同进化验证]]、[[自进化技能]]
- 2026-04-13: 初始化，首批页面（AI 研发范式、自主进化、Hermes Agent、Nous Research、gbrain、Garry Tan、编译真相 + 时间线、LLM Wiki (Karpathy)）

---

*此索引由 LLM 自动维护*
