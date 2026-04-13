---
type: project
created: 2026-04-13
modified: 2026-04-13T18:52:00+08:00
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
