---
type: paper
arxiv: 2604.01687
title: "EvoSkills: Self-Evolving Agent Skills via Co-Evolutionary Verification"
authors: [Hanrong Zhang, Shicheng Fan, Henry Peng Zou, ..., Philip S. Yu]
submitted: 2026-04-02
institution: Multiple (incl. Philip S. Yu)
tags: [skill-evolution, co-evolution, verification, autonomous]
related: [[自进化技能]], [[EvoSkill]], [[协同进化验证]]
status: reviewed
reviewed_date: 2026-04-14
---

# EvoSkills: Self-Evolving Agent Skills

**arXiv**: [2604.01687](https://arxiv.org/abs/2604.01687)  
**提交时间**: 2026-04-02（刚发布 12 天）  
**领域**: AI (cs.AI)  
**代码**: Will be released

---

## 📋 摘要

Anthropic 提出的 Skills 概念需要手工编写，存在人机认知不对齐问题。SkillsBench 评估显示人工作品性能下降。现有自进化方法针对 tools 设计，无法应用于复杂 skills（多文件包）。

**EvoSkills** 提出协同进化验证框架，使 Agent 能够自主构建复杂的多文件技能包。

---

## 🎯 核心贡献

### 1. 协同进化验证架构
```
┌─────────────────┐    反馈    ┌─────────────────┐
│ Skill Generator │ ←───────── │ Surrogate       │
│ (迭代精炼技能)   │            │ Verifier        │
└─────────────────┘            │ (协同进化)       │
         ↓                     │                 │
    多文件技能包                │ 无需真实测试数据 │
                             └─────────────────┘
```

### 2. Surrogate Verifier
- 无需访问真实测试内容
- 提供可操作的反馈
- 与 Generator 协同进化

### 3. 多文件技能包
- 结构化 bundle
- 跨文件依赖
- 复杂工作流封装

---

## 📊 实验结果

| 评估 | 结果 |
|------|------|
| **SkillsBench** | 在 Claude Code 和 Codex 上达到 5 个基线中最高通过率 |
| **泛化能力** | 对 6 个额外 LLMs 展现强泛化能力 |
| **代码** | 待发布 |

---

## 🔍 方法论

### Skill Generator
- 迭代精炼技能
- 接收 Verifier 反馈
- 输出多文件技能包

### Surrogate Verifier
- 不依赖真实测试数据
- 自主生成评估标准
- 提供建设性反馈

### 协同进化
- 两者同时进化
- 互相促进提升
- 避免过拟合特定测试

---

## 💡 对我们的启发

### OpenClaw 应用方向

1. **自主技能生成**
   - 当前需要人类编写 SKILL.md
   - 未来可以探索自主生成（需安全边界）
   - 参考 Surrogate Verifier 设计

2. **无需真实测试数据的验证**
   - 适合 OpenClaw 场景（测试成本高）
   - 可以设计内部验证机制
   - 但需警惕验证偏差

3. **多文件技能包**
   - OpenClaw Skills 已经是多文件结构
   - SKILL.md + scripts/ + references/
   - 可以借鉴组织方式

---

## ⚠️ 安全风险

| 风险 | 说明 | 缓解措施 |
|------|------|---------|
| **验证偏差** | Verifier 自己生成标准，可能偏离 | 需要人类审计 |
| **自主生成失控** | Agent 自己编写技能 | 需要边界控制（OpenClaw 已实现） |
| **认知不对齐加剧** | 协同进化形成内部语言 | 需要透明度机制 |
| **人类无法审计** | 复杂技能难以理解 | 需要文档规范（SKILL.md） |

---

## 🔗 与 EvoSkill 对比

| 维度 | EvoSkill (3 月) | EvoSkills (4 月) |
|------|-----------------|------------------|
| **核心方法** | 失败分析 + Pareto 选择 | 协同进化验证 |
| **验证方式** | 需要真实测试数据 | 无需真实测试数据 |
| **技能形式** | 结构化 skill folders | 多文件技能包 |
| **迁移能力** | ✅ 零样本迁移验证 | ✅ 跨 LLM 泛化 |
| **安全风险** | 技能携带隐性行为 | 自主生成需边界控制 |

---

## 🔗 相关页面

- [[自进化技能]] — 核心概念
- [[协同进化验证]] — 方法论
- [[EvoSkill]] — 失败分析方案
- [[OpenKedge]] — 执行边界安全设计

---

## 📝 变更日志

## [2026-04-14 09:30] create | 初始创建

- ✅ 创建论文页面
- ✅ 记录协同进化验证架构
- ✅ 对比 EvoSkill 差异
- ✅ 建立双向链接

---

*由 LLM 自动维护 | 最后更新：2026-04-14*
