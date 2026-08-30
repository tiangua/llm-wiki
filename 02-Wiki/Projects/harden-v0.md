---
type: project
source: https://github.com/few-sh/harden-v0
author: Ziqian Zhong, Ivgeni Segal, Ivan Bercovich et al. (few-sh)
created: 2026-08-30
tags: [benchmark, adversarial, verifier, agent-evaluation, robustness, llm-agent]
related: [[VAKRA-Benchmark]], [[协同进化验证]]
status: analyzing
---

# harden-v0 (Hacker-Fixer Loop)

**来源**: [few-sh/harden-v0](https://github.com/few-sh/harden-v0)
**论文**: [Hardening Agent Benchmarks with Adversarial Hacker-Fixer Loops](https://arxiv.org/abs/2606.08960) (arXiv:2606.08960)
**定位**: 统一的对抗性验证器加固循环——自动构建抗操纵的 Agent 基准测试结果验证器

---

## 📋 核心理念

> Agent 基准用结果验证器（outcome verifier）给提交打分：测试通过了吗？内核更快了吗？**这些验证器很脆弱，容易被钻空子（game）。**

harden-v0 通过让**三个 LLM Agent 互相对抗**，自动加固验证器，无需对每个任务手工打补丁。

---

## 🎭 三个角色

| 角色 | 目标 |
|------|------|
| 🔴 **Hacker（黑客）** | **不解决任务**却拿到满分——专攻验证器漏洞 |
| 🔵 **Fixer（修复者）** | 拿到黑客的攻击轨迹 + 验证器源码，打补丁堵住漏洞 |
| 🟢 **Solver（求解者）** | 预检任务可解；确认每个补丁仍然放行合法解法 |

**循环逻辑**：每个补丁都重塑验证器的奖励面，迫使黑客找出下一个漏洞。当黑客再也找不到漏洞（**robust**）或迭代预算耗尽时停止。

---

## ✨ 关键特性

| 特性 | 说明 |
|------|------|
| **`--hacker-privileged`** | 允许黑客看到评估环境（`tests/`、`environment/`），更好预判和对抗漏洞 |
| **共享防御池**（`--pool-enabled`） | 一个任务上发现的修复通过 git 仓库共享给所有任务，改进自动扩散到整个数据集 |
| **共享攻防日志**（默认开启） | 记录每轮的漏洞与补丁，让所有任务（池化模式下）从已试过的攻防中受益 |
| **定向重放**（`--replay-enabled`） | solver 之后的针对性重放门控 |

---

## 🛠️ 使用

**环境要求**: Python ≥ 3.12、Docker（Linux，池化模式需要）、[Harbor](https://github.com/harbor-framework/harbor)（在任务容器内运行 Terminus-2 agents）、LLM API key（litellm 路由，支持 Gemini/Anthropic 等）。

```bash
# 通用任务（pass/fail 奖励）
python -m harden --task-id <task-id> --tasks-dir ./tasks \
    --solver-model gemini/gemini-3.1-pro-preview \
    --solver-privileged --max-iterations 5

# 批量处理
python -m harden --task-ids task1,task2,task3 --max-concurrent 4

# KernelBench 任务
python -m harden --kernelbench-mode --task-id matmul \
    --hack-threshold 10 --solver-threshold 0.5 --max-iterations 5
```

常用标志：`--max-iterations`（默认 10）、`--hacker-retries`（每轮黑客尝试次数，默认 3）、`--fixer-prompt-file`（注入额外修复指导）等。

---

## 💡 与本 Wiki 主题的关联

- **与 [[VAKRA-Benchmark]] 直接互补**：VAKRA 致力于构建更好的 Agent 基准（组合推理、全轨迹评估），harden-v0 致力于让基准的**评分环节本身不可欺骗**。两者合起来是"评估可信性"的一体两面
- **对抗产生鲁棒**的思路与 [[协同进化验证]]（无需真实测试数据的验证方法）同源——都是用红蓝对抗替代静态验证
- 三角色设计（攻击者/防御者/仲裁者）是**自进化系统评估闭环**的标准范式，可直接借鉴到 [[达尔文.skill]] 的"评估→改进→测试→回滚"流程中：技能的测试本身也需要被对抗性加固
- Hacker 的目标"不解决任务却拿满分"正是 [[VAKRA-Benchmark]] 发现的"表面工具能力 ≠ 端到端可靠性"问题的极端化

---

## ⚠️ 注意

- **活跃开发中**：API、CLI 标志和内部实现可能变化，以 `python -m harden --help` 为准
- 依赖 Docker/Linux 环境，Windows 原生不可直接运行池化模式

---

## 🔗 相关页面

- [[VAKRA-Benchmark]] — Agent 基准构建（互补：基准 vs 验证器加固）
- [[协同进化验证]] — 对抗式验证思想
- [[达尔文.skill]] — 评估闭环可借鉴三角色设计
- [[EverOS]] / [[MemQ]] — 记忆与自进化方向（其基准评估的可靠性依赖此类工具）

---

## 📝 变更日志

### [2026-08-30] create | 初始创建

- ✅ 分析 README，记录三角色对抗循环与核心特性
- ✅ 建立与 VAKRA / 协同进化验证的双向链接

**下一步**:
- [ ] 精读论文（arXiv:2606.08960），补充收敛性分析
- [ ] 调研 KernelBench artifact（fjzzq2002/harden-kb-traces）
- [ ] 评估对 [[VAKRA-Benchmark]] 四大能力测试的加固适用性

---

*由 LLM 自动维护 | 最后更新：2026-08-30*
