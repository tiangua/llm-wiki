---
type: project
source: https://huggingface.co/blog/ibm-research/vakra-benchmark-analysis
author: IBM Research
created: 2026-04-16
tags: [benchmark, ai-agent, evaluation, tool-use, reasoning, enterprise-ai]
related: [[AI-Agent-Evaluation]], [[Tool-Use-Benchmarks]], [[OSWorld]], [[WebVoyager]]
status: analyzing
---

# VAKRA Benchmark

**来源**: [IBM Research](https://huggingface.co/blog/ibm-research/vakra-benchmark-analysis)  
**数据集**: [ibm-research/VAKRA](https://huggingface.co/datasets/ibm-research/VAKRA)  
**LeaderBoard**: [ibm-research-vakra.hf.space](https://ibm-research-vakra.hf.space/)  
**GitHub**: [IBM/vakra](https://github.com/IBM/vakra)  
**定位**: 企业级 AI Agent 工具推理与执行能力基准测试

---

## 📋 核心理念

> **VAKRA exposes a critical gap between surface-level tool competence and robust, end-to-end agent reliability.**

**VAKRA 揭示了表面工具能力与端到端 Agent 可靠性之间的关键差距。**

### 问题背景
- 传统基准测试孤立技能（单一问答）
- 现代模型可以执行孤立工具调用
- **但企业部署需要组合推理 + 策略遵循 + 多源融合**

### 核心创新
**VAKRA 是可执行基准，评估完整执行轨迹，而非仅最终答案。**

---

## 🏗️ 核心特性

| 特性 | 说明 |
|------|------|
| **可执行环境** | 8,000+ 本地托管 API，62 个领域 |
| **组合推理** | 任务需要 3-7 步推理链 |
| **全轨迹评估** | 工具调用 + 输入 + 中间结果 + 最终答案 |
| **真实数据库** | 结构化 API + 非结构化文档检索 |
| **策略约束** | 部分任务需遵循工具使用策略 |

---

## 📊 规模统计

| 指标 | 数值 |
|------|------|
| 总样本数 | 5,187 |
| API 数量 | 8,000+ |
| 领域覆盖 | 62 |
| 推理链长度 | 3-7 步 |

---

## 🎯 四大能力测试

### 概览

| 能力 | 测试内容 | 样本数 | 领域数 | 难度 |
|------|---------|--------|--------|------|
| **Capability 1** | API 链式调用 | 2,077 | 54 | ⭐⭐ |
| **Capability 2** | 工具选择 | 1,597 | 17 | ⭐⭐⭐ |
| **Capability 3** | 多跳推理 | 869 | 38 | ⭐⭐⭐⭐ |
| **Capability 4** | 多源 + 策略 | 644 | 41 | ⭐⭐⭐⭐⭐ |

### Capability 1: API Chaining

**测试**: 使用商业智能 API 进行链式调用

- **工具集**: SLOT-BIRD + SEL-BIRD
- **工具链长度**: 1-12 个工具调用
- **示例**:
  ```
  查询："哪支足球队进攻速度=31、盘带=53、传球=32？"
  步骤：get_data → filter(speed=31) → filter(dribble=53) → filter(passing=32) → get_team_name
  答案："FC Barcelona"
  ```

### Capability 2: Tool Selection

**测试**: 从大量工具中选择正确的 Dashboard API

- **工具集**: REST-BIRD（扩展版）
- **工具数量**: 每领域 6-328 个（平均 116 个）
- **约束**: OpenAI API 限制最多 128 个工具 → 需要短列表机制

### Capability 3: Multi-Hop Reasoning

**测试**: 使用 Dashboard API 进行多跳推理

- **工具集**: REST-BIRD
- **跳数**: 1-5 个逻辑跳
- **挑战**: 需要提取并组合多个证据

### Capability 4: Multi-Hop + Multi-Source + Policy

**测试**: 最复杂的能力测试

| 维度 | 说明 |
|------|------|
| **Multi-Source** | API + 文档索引（RAG）混合 |
| **Multi-Turn** | 对话式多轮交互 |
| **Policy** | 工具使用策略约束 |

**示例策略**:
> "If a user's query pertains to Technology & Software... make sure you try answering them by only using document retrievers."

---

## 📈 评估框架

### 瀑布式评估流程

```
┌─────────────────────────────────────────┐
│ Step 1: Policy Adherence (仅能力 4)      │
└──────────────┬──────────────────────────┘
               ▼
┌─────────────────────────────────────────┐
│ Step 2: Tool-Sequence Comparison        │
│ (支持替代但有效的推理路径)               │
└──────────────┬──────────────────────────┘
               ▼
┌─────────────────────────────────────────┐
│ Step 3: Final Response Evaluation       │
│ (LLM 法官：依据性 + 事实一致性)           │
└─────────────────────────────────────────┘
```

### 评分公式

**Leaderboard 分数**:
$$\text{Score} = \frac{1}{4} \sum_{n=1}^{4} \text{Capability}_n$$

**能力 4 加权**（多源查询更复杂）:
$$\text{Capability}_4 = \frac{\#\text{correct multi-source} \times 2 + \#\text{correct other}}{\#\text{total multi-source} \times 2 + \#\text{total other}}$$

---

## ❌ 错误分析

### 失败阶段隔离

```
工具选择错误 → 参数名错误 → 参数值错误 → 答案综合错误
   (优先)         ↓             ↓            ↓
              不重复计数      不重复计数    最终评估
```

### 关键发现

| 发现 | 说明 |
|------|------|
| **GPT-OSS-120B 最佳** | 工具 schema 理解最好，参数选择鲁棒 |
| **跳数影响** | 1-hop > 2-hop > 3+ hop（所有模型递减） |
| **策略约束** | 限制最相关信息源时性能大幅下降 |
| **答案综合** | 即使工具调用正确，仍难以综合答案 |

### 模型对比

| 模型 | 最佳能力 | 主要问题 |
|------|---------|---------|
| GPT-OSS-120B | Capability 1 | 1-hop RAG 跳过工具 |
| Gemini-3-flash-preview | Capability 2 | 答案综合 |
| Claude-Sonnet-4-5 | - | 答案综合 |

---

## 💡 对 AI 研发新范式的启发

### 1. 组合推理是核心瓶颈

**VAKRA 发现**: 孤立工具调用 ✓ vs 组合推理 ✗

**新范式方向**:
- 推理链分解训练
- 中间验证机制
- 错误累积缓解

### 2. 可执行环境是关键

**VAKRA 创新**: 8,000+ 可执行 API + 真实数据库

**新范式方向**:
- 构建沙箱测试环境
- 执行中心评估框架
- 自动化评估管道

### 3. 策略遵循是部署关键

**VAKRA 发现**: 模型难以整合外部约束

**新范式方向**:
- 约束感知推理架构
- 策略 - 动作对齐检查
- 违反约束检测

### 4. 多源融合是趋势

**VAKRA 发现**: API-only > RAG-only > Hybrid

**新范式方向**:
- 源感知路由
- 跨源验证
- 冲突解决

### 5. 评估框架设计参考

| VAKRA 创新 | 可借鉴 |
|-----------|-------|
| 瀑布式评估 | ✅ 分阶段验证 |
| 执行验证 | ✅ 相同环境执行 |
| 替代路径支持 | ✅ 不强制严格匹配 |
| LLM 法官 | ✅ 处理语义等价 |
| 错误阶段隔离 | ✅ 归类到最早失败点 |

---

## ⚠️ 局限性与风险

| 局限性 | 说明 |
|--------|------|
| **企业场景聚焦** | 主要测试商业智能 API，可能不适用于所有领域 |
| **评估成本高** | 可执行环境需要本地部署 8,000+ API |
| **模型覆盖有限** | 仅评估了 4 个模型，需要更多对比 |

---

## 🔗 相关页面

- [[AI-Agent-Evaluation]] — AI Agent 评估方法
- [[Tool-Use-Benchmarks]] — 工具使用基准对比
- [[OSWorld]] — 计算机使用基准
- [[WebVoyager]] — Web 导航基准
- [[Enterprise-AI-Deployment]] — 企业级 AI 部署（待创建）

---

## 📝 变更日志

## [2026-04-16 10:30] create | 初始创建

- ✅ 分析 VAKRA 博客文章
- ✅ 记录四大能力测试
- ✅ 整理评估框架
- ✅ 总结错误分析
- ✅ 提炼对 AI 研发新范式的启发
- ✅ 建立双向链接

**下一步**:
- [ ] 对比 VAKRA 与其他基准（OSWorld, WebVoyager）
- [ ] 探索是否可复现部分测试
- [ ] 设计新范式评估框架原型

---

*由 LLM 自动维护 | 最后更新：2026-04-16*
