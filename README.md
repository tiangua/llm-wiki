# 🦉 LLM Wiki

**楼澈的个人知识库** — 由 LLM Agent 自动维护

**当前主线**: Agent 记忆与自进化（记忆系统 / 技能自进化 / 评估与验证）

---

## 📁 目录结构

```
00-Inbox/            # 📥 收集箱（未整理素材）
01-Raw-Sources/      # 📄 原始资料（待提炼）
02-Wiki/             # 📚 正式 Wiki
│   ├── Entities/
│   │   ├── People/        # 👥 人物
│   │   ├── Companies/     # 🏢 公司
│   │   └── Projects/      # 🚀 项目
│   ├── Concepts/          # 💡 概念
│   ├── Papers/            # 📄 论文
│   └── index.md           # 📚 总索引（含主题地图与死链清单）
03-Logs/
│   └── log.md             # 📓 操作日志（追加式）
04-Memory/           # 🧠 长期记忆沉淀
05-Templates/
│   ├── entity-template.md # 实体模板
│   └── concept-template.md # 概念模板
06-Attachments/      # 📎 附件
```

---

## 🤖 自动化功能

**Agent 自动执行**:
- 📝 从对话中提取实体（人/公司/概念/项目/论文）
- 📄 自动创建 Wiki 页面（遵循 05-Templates 模板 + frontmatter 规范）
- 🔗 建立双向链接，挂入现有知识网络
- 📊 更新索引（`02-Wiki/index.md`）
- 📓 记录操作日志（`03-Logs/log.md`）

**触发方式**:
- 会话结束时自动执行
- 或手动请求：「为 XXX 创建 Wiki 页面」

---

## 🔄 同步方式

**日常同步**（推荐）: 双击 `auto-commit.bat`，自动提交并推送（无变更则跳过，推送失败不丢本地提交）。

**手动方式**:
```bash
cd C:\wiki
git add -A
git commit -m "修改描述"
git push
```

**获取远端更新**:
```bash
git pull
```

---

## 📊 当前内容

| 类型 | 页面数 |
|------|--------|
| 人物 | 3 |
| 公司 | 1 |
| 项目 | 11 |
| 论文 | 4 |
| 概念 | 6 |
| **合计** | **25** |

查看 `02-Wiki/index.md` 获取主题地图与完整列表。

---

## 📝 页面规范

**双向链接**: `[[页面名称]]`（Obsidian 风格，按名称解析，与目录位置无关）

**Frontmatter**:
```yaml
---
type: project   # person/company/project/concept/paper
source: <URL>   # 外部来源（如有）
created: YYYY-MM-DD
tags: [tag1, tag2]
related: ["[[相关页面]]"]
status: draft   # draft/analyzing/published/archived
---
```

**变更日志**: 每页末尾追加式记录（日期 + 动作 + 要点 + 下一步）。

---

*由 LLM 自动维护 | 最后更新：2026-09-02*
