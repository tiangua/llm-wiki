# 🦉 LLM Wiki

**楼澈的个人知识库** — 由 Luna (OpenClaw Agent) 自动维护

---

## 📁 目录结构

```
02-Wiki/
├── Entities/
│   ├── People/        # 👥 人物
│   ├── Companies/     # 🏢 公司
│   └── Projects/      # 🚀 项目
├── Concepts/          # 💡 概念
└── index.md           # 📚 总索引

03-Logs/
└── log.md             # 📓 操作日志

05-Templates/
├── entity-template.md # 实体模板
└── concept-template.md # 概念模板
```

---

## 🤖 自动化功能

**Luna 自动执行**:
- 📝 从对话中提取实体 (人/公司/概念/项目)
- 📄 自动创建 Wiki 页面
- 🔗 建立双向链接
- 📊 更新索引
- 📓 记录操作日志

**触发方式**:
- 会话结束时自动执行
- 或手动请求：「为 XXX 创建 Wiki 页面」

---

## 🔄 同步方式

**你编辑后**:
```bash
cd ~/obsidian-vault
git add -A
git commit -m "修改描述"
git push
```

**获取 Luna 的更新**:
```bash
git pull
```

---

## 📊 当前内容

| 类型 | 页面数 | 示例 |
|------|--------|------|
| 项目 | 1 | AI 研发范式 |
| 概念 | 1 | 自主进化 |

查看 `02-Wiki/index.md` 获取完整列表。

---

## 📝 页面规范

**双向链接**: `[[页面名称]]`

**Frontmatter**:
```yaml
---
type: person  # person/company/project/concept
tags: [tag1, tag2]
status: draft  # draft/published/archived
---
```

---

*由 Luna 自动维护 | 最后更新：2026-04-13*
