---
type: project
source: https://github.com/TencentCloud/TencentDB-Agent-Memory
author: TencentCloud (腾讯云)
created: 2026-08-30
tags: [ai-agent, memory, memory-hub, team-collaboration, llm-wiki, code-graph, skill-library]
related: [[EverOS]], [[Hermes Agent]], [[自进化技能]], [[LLM Wiki (Karpathy)]], [[MemQ]]
status: analyzing
---

# TencentDB Agent Memory

**来源**: [TencentCloud/TencentDB-Agent-Memory](https://github.com/TencentCloud/TencentDB-Agent-Memory)
**协议**: MIT License
**当前版本**: v2.0.1（2026-08-25）
**定位**: AI Agent 的团队级记忆中枢（Memory Hub）

---

## 📋 核心理念

> "Stop retraining every Agent. Give it the save file."

将对话、文档和代码转化为**四种可治理、可共享、可装备的记忆资产**，在多个 Agent 和框架之间复用，减少重复劳动：

```
已有信息 → 可复用记忆资产 → 更少轮次 → 更少返工 → 更稳定的结果和更高的效率
```

任何能帮助下一个 Agent 避免重复造轮子的信息，都应被保存、组织和复用。

---

## 🏗️ 四种记忆资产

| 资产 | 说明 |
|------|------|
| 🧠 **Chat Memory** | 保留偏好、事实、决策和交互历史；Agent 创建时自动获得专属记忆 |
| ⚡ **Skill** | 从对话和工具调用中提取可复用技能，含版本、资源文件、触发边界、执行步骤和验证规则；私有技能审核后可共享给团队 |
| 📖 **LLM-Wiki** | 将产品文档、设计规范、运维手册转化为带链接图的结构化页面（灵感来自 Karpathy 的 LLM 知识库） |
| 🔍 **CodeGraph** | 索引代码符号、文件、调用关系和影响路径；修改代码前可做影响分析 |

---

## 🧬 分层记忆体系（L0-L3）

| 层级 | 存储内容 | 用途 |
|------|---------|------|
| **L0 Conversation** | 带完整上下文的原始对话 | 验证确切措辞、时间戳、来源 |
| **L1 Atom** | 提取出的事实、偏好、约束、事件 | 精确召回可操作信息 |
| **L2 Scenario** | 围绕项目/场景组织的知识块 | 快速恢复工作上下文 |
| **L3 Core/Persona** | 长期画像、稳定模式、高层认知 | 快速进入用户和团队的语境 |

检索策略：L2/L3 提供快速上下文引导；需要具体事实时通过 **BM25 + 向量检索 + RRF** 回落到 L1/L0。结果受条目数上限、字符预算和超时限制约束。

---

## ✨ 核心特性

### 1. 零侵入集成
一个 Proxy，协议不变，零代码——只需将 Agent 的 base URL 指向 Proxy。已支持：DeepSeek Harness、Claude Code、Codex、CodeBuddy、WorkBuddy、Hermes、OpenClaw、Pi agent。

### 2. 冷启动友好
- 代码库 → CodeGraph 自动索引
- 文档/文件 → Wiki 自动生成结构化页面
- 历史对话 → 自动提取 Skill 和 Chat Memory

### 3. 共享经验而不共享隐私
四级可见性：`private` / `team` / `restricted`（ACL 精确授权）/ `agent`（定向装备）。共享是显式动作而非默认泄露。

### 4. 与标准 RAG 的区别
RAG 只回答"能找到什么"，本项目还回答"**谁能用、哪个版本有效、应该分发给哪个 Agent**"——提供所有权、版本、状态、使用次数和 Agent 绑定管理。

### 5. 记忆是装备（Loadout）而非全局 Prompt
通过 Fixed Binding + ACL 决定 Agent 可用资产；切换 Agent/框架只需重新装备。知识按需调用（`/v3/tools/list` → `/v3/tools/call`），不整体注入上下文。

---

## 📊 实测效果

| 基准 | 未启用 | 启用后 | 相对提升 |
|------|--------|--------|---------|
| PersonaMem | 48% | 76% | **+59%** |

---

## 🏗️ 仓库结构

| 组件 | 作用 |
|------|------|
| `MemoryCore` | 核心内核（isolation、pi-plugin 等） |
| `MemoryKnowledge` | 知识服务 |
| `MemoryPanel` | 管理面板前端（localhost:8125） |
| `MemoryProxy` | 代理服务 |

一键启动：`./start-all.sh`（memory-core + memory-hub + proxy 三服务）。

---

## ⚠️ 局限与注意

- Wiki 和 CodeGraph 为**异步构建**，达到 ready 状态需要处理时间
- CodeGraph 优先支持公共 HTTPS 仓库，私有仓库/SSH 凭证支持仍在完善
- 支持手动资产绑定，全自动记忆路由仍在迭代中

---

## 💡 与本 Wiki 主题的关联

- **EverOS**（记忆操作系统）同属 Agent 记忆系统赛道，可对比架构差异：EverOS 侧重单 Agent 自进化记忆，TencentDB Agent Memory 侧重**团队级资产治理与多 Agent 共享**
- 其 **LLM-Wiki 资产**的设计直接受 [[LLM Wiki (Karpathy)]] 思想影响——本 Wiki 正是该思想的实践
- **Skill 资产**（版本、验证规则、审核共享）与 [[自进化技能]] / [[EvoSkill]] 的技能生命周期管理可互相印证
- 其致谢了 [[Hermes Agent]]（Nous Research）的 Skill 相关代码

---

## 🔗 相关页面

- [[EverOS]] — 自进化 Agent 记忆操作系统
- [[Hermes Agent]] — Skill 代码来源
- [[MemQ]] — 同属 Agent 记忆方向（学习型检索）
- [[LLM Wiki (Karpathy)]] — Wiki 资产的思想源头
- [[自进化技能]] — Skill 资产的概念关联

---

## 📝 变更日志

### [2026-08-30] create | 初始创建

- ✅ 分析 README，记录四种记忆资产与 L0-L3 分层体系
- ✅ 记录零侵入集成与权限治理特性
- ✅ 建立与 EverOS / Hermes / Karpathy LLM Wiki 的双向链接

**下一步**:
- [ ] 与 [[EverOS]] 做架构对比表
- [ ] 本地部署试用（Docker 一键启动）
- [ ] 评估 CodeGraph 对本 Wiki 仓库自身的索引效果

---

*由 LLM 自动维护 | 最后更新：2026-08-30*
