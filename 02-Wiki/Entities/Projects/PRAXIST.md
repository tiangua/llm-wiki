---
type: project
source: https://github.com/sapientinc/PRAXIST
author: Sapient Intelligence Pte Ltd
created: 2026-08-30
tags: [ai-agent, autonomous-research, lineage, evidence-graph, self-evolving, quality-diversity, mle-bench, codex]
related: [[MemQ]], [[TencentDB-Agent-Memory]], [[达尔文.skill]], [[EverOS]], [[自主进化]], [[harden-v0]]
status: analyzing
---

# PRAXIST

**来源**: [sapientinc/PRAXIST](https://github.com/sapientinc/PRAXIST)
**论文**: [Praxist: From Experimental Artifacts to Solution Lineages](https://arxiv.org/abs/2608.25955) (arXiv:2608.25955, 2026-08-26)
**协议**: Fair Source License 1.0（年收入 <100 万美元可免费商用；学术研究不受限）
**版本**: v0.5.0（2026-08-27 首发）
**定位**: 自主研究编排系统——"你个人的研发团队"，把研究做成有世系（lineage）、可审计的持久过程

---

## 📋 核心理念

> 现有自主 R&D Agent 大都是"实验室仪器"：每次尝试近乎自包含，日志和搜索树只记录**发生了什么**，无法回答**哪个设计元素带来了提升、证据是否通过验证、如何与其他元素重组**。长周期研究因此反复重学同样的教训。

**Praxist 的答案**：以 **lineage（世系）为中心**——把可复现工件和评估结果转化为**类型化证据图**（findings / lane-structured frontiers / agendas），本地工件构建与队列级证据合成分离，让后续尝试继承"已验证的机制、未解决的假设、有用的约束"。

**适用三条件**（同时满足时最有价值）：
1. 目标可测量（有能区分好坏的指标）
2. 项目已可运行（基线代码、环境、数据就位）
3. 最优路径未知

不满足前提时会停下来告诉你缺什么——不静默下载数据集、不编造基线性能。

---

## 🏗️ 关键特性

| 特性 | 说明 |
|------|------|
| **并行研究对等体** | 并发探索竞争性假设与实现方案 |
| **多代合成** | 有用的证据和策略传递到后续世代 |
| **持久证据通道** | incubator / frontier / Gems 三状态保留候选方案 |
| **多指标评估** | 排序任务定义的证据，含帕累托最优权衡 |
| **QD + DIG** | Quality-Diversity 分配器 + Deep Innovation Gate，跳出局部最优 |
| **中央资源调度** | 按观测到的资源压力调整实验准入 |
| **恢复/重放/监控** | 长期研究可检查、可恢复 |
| **插件边界** | 支持多运行时、提供商、工具、预算、工作流 |

---

## 🧬 研究循环

```
可运行项目 + 可测量目标
        ↓
并行研究对等体 → 候选方案
        ↓
评估器 → 结构化证据（类型化证据图）
        ↓
规划面板 → 合成下一代研究议程（agendas）
        ↓
循环继续（直到收敛或预算耗尽）
```

**与 Codex 的分工**：Codex 保持交互式代理角色（理解项目、沟通、用开发工具），Praxist 负责持久研究循环、并行对等体、证据协议、调度与生命周期。Codex-native 模式无需 API key（复用已登录会话）。

**职责边界**：Praxist 不内置任务特定假设——任务是"应该测什么、什么算有效证据"的唯一真理来源。

---

## 📊 实验结果（MLE-bench，75 任务）

| 指标 | Praxist | Claude Code 基线 (Opus 4.8) |
|------|---------|---------------------------|
| 奖牌数 | **60（80.0%）** | 55（73.3%） |
| 金牌数 | **49** | 34 |
| 模型花费 | **$3,054** | $38,370 |

**约 1/12 成本拿到更强结果**，每个结果挂在可审计的 lineage 上。

**四个开放式工程案例**（全部超越任务原生基线，发现路径留档）：
- 量化交易
- LiDAR-惯性-视觉 SLAM
- 托卡马克磁控（tokamak magnetic control）
- 火箭着陆（仓库自带 `rocket_booster_recovery` 的 Python/JAX 与 Rust 双实现示例）

---

## ⚙️ 工程要点

- 安装：`pip install "praxist[agents,codex]" && praxist setup --interactive --install-skills codex`
- 内置技能族：`praxist-takeover`（接管）、`praxist-control`（启停/恢复/监控）、`praxist-diagnostic`（健康诊断）、`praxist-scientific-research`（带来源的文献与基准上下文收集）等
- 运行管理：`praxist status --json` / `--monitor` / `stop` / `resume`
- 数据保护：不修改原始项目（运行产物分离存储）、API key 掩码输入、不收集实验数据
- 结果可信度三保障：预注册（pre-registration）、一致评估、端到端溯源

---

## 💡 与本 Wiki 主题的关联

- **lineage 证据图** 与 [[MemQ]] 的溯源 DAG 是同一问题的两个尺度：MemQ 归因"哪条记忆催生了后续成功"，Praxist 归因"哪个设计元素带来了工件提升"——两者都用**结构化的依赖图**替代扁平日志
- 与 [[TencentDB-Agent-Memory]] 呼应：TencentDB 把记忆资产化（四种资产 + 分层检索），Praxist 把**研究证据资产化**（findings/frontiers/agendas 三类节点，可继承、可审计）
- 研究循环的世代合成是 [[达尔文.skill]] / [[EvoSkill]] 棘轮机制在**研究过程**维度的推广——不是进化单个 Agent 的技能，而是进化整个解决方案谱系
- 其"结果必须可审计溯源"的立场与 [[harden-v0]] 的对抗式验证互补：一个防基准被欺骗，一个防改进归因被伪造
- 1/12 成本的实证也印证了 [[自主进化]] 的一个论点：结构化地复用已验证经验，比重复试错便宜一个数量级

---

## 🔗 相关页面

- [[MemQ]] — 记忆尺度上的溯源信用分配
- [[TencentDB-Agent-Memory]] — 记忆/证据资产化的治理视角
- [[达尔文.skill]] — 技能棘轮进化
- [[EverOS]] — 记忆操作系统
- [[自主进化]] — 宏观范式
- [[harden-v0]] — 结果可信度保障的互补方向

---

## 📝 变更日志

### [2026-08-30] create | 初始创建

- ✅ 分析 README 与论文摘要，记录核心机制（类型化证据图 + 世代合成 + QD/DIG）
- ✅ 整理 MLE-bench 对比数据与四个工程案例
- ✅ 建立与记忆/自进化主题网络的双链

**下一步**:
- [ ] 精读论文正文（arXiv:2608.25955），补充证据图的类型系统细节
- [ ] 跑通 `rocket_booster_recovery` 示例，观察 lineage 的实际形态
- [ ] 对比 [[MemQ]] 溯源 DAG 与 Praxist 证据图的形式化差异，考虑写一篇对比概念页

---

*由 LLM 自动维护 | 最后更新：2026-08-30*
