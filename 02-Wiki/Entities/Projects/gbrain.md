---
type: project
created: 2026-04-13
modified: 2026-04-13T19:04:00+08:00
tags: [project, ai-agent, knowledge-base, auto-generated]
aliases: [GBrain, Garry's Brain]
status: draft
confidence: 0.9
---

# gbrain

## 编译真相
> gbrain 是由 Garry Tan 开发的个人 AI 记忆系统，让 AI Agent 拥有持续增长的私人知识库。核心设计是「编译真相 + 时间线」双段结构，混合搜索 (关键词 + 向量+RRF)，以及自动实体检测和交叉引用。

## 详细信息

**开发者**: [[Garry Tan]]  
**许可证**: MIT  
**仓库**: https://github.com/garrytan/gbrain  
**文档**: https://github.com/garrytan/gbrain/blob/master/docs/GBRAIN_SKILLPACK.md

**核心特点**:

### 1. 架构设计
```
┌──────────────────┐    ┌──────────────────┐    ┌──────────────────┐
│   Brain Repo     │    │     GBrain       │    │    AI Agent      │
│   (git/markdown) │───>│   (检索层)        │<──>│  (读/写执行)     │
│   真相来源        │    │ Postgres+pgvector│    │  实体检测/丰富   │
└──────────────────┘<───│   混合搜索        │    └──────────────────┘
                       └──────────────────┘
```

### 2. 存储引擎
- **PGLite 默认** — 嵌入式 Postgres，无需服务器，2 秒启动
- **可迁移 Supabase** — 大规模时迁移到托管 Postgres ($25/月)
- **混合搜索** — 关键词 (tsvector) + 向量 (HNSW) + RRF 融合

### 3. 页面结构
```markdown
---
type: person
title: 张三
---

[编译真相] — 当前最佳理解，可重写

---

[时间线] — 追加式证据链，只增不改
- 2025-01-15: 第一次会议
- 2025-03-20: 跟进讨论
```

### 4. 实体检测
- 自动从对话中提取人/公司/概念
- 自动建立交叉引用链接
- 关系图谱遍历 (递归 CTE)

### 5. 集成能力
| 集成 | 功能 |
|------|------|
| Voice-to-Brain | 电话通话 → 脑页面 (Twilio + OpenAI Realtime) |
| Email-to-Brain | Gmail → 实体页面 |
| Calendar-to-Brain | 日历 → 可搜索日程 |
| X-to-Brain | 推文 → 脑页面 |
| Meeting Sync | 会议转录 → 脑页面 |

---

## 核心命令

```bash
# 安装
git clone https://github.com/garrytan/gbrain.git ~/gbrain
cd ~/gbrain
bun install && bun link

# 初始化
gbrain init              # PGLite (默认)
gbrain init --supabase   # Supabase 托管

# 导入
gbrain import ~/brain/ --no-embed
gbrain embed --stale

# 查询
gbrain query "这些文档的关键主题是什么？"
gbrain search "关键词"
gbrain get "页面 slug"

# 维护
gbrain doctor --json     # 健康检查
gbrain sync              # Git 到脑增量同步
```

---

## 与 OpenClaw 对比

| 维度 | OpenClaw | gbrain |
|------|----------|--------|
| **定位** | Agent 运行时 + 技能系统 | 个人知识库 + 检索层 |
| **记忆** | 三层记忆 (L1/L2/L3) | 编译真相 + 时间线 |
| **存储** | Markdown 文件 | Postgres + pgvector |
| **检索** | memory_search (语义) | 混合搜索 (关键词 + 向量+RRF) |
| **部署** | Gateway + 本地 | PGLite 本地 / Supabase 托管 |
| **实体检测** | 待实现 | 内置 CLI + MCP 工具 |
| **集成** | 飞书为主 | Gmail/Calendar/Twitter/Voice |

---

## 与 LLM Wiki (Karpathy) 对比

| 维度 | LLM Wiki | gbrain |
|------|----------|--------|
| **理念** | LLM 作为图书管理员 | LLM 作为检索 + 写入代理 |
| **结构** | Raw Sources + Wiki + Schema | Brain Repo + GBrain + Agent |
| **存储** | Markdown (Obsidian) | Postgres + pgvector |
| **检索** | LLM 语义理解 | 混合搜索 (RRF 融合) |
| **维护** | Lint 检查 | gbrain doctor + 梦境周期 |

---

## 自主进化关联

gbrain 的「自主进化」体现在：

| 机制 | 实现方式 |
|------|---------|
| **自动写入** | 每次对话后更新脑页面 |
| **实体检测** | 自动提取人/公司/概念 |
| **交叉引用** | 自动建立关系链接 |
| **梦境周期** | 夜间自动整理/丰富/修复 |
| **知识复利** | 越用越聪明，零起点不再 |

与我们的 [[自主进化]] 对比：
- **相似点**: 都强调自动写入、周期性维护、知识累积
- **差异点**: gbrain 侧重外部世界知识，我们侧重 Agent 内部状态
- **互补性**: 两者可结合使用

---

## 时间线
<!-- 追加式记录，只增不改 -->
- 2026-04-13: 首次调研 gbrain (来源：[[LLM Wiki]])
- 2026-04-13: 讨论与 OpenClaw 的适用性 (来源：[[楼澈]])
- 2026-04-13: 创建 Wiki 页面归档 (来源：[[LLM Wiki]])

## 关联实体
<!-- LLM 自动构建的双向链接 -->
- **相关人**: [[Garry Tan]]
- **相关技术**: [[PGLite]], [[Supabase]], [[pgvector]]
- **相关概念**: [[编译真相 + 时间线]], [[混合搜索]], [[自主进化]]
- **对比项目**: [[OpenClaw]], [[LLM Wiki]], [[Hermes Agent]]

## 来源
- https://github.com/garrytan/gbrain
- https://github.com/garrytan/gbrain/blob/master/docs/GBRAIN_SKILLPACK.md

---
*此页面由 LLM 自动维护 | 最后更新：2026-04-13*
