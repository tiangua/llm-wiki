# 📓 LLM Wiki 操作日志

<!-- 追加式日志，格式：## [YYYY-MM-DD HH:mm] action | description -->

## [2026-04-13 16:45] init | LLM Wiki 系统初始化

- ✅ 创建 Vault 目录结构
- ✅ 初始化 Git 仓库
- ✅ 创建页面模板 (entity-template.md, concept-template.md)
- ✅ 创建索引文件 (index.md)
- ✅ 创建 OpenClaw 技能 (obsidian-wiki)
- ✅ 配置 Hook (session-end 触发)
- ✅ 创建 README.md

## [2026-04-13 17:58] sync | GitHub 推送完成

- ✅ 推送完整 Vault 到 tiangua/llm-wiki
- ✅ 分支：main
- ✅ 包含 .gitkeep 占位文件

## [2026-04-13 18:33] create | 创建首批 Wiki 页面

- ✅ 创建项目页面：[[AI 研发范式]]
- ✅ 创建概念页面：[[自主进化]]
- ✅ 更新索引文件 (index.md)
- ✅ 建立双向链接

## [2026-04-13 18:45] cleanup | 清理过程文件

- ✅ 删除 SETUP-PROGRESS.md
- ✅ 删除 GITHUB-SYNC.md
- ✅ 删除 SYNC-GUIDE.md
- ✅ 简化 README.md

## [2026-04-13 18:52] create | 创建 Hermes Agent 相关页面

- ✅ 创建项目页面：[[Hermes Agent]]
- ✅ 创建公司页面：[[Nous Research]]
- ✅ 更新索引 (4 个页面)
- ✅ 建立双向链接

## [2026-04-13 18:59] update | 增强 Hermes Agent 自主进化分析

- ✅ 新增自主进化能力详细分析章节
- ✅ 对比我们与 Hermes 的差异
- ✅ 融合可能性分析

## [2026-04-13 19:04] create | 创建 gbrain 调研页面

- ✅ 创建项目页面：[[gbrain]]
- ✅ 创建人物页面：[[Garry Tan]]
- ✅ 创建概念页面：[[编译真相 + 时间线]]
- ✅ 更新索引 (7 个页面)
- ✅ 建立双向链接

## [2026-04-13 23:10] create | 创建 LLM Wiki (Karpathy) 概念页面

- ✅ 创建概念页面：[[LLM Wiki (Karpathy)]]
- ✅ 归档 Karpathy 原始理念
- ✅ 补充社区 7 项能力标准
- ✅ 对比分析实现状态 (71%)
- ✅ 制定后续实现计划
- ✅ 更新索引 (8 个页面)

**下一步**:
- [ ] 推送到 GitHub
- [ ] 用户本地拉取查看

---

## [2026-04-14 09:30] create | 创建 EvoSkill/EvoSkills 论文及概念页面

**背景**: 用户要求分析两篇 arXiv 论文，整理到 LLM Wiki

### 论文页面 (Papers)
- ✅ 创建 [[EvoSkill]] — 失败分析驱动的技能发现 (arXiv:2603.02766)
- ✅ 创建 [[EvoSkills]] — 协同进化验证 (arXiv:2604.01687)

### 概念页面 (Concepts)
- ✅ 创建 [[自进化技能]] — 核心概念，对比两种方案
- ✅ 创建 [[协同进化验证]] — 方法论详解

### 内容详情
- 记录核心贡献和实验结果
- 分析 OpenClaw 应用方向
- 记录安全风险和缓解措施
- 建立双向链接网络

### 索引更新
- ✅ 更新 `02-Wiki/index.md` (总页面数：8 → 12)
- ✅ 新增"论文 (Papers)"分类
- ✅ 更新"最近更新"列表

**下一步**:
- [ ] 推送到 GitHub
- [ ] 关联 [[OpenKedge]] 论文（执行边界设计）
- [ ] 研究 OpenKedge 论文细节

---

## [2026-04-14 21:35] create | 调研达尔文.skill 技能进化系统

**背景**: 用户要求调研 https://github.com/alchaincyf/darwin-skill

### 核心发现
- ✅ 灵感来源：Karpathy autoresearch
- ✅ 核心机制：评估→改进→测试→保留/回滚
- ✅ 评分体系：8 维加权总分（结构 60 分 + 效果 40 分）
- ✅ 棘轮机制：分数只升不降，自动回滚退步
- ✅ 人在回路：每轮优化后暂停，用户确认再继续

### 与 EvoSkill/EvoSkills 对比
| 维度 | EvoSkill | EvoSkills | 达尔文.skill |
|------|----------|-----------|-------------|
| 核心方法 | 失败分析 + Pareto | 协同进化验证 | 评估→改进→测试→回滚 |
| 人类角色 | 离线评估 | 离线评估 | 人在回路（每轮确认）|
| 回滚机制 | ❌ | ❌ | ✅ git revert |
| 适用场景 | 新技能发现 | 复杂技能生成 | 现有技能优化 |

### OpenClaw 应用方向
1. **8 维评分体系** — 结构化评估技能质量
2. **棘轮机制** — 只保留改进，不积累退化
3. **测试用例体系** — test-prompts.json 验证效果
4. **人在回路增强** — 评分可视化 + diff 对比

### 索引更新
- ✅ 创建 `02-Wiki/Projects/达尔文.skill.md`
- ✅ 更新 `index.md` (12→13 页面)
- ✅ 新增"项目页面"分类

**下一步**:
- [ ] 设计 OpenClaw 8 维评分体系
- [ ] 创建 test-prompts.json 规范
- [ ] 实现棘轮机制原型

---
