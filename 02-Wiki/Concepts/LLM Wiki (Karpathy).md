---
type: concept
created: 2026-04-13
modified: 2026-04-13T23:10:00+08:00
tags: [concept, knowledge-management, ai-agent, karpathy, auto-generated]
aliases: [Karpathy LLM Wiki, LLM Wiki Pattern, LLM 知识库模式]
status: published
confidence: 0.95
---

# LLM Wiki (Karpathy)

## 编译真相
> LLM Wiki 是由 Andrej Karpathy 提出的 AI 知识库架构模式，核心理念是让 LLM 作为"全职图书管理员"，增量编译和维护持久化知识库，而非每次查询时重新检索原始文档。48 小时内获得社区 5,000 星关注。

## 核心定义

**LLM Wiki** 是一种替代传统 RAG 的知识管理架构：

| 类比 | 传统编译 | LLM Wiki |
|------|---------|---------|
| **源代码** | 原始代码文件 | 原始文章/文档 |
| **编译器** | 编译器 (GCC 等) | LLM (GPT/Claude 等) |
| **可执行文件** | 编译后的二进制 | 结构化 Wiki 页面 |
| **运行** | 执行程序 | 查询 Wiki |

**核心优势**:
- ✅ 知识持久化 — 编译后永久存在，无需每次重新检索
- ✅ 交叉引用 — 自动建立知识关联
- ✅ 矛盾检测 — Lint 检查发现冲突
- ✅ 持续演化 — 越用越聪明，知识复利

---

## 社区标准能力 (7 项)

根据社区共识，完整的 LLM Wiki 应包含以下 7 项核心能力：

### 1. 信心评分 (Confidence Scoring) ✅
> 每个事实携带信心分数 — 来源数量、最后确认时间、矛盾标记

**我们的实现**:
```yaml
---
confidence: 0.8
status: draft  # draft/published/archived
modified: 2026-04-13
---
```

**状态**: ✅ 已实现  
**差距**: 缺少来源数量统计、最后确认时间自动更新、矛盾标记

---

### 2. 记忆分层 (Memory Tiers) ✅
> 工作记忆 → 情景记忆 → 语义记忆 → 程序性记忆

**我们的实现**:
```
L1 工作记忆  → SESSION-STATE.md (当前任务状态)
L2 情景记忆 → memory/YYYY-MM-DD.md (每日原始日志)
L3 语义记忆 → MEMORY.md (提炼的长期知识)
```

**状态**: ✅ 已实现 (3 层)  
**差距**: 缺少程序性记忆 (工作流/SOP 存储)

---

### 3. 知识图谱 (Knowledge Graph) 🟡
> 带类型的实体和带类型的关系，而非带链接的平面页面

**我们的实现**:
```markdown
[[Garry Tan]] -- 开发者 --> [[gbrain]]  (理想)
[[Garry Tan]]  (当前，无类型链接)
```

**状态**: 🟡 部分实现  
**差距**: 
- ❌ 缺少关系类型 (knows/worked_at/invested_in/developed)
- ❌ 缺少实体类型索引
- ✅ 双向链接已实现
- ✅ Obsidian 图谱视图可用

---

### 4. 混合检索 (Hybrid Search) 🟡
> BM25 处理关键词 + 向量处理语义 + 图遍历处理结构，通过 RRF 融合

**我们的实现**:
```
当前：memory_search (语义检索，基于 OpenAI Embeddings)
缺失：BM25 关键词检索、图遍历、RRF 融合
```

**状态**: 🟡 部分实现  
**差距**: 
- ❌ 缺少 BM25 关键词检索
- ❌ 缺少图遍历 (关系路径查询)
- ❌ 缺少 RRF 融合算法

**参考实现**: [[gbrain]] 的混合搜索 (关键词 + 向量+RRF)

---

### 5. 自动化钩子 (Automated Hooks) ✅
> 自动摄入、自动压缩、定时 lint/整合/衰减

**我们的实现**:
```yaml
Hook 系统:
  - session-end: 实体提取 + 页面创建
  - daily-diary: 17:52 Cron → 飞书知识库
  - Heartbeat: 12 小时 → Lint 检查 + 安全扫描
  - self-improvement: 学习捕获 → .learnings/

Cron 任务:
  - 每日发现日记: 17:52
  - Heartbeat: 每 12 小时
  - AI 新闻晨报: 07:22
```

**状态**: ✅ 已实现  
**覆盖**: 自动摄入 ✅、自动压缩 ✅、定时 Lint ✅

---

### 6. 遗忘曲线 (Forgetting Curves) ❌
> 数月未强化的事实会衰减 (降权，不删除)

**我们的实现**: ❌ 未实现  
**现状**: 所有记忆永久保存，无衰减机制

**可实现方案**:
```yaml
# Frontmatter 添加
last_accessed: 2026-04-13
access_count: 5
weight: 1.0  # 每月未访问 * 0.9

# Heartbeat 检查
if days_since_access > 90:
  weight *= 0.9  # 降权但不删除
```

**状态**: ❌ 缺失  
**优先级**: P1 (低难度，中价值)

---

### 7. 矛盾消解 (Contradiction Resolution) 🟡
> AI 根据来源时效性、权威性和证据消解矛盾

**我们的实现**:
```
✅ Lint 检测 (Heartbeat 扫描矛盾)
❌ 自动消解逻辑
❌ 来源权威性评分
❌ 时效性权重
```

**状态**: 🟡 部分实现  
**差距**: 能检测矛盾，但需人工处理，缺少自动消解

---

## 实现状态总览

| # | 能力 | Karpathy 原始 | 社区标准 | 我们的实现 | 状态 |
|---|------|--------------|---------|-----------|------|
| 1 | 信心评分 | ❌ | ✅ | ✅ | ✅ 已实现 |
| 2 | 记忆分层 | ❌ | ✅ | ✅ (3 层) | ✅ 已实现 |
| 3 | 知识图谱 | ❌ | ✅ | 🟡 (无类型) | 🟡 部分实现 |
| 4 | 混合检索 | ❌ | ✅ | 🟡 (语义) | 🟡 部分实现 |
| 5 | 自动化钩子 | ⚠️ Lint | ✅ | ✅ | ✅ 已实现 |
| 6 | 遗忘曲线 | ❌ | ✅ | ❌ | ❌ 缺失 |
| 7 | 矛盾消解 | ⚠️ Lint | ✅ | 🟡 (检测) | 🟡 部分实现 |

**综合实现率**: **71%** (5/7 已实现或部分实现)

---

## 与相关项目对比

| 能力 | 我们 | [[gbrain]] | [[Hermes Agent]] | Karpathy 原始 |
|------|------|-----------|-----------------|--------------|
| 信心评分 | ✅ | ⚠️ | ⚠️ | ❌ |
| 记忆分层 | ✅ (3 层) | ⚠️ (2 层) | ✅ | ❌ |
| 知识图谱 | 🟡 | ✅ | ⚠️ | ❌ |
| 混合检索 | 🟡 | ✅ | ❌ | ❌ |
| 自动化钩子 | ✅ | ✅ | ✅ | ⚠️ |
| 遗忘曲线 | ❌ | ❌ | ❌ | ❌ |
| 矛盾消解 | 🟡 | ✅ | ⚠️ | ⚠️ |
| **综合** | **71%** | **85%** | **65%** | **30%** |

---

## 后续实现计划

### P0 (高优先级)
- [ ] **知识图谱关系类型**
  - 定义关系类型：knows/worked_at/invested_in/developed/references
  - 更新实体提取 Hook，自动标注关系类型
  - Obsidian Dataview 查询支持

### P1 (中优先级)
- [ ] **遗忘曲线**
  - Frontmatter 添加 `last_accessed`、`access_count`、`weight`
  - Heartbeat 添加衰减逻辑
  - 检索时按权重排序

### P2 (低优先级)
- [ ] **混合检索增强**
  - 集成 BM25 (如 Fuse.js)
  - 实现图遍历查询
  - RRF 融合算法

- [ ] **矛盾消解自动化**
  - 来源权威性评分
  - 时效性权重计算
  - 自动消解策略

---

## 时间线
<!-- 追加式记录，只增不改 -->
- 2026-04-06: 首次调研 LLM Wiki (来源：[[llm-wiki-research.md]])
- 2026-04-13: 创建 Obsidian LLM Wiki 项目 (来源：[[楼澈]])
- 2026-04-13: 社区 7 项能力标准确认 (来源：用户输入)
- 2026-04-13: 创建概念页面归档 (来源：[[LLM Wiki]])

## 关联实体
<!-- LLM 自动构建的双向链接 -->
- **提出者**: [[Andrej Karpathy]]
- **相关项目**: [[gbrain]], [[Hermes Agent]], [[OpenClaw]]
- **相关概念**: [[自主进化]], [[编译真相 + 时间线]], [[三层记忆体系]]
- **实现技术**: [[Obsidian]], [[Git]], [[OpenAI Embeddings]]

## 来源
- https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
- https://x.com/heynavtoor/status/2043321909971202403
- Towards AI: "Andrej Karpathy Killed RAG. Or Did He?"
- 用户输入：社区 7 项能力标准

---
*此页面由 LLM 自动维护 | 最后更新：2026-04-13*
