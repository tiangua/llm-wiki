---
type: project
source: https://github.com/jwliao-ai/MemQ
author: Junwei Liao et al. (jwliao-ai)
created: 2026-08-30
tags: [ai-agent, memory, q-learning, reinforcement-learning, credit-assignment, self-evolving, episodic-memory]
related: [[自进化技能]], [[自主进化]], [[TencentDB-Agent-Memory]], [[EverOS]]
status: analyzing
---

# MemQ

**来源**: [jwliao-ai/MemQ](https://github.com/jwliao-ai/MemQ)（同步维护于 [SII-MemQ/MemQ](https://github.com/SII-MemQ/MemQ)）
**论文**: [MemQ: Integrating Q-Learning into Self-Evolving Memory Agents over Provenance DAGs](https://arxiv.org/abs/2605.08374) (arXiv:2605.08374)
**协议**: MIT License
**定位**: 将 Q-Learning 引入自进化记忆 Agent，基于溯源 DAG 的多步信用分配

---

## 📋 核心理念

> 现有情景记忆方法将每条记忆**独立对待**——孤立评估检索质量，忽略了"记忆之间通过依赖链催生未来记忆"的结构。

**MemQ 的答案**：用 TD(λ) 资格迹（eligibility traces）更新记忆 Q 值，在**溯源 DAG（provenance DAG）**上反向传播信用——该 DAG 记录了每条新记忆创建时检索了哪些旧记忆。信用权重按 (γλ)^d 随 DAG 深度 d 衰减，用**结构邻近度替代时间距离**。

---

## 🏗️ 关键特性

| 特性 | 说明 |
|------|------|
| **无权重更新** | 冻结 LLM 骨干网络——所有学习都发生在情景记忆的 Q 值上 |
| **溯源 DAG** | 追踪记忆创建的依赖链，支持多步信用分配 |
| **TD(λ) 资格迹** | 信用沿记忆链反向传播，而非仅单步更新 |
| **EC-MDP 形式化** | Exogenous-Context MDP：状态分解为外生任务流 + 内生记忆库 |
| **Q 集成检索** | 两阶段检索：局部性过滤 + Q 引导的 ε-greedy 选择 |

---

## 🧬 核心循环

```
1. Retrieve: 局部性过滤（余弦相似度 ≥ θ）→ Q 引导的 ε-greedy top-k 选择
2. Act:      冻结 LLM 基于检索到的记忆生成轨迹
3. Build:    轨迹压缩为新情景记忆（程序化 / 反思）
4. Update:   计算 TD 误差，沿溯源 DAG 反向 BFS，以 (γλ)^d 衰减累积 ΔQ
```

---

## ⚙️ 算法变体（消融基线）

| 变体 | 说明 |
|------|------|
| `memq` | **MemQ** — TD(λ) 资格迹 + 逐任务 Q 更新 |
| `memrl` | MemRL — 单步 Q 值更新（γ=0） |
| `self_rag` | Self-RAG — 自反思的自适应检索 |
| `rag` | 标准 RAG — 相似度检索 |
| `memp` | MemP — 纯记忆程序化（无 RL） |

## 🔧 关键超参数

| 参数 | 说明 | 典型范围 |
|------|------|---------|
| `alpha` | Q 学习率 | 0.1–0.5 |
| `gamma` | 折扣因子（溯源视野） | 0.3–0.8 |
| `lambd` (λ) | 资格迹衰减 | 0.5–0.9 |
| `weight_q` | 混合评分中 Q 值权重 | 0.0–0.7 |
| `epsilon` | 探索概率 | 0.0–0.1 |

---

## 📊 实验结果

**在全部 6 个基准上均取得最高成功率**（泛化评估与运行时学习两个设定下）：

| 基准 | 领域 | 任务类型 |
|------|------|---------|
| Lifelong Agent Bench (LLAB) | OS 交互 / 数据库 | 多步交互 |
| BFCL | 函数调用 | 多轮 API 调用 |
| GPQA | 科学 QA | 专家级推理 |
| ERQA | 具身推理 | 视觉 + 空间 |
| MMMU Pro | 多模态理解 | 图文 |
| LiveCodeBench | 代码生成 | 编程 |

---

## 💡 与本 Wiki 主题的关联

- **核心洞察**：记忆不是静态检索库，而是**可学习的资产**——Q 值让"哪条记忆值得被复用"变成可优化的问题。这与 [[自进化技能]] 中"技能的价值评估"是同构问题
- **溯源 DAG 的信用分配**回答了 [[EvoSkill]] 式框架的核心难题：一条经验对后续成功的贡献如何归因——MemQ 用结构邻近度 (γλ)^d 而非时间衰减，是值得借鉴的思路
- 与 [[TencentDB-Agent-Memory]] 互补：MemQ 解决"**记忆怎么学**"（检索策略优化），TencentDB Agent Memory 解决"**记忆怎么治理与共享**"（资产化、权限、分发）
- **冻结骨干 + 记忆层学习**是 [[自主进化]] 的一种低成本实现路径——不动模型权重，只进化外部记忆

---

## 🔗 相关页面

- [[自进化技能]] — 技能/记忆的价值评估同构问题
- [[自主进化]] — 冻结骨干 + 外部记忆进化的范式
- [[TencentDB-Agent-Memory]] — 记忆治理与共享（互补方向）
- [[EverOS]] — 记忆操作系统
- [[EvoSkill]] — 失败分析驱动的技能发现

---

## 📝 变更日志

### [2026-08-30] create | 初始创建

- ✅ 分析 README 与论文摘要，记录核心算法（TD(λ) + 溯源 DAG）
- ✅ 整理算法变体与超参数表
- ✅ 建立与自进化主题的双向链接

**下一步**:
- [ ] 精读论文正文（arXiv:2605.08374），补充 EC-MDP 形式化细节
- [ ] 复现小规模实验（BFCL 或 LLAB 单任务）
- [ ] 思考溯源 DAG 信用分配在 [[达尔文.skill]] 中的适用性

---

*由 LLM 自动维护 | 最后更新：2026-08-30*
