# 📓 LLM Wiki 操作日志

<!-- 追加式日志，格式：## [YYYY-MM-DD HH:mm] action | description -->

## [2026-08-30 16:35] create | 新增方案页 [[运营Agent对抗测试系统]]

- ✅ 从 Lunar（WorkBuddy）会话提炼三层架构（对抗测试 / 评分规则加固 / 持续回归）与六角色设计
- ✅ 记录四维评测指标、开源工具选型、与 [[harden-v0]] 的对比取舍
- ✅ 更新索引（项目 10→11，总页面 19→20），挂入主线三
- ✅ 在 [[harden-v0]] 页面补反向链接

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

---

## [2026-08-30 12:35] reorganize | Wiki 整理与基础设施修复

**背景**: 环境迁移到 Windows（C:/wiki），修复同步基础设施后对 Wiki 做整体整理。

### 基础设施
- ✅ 本地克隆至 C:/wiki，配置 git 身份（tiangua）
- ✅ 完善 .gitignore（Obsidian 缓存、系统文件、编辑器目录）
- ✅ 新增 auto-commit.bat / auto-commit.sh 自动提交脚本（三轮修复：GBK 编码 → CRLF 换行 → 无系统 git 时回退 PortableGit 路径）
- ✅ 凭据配置移至仓库本地（credential.helper store），绕过全局配置被反复重写的问题

### 新增页面
- ✅ [[TencentDB-Agent-Memory]] — 团队级记忆中枢（腾讯云）
- ✅ [[MemQ]] — Q-Learning + 溯源 DAG 记忆 Agent（arXiv:2605.08374）
- ✅ [[harden-v0]] — 对抗性验证器加固（arXiv:2606.08960）

### 结构整理
- ✅ 目录统一：02-Wiki/Projects/ 下 5 个页面并入 02-Wiki/Entities/Projects/（与 README 规范一致）
- ✅ 重建 index.md：修正计数（项目实际 9 个而非 5 个）、新增主题地图（Agent 记忆与自进化三条主线）、新增死链清单
- ✅ 更新 README.md：补全目录结构图（Papers 目录）、刷新统计、同步方式改为 auto-commit.bat

### 待办
- [ ] 创建高优先死链页面：[[楼澈]]（8 次引用）、[[OpenKedge]]、[[执行边界]]
- [ ] 统一 `[[LLM Wiki]]` 与 `[[LLM Wiki (Karpathy)]]` 的指向混淆

**下一步**:
- [ ] 推送到 GitHub

## [2026-08-30 14:50] add | 新增 PRAXIST 项目页

- ✅ [[PRAXIST]] — Sapient Intelligence 的自主研究编排系统（类型化证据图 + 世代合成 + QD/DIG，arXiv:2608.25955，MLE-bench 80% 金牌率、1/12 成本）
- ✅ 修复本地 origin/main 跟踪引用长期滞留旧值的问题（refs/remotes/origin/ 写入未持久化，手动重建引用文件后与远端确认同步）

## [2026-09-02 23:20] add | Google 双论文调研入库（WikiSkill + SKILL.state）

**背景**: 楼澈要求调研 Google 最新提出的 WikiSkill 与 SKILL.state，随后追问「WikiSkill 能否解决越用越好」，最后要求把调研与关键判断沉淀进本库。已核对两篇 arXiv 原始摘要与全文细节（非仅二手报道）。

### 新增页面
- ✅ [[WikiSkill]]（Papers, arXiv:2608.27454）— 三层工作区 + 四步闭环 + 门控回滚；五模型五基准主结果；关键消融矩阵
- ✅ [[SKILL.state]]（Papers, arXiv:2608.26263，EMNLP 已接收）— 三元组执行循环；复杂度 O(T²)→O(T)；预算匹配对照表
- ✅ [[执行层与知识层分离]]（Concepts）— **本条主线的统摄性原则页**，从两篇论文中抽象

### 回补与重整
- ✅ [[自进化技能]] — 新增「方案 3: WikiSkill」，两张对比表补行，related 与相关页面同步
- ✅ [[EvoSkill]] — 新增「后续进展：被 WikiSkill 超越」章节（同基准 56.1 → 68.1），建立反向链接
- ✅ index.md — 主线二重整（原则页置顶 + 两篇论文按时间序挂入），计数更新（20 → 23）
- ✅ README.md — 统计表刷新（论文 2→4、概念 5→6）

### 沉淀的关键判断
- **WikiSkill 解决的是「越练越好」，不是「越用越好」** — 需训练/验证/测试切分 + ground truth 评估函数 + 同分布反复 8 轮，属离线有标注多遍流程；模型权重始终不动
- **复利的唯一来源是「失败不清零」** — 门控拒绝时技能层回滚但 wiki 记账；消融实证这层设计值 **15.0 个点**（48.7 → 63.7）
- **两篇互补而非竞争** — WikiSkill 管技能怎么长出来（离线生命周期），SKILL.state 管技能怎么跑起来（在线上下文）
- **共同架构原则** — 可变执行层 + 不可变知识层分离，回滚只回滚执行层
- **反例已记录** — Qwen-3.5-4B 在 OfficeQA 上 WikiSkill 28.5% 反低于无技能 30.2%；ALFWorld 天花板效应 85.9% 无增益
- **自建批评** — SKILL.state 只报累计 token 未报真实推理成本，每步重算状态削弱 KV cache 复用，落地需按实际缓存策略重估

### 待办
- [ ] 提交并推送（尚未执行 git commit，等楼澈确认）
- [ ] [[楼澈]] 页面仍是高优先死链（8 次引用）
- [ ] 「执行层与知识层分离」的知识层自动剪枝问题，两篇论文均未解决 — 可作后续调研方向

## [2026-09-02 23:25] add | 补建人物页（楼澈 + Lunar）

### 新增页面
- ✅ [[楼澈]]（Entities/People）— 本库主人、[[AI 研发范式]] 负责人；含从会话归纳的「协作方式偏好」（要一手来源、要关键判断与反例、简洁直接）
- ✅ [[Lunar]]（Entities/People）— 常驻 Agent 伙伴、本库维护者；含工程侧工作方式约定（SkillManage 不可用需直写 SKILL.md、入库流程已固化为 skill `llm-wiki-ingest`、回补旧页为硬性步骤）

### 同步
- ✅ index.md — 人物分类新增 2 项，计数 23 → 25（人物 1 → 3），死链清单移除 [[楼澈]]
- ✅ README.md — 统计表刷新（人物 1→3，合计 23→25）

### 说明
- 建 [[楼澈]] 页会引入 [[Lunar]] 新死链（站内已引用 5 次），故一并建页，不在库里留新债
- 人物页中的「协作方式偏好」为 Lunar 观察归纳而非楼澈自述，已在页内显式标注
- 城市、代词等基础信息在 USER.md 中仍为待补充，页面保留「待补充」标记

### 待办
- [ ] 提交并推送（仍未执行 git commit，累计 5 新增 + 6 修改）
- [ ] 高优先死链剩余：[[OpenKedge]]（7 次）、[[执行边界]]（5 次）
