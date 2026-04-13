---
type: project
created: 2026-04-13
modified: 2026-04-13T18:59:00+08:00
tags: [project, ai-agent, nousresearch, auto-generated]
aliases: [Hermes, Hermes-Agent, Nous Hermes]
status: draft
confidence: 0.9
---

# Hermes Agent

## 编译真相
> Hermes Agent 是由 Nous Research 开发的自进化 AI Agent，核心特点是内置学习循环 — 从经验中创建技能、在使用过程中改进技能、持久化知识、搜索历史对话、跨会话构建用户模型。

## 详细信息

**开发者**: [[Nous Research]]  
**许可证**: MIT  
**仓库**: https://github.com/NousResearch/hermes-agent  
**文档**: https://hermes-agent.nousresearch.com/docs/

**核心特点**:

1. **自进化学习循环**
   - 从经验中自动创建技能
   - 技能在使用过程中自我改进
   - 周期性知识持久化提醒
   - 跨会话记忆搜索 (FTS5 + LLM 摘要)
   - [[Honcho]] 方言用户建模

2. **多平台支持**
   - Telegram, Discord, Slack, WhatsApp, Signal, Email
   - 统一网关进程
   - 语音备忘录转录
   - 跨平台对话连续性

3. **终端界面**
   - 完整 TUI
   - 多行编辑、斜杠命令自动补全
   - 对话历史、中断重定向
   - 流式工具输出

4. **灵活部署**
   - 6 种终端后端：本地、Docker、SSH、Daytona、Singularity、Modal
   - 支持 $5 VPS 到 GPU 集群
   - 无服务器持久化 (Daytona/Modal)
   - 空闲时休眠，按需唤醒

5. **模型无关**
   - 支持 Nous Portal、OpenRouter (200+ 模型)、z.ai/GLM、Kimi/Moonshot、MiniMax、OpenAI
   - 无代码切换模型
   - 无厂商锁定

6. **自动化与并行**
   - 内置 cron 调度器
   - 生成式子代理并行工作
   - Python 脚本通过 RPC 调用工具

---

## 核心命令

```bash
# 安装
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash

# 基础使用
hermes                    # 交互式 CLI
hermes model              # 选择 LLM 提供商和模型
hermes tools              # 配置启用的工具
hermes config set         # 设置配置值
hermes gateway            # 启动消息网关
hermes setup              # 完整设置向导
hermes claw migrate       # 从 OpenClaw 迁移
hermes update             # 更新到最新版本
hermes doctor             # 诊断问题
```

---

## 与 OpenClaw 对比

| 维度 | OpenClaw | Hermes Agent |
|------|----------|--------------|
| **定位** | Agent 运行时 + 技能系统 | 自进化 Agent + 学习循环 |
| **记忆** | 三层记忆 (L1/L2/L3) | FTS5 搜索 + LLM 摘要 + Honcho |
| **技能** | Markdown 技能文件 | 程序化记忆 + Skills Hub |
| **部署** | Gateway + 本地 | 6 种后端 (含无服务器) |
| **平台** | 飞书为主 | Telegram/Discord/Slack 等 |
| **学习** | self-improvement Hook | 内置学习循环 + 技能自改进 |
| **迁移** | — | `hermes claw migrate` 支持从 OpenClaw 迁移 |

---

## 自主进化能力详细分析

Hermes Agent 的「自主进化」能力是其核心差异化优势，与 [[自主进化]] 概念高度契合。

### Hermes 的自主进化实现

| 进化机制 | Hermes 实现方式 | 效果 |
|---------|----------------|------|
| **经验捕获** | 自动记录复杂任务的执行轨迹 | 形成技能创建的原始素材 |
| **技能创建** | 任务完成后自动生成技能文件 | 无需人工编写，从经验中学习 |
| **技能改进** | 技能在使用过程中自我优化 | 越用越聪明，持续迭代 |
| **知识持久化** | 周期性提醒用户保存重要知识 | 防止关键知识丢失 |
| **跨会话记忆** | FTS5 全文搜索 + LLM 摘要 | 记住历史对话，支持长期上下文 |
| **用户建模** | [[Honcho]] 方言建模 | 跨会话理解用户偏好和行为模式 |

### 与我们的「自主进化」对比

| 维度 | 我们的实现 | Hermes Agent | 差异分析 |
|------|-----------|--------------|---------|
| **学习触发** | Hook 系统 (session-end) | 内置学习循环 (实时) | Hermes 更即时，我们更结构化 |
| **知识存储** | 三层记忆 (Markdown) | FTS5 数据库 + Honcho | 我们更透明可读，Hermes 更高效 |
| **技能形式** | OpenClaw 技能文件 | 程序化记忆 + Skills Hub | 两者都支持标准化技能 |
| **持久化机制** | Heartbeat (12 小时) | 周期性知识提醒 | 理念相似，实现不同 |
| **用户模型** | USER.md + MEMORY.md | Honcho 方言建模 | Hermes 更自动化，我们更可控 |
| **检索能力** | memory_search (语义) | FTS5 + LLM 摘要 | Hermes 支持大规模检索 |

### 核心差异总结

**我们的优势**:
- ✅ **透明度高** — 所有记忆都是可读的 Markdown 文件
- ✅ **可控性强** — 明确的分层和蒸馏规则
- ✅ **飞书集成** — 与沟通工具深度整合
- ✅ **定制灵活** — 可自由调整记忆策略

**Hermes 优势**:
- ✅ **开箱即用** — 学习循环内置，无需配置
- ✅ **实时性强** — 经验 → 技能的转化更即时
- ✅ **多平台原生** — Telegram/Discord 等原生支持
- ✅ **大规模检索** — FTS5 支持海量记忆搜索

### 融合可能性

```
┌─────────────────────────────────────────────────────────┐
│              理想的自主进化系统                          │
├─────────────────────────────────────────────────────────┤
│  我们的三层记忆 (结构化)  +  Hermes 的学习循环 (实时)    │
│  我们的 Markdown 透明性    +  Hermes 的 FTS5 检索效率    │
│  我们的飞书集成          +  Hermes 的多平台支持          │
│  我们的可控性            +  Hermes 的自动化              │
└─────────────────────────────────────────────────────────┘
```

**可借鉴的 Hermes 特性**:
1. 技能自动创建机制 — 从经验中自动生成技能
2. 周期性知识提醒 — 防止重要知识丢失
3. 跨会话检索优化 — FTS5 + LLM 摘要的组合
4. 用户行为建模 — Honcho 的方言学习方法

**可输出的我们的特性**:
1. 三层记忆架构 — 可作为 Hermes 的记忆后端
2. 飞书集成经验 — 帮助 Hermes 支持企业场景
3. Markdown 技能格式 — 与 agentskills.io 标准兼容

---

---

## 时间线
<!-- 追加式记录，只增不改 -->
- 2026-04-13: 调研 Hermes Agent，创建 Wiki 页面 (来源：[[LLM Wiki]])
- 2026-04-13: 讨论与 LLM Wiki 整合方案 (来源：[[楼澈]])

## 关联实体
<!-- LLM 自动构建的双向链接 -->
- **相关组织**: [[Nous Research]]
- **相关技术**: [[Honcho]], [[agentskills.io]]
- **相关概念**: [[自主进化]], [[自学习 Agent]]
- **对比项目**: [[OpenClaw]], [[gbrain]]
- **相关人**: [[楼澈]]

## 来源
- https://github.com/NousResearch/hermes-agent
- https://hermes-agent.nousresearch.com/docs/

---
*此页面由 LLM 自动维护 | 最后更新：2026-04-13*
