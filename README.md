# 🦉 Obsidian LLM Wiki Vault

**创建日期**: 2026-04-13  
**用途**: LLM 自动维护的个人知识库

---

## 📁 目录结构

```
obsidian-vault/
├── 00-Inbox/          # 临时捕获 (待分类内容)
├── 01-Raw-Sources/    # 原始资料 (只读)
├── 02-Wiki/           # 知识库主体
│   ├── Entities/      # 实体页面
│   │   ├── People/    # 人物
│   │   ├── Companies/ # 公司
│   │   └── Projects/  # 项目
│   ├── Concepts/      # 概念
│   └── index.md       # 总索引
├── 03-Logs/           # 操作日志
│   └── log.md         # 追加式记录
├── 04-Memory/         # 与 OpenClaw 记忆同步
├── 05-Templates/      # 页面模板
│   ├── entity-template.md
│   └── concept-template.md
└── 06-Attachments/    # 附件 (图片/PDF/音频)
```

---

## 🚀 快速开始

### 1. 在 Obsidian 中打开

1. 下载并安装 [Obsidian](https://obsidian.md)
2. 打开 Obsidian → "Open folder as vault"
3. 选择此目录：`/root/.openclaw/workspace/obsidian-vault/`

### 2. 安装推荐插件

在 Obsidian 设置中安装以下社区插件：

| 插件 | 用途 | 安装方式 |
|------|------|---------|
| **Dataview** | 查询页面元数据 | 社区插件 → 搜索 "Dataview" → 安装 |
| **Templater** | 动态模板 | 社区插件 → 搜索 "Templater" → 安装 |
| **Obsidian Git** | 自动备份 | 社区插件 → 搜索 "Obsidian Git" → 安装 |

### 3. 配置 Templater

1. 设置 → Templater → Template folder location
2. 选择：`05-Templates`

### 4. 配置 Obsidian Git

1. 设置 → Obsidian Git
2. 启用 "Auto backup interval" → 设置为 5 分钟
3. 首次运行 "Create initial commit"

---

## 🤖 LLM 自动化

此 Vault 由 OpenClaw Agent (Luna) 自动维护：

- **实体提取**: 从对话中自动检测人/公司/概念
- **页面生成**: 自动创建 Wiki 页面
- **关系构建**: 自动建立双向链接
- **索引维护**: 自动更新 `02-Wiki/index.md`

### 触发方式

1. **自动**: 每次会话结束时
2. **手动**: 在对话中请求 "为 XXX 创建 Wiki 页面"

---

## 📝 页面规范

### 双向链接格式

```markdown
[[页面名称]]           # 基本链接
[[页面名称|显示文本]]  # 自定义显示文本
[[页面名称#标题]]      # 链接到标题
```

### Frontmatter 规范

```yaml
---
type: person          # 实体类型
created: 2026-04-13   # 创建日期
tags: [auto-generated, person]
status: draft         # draft | published | archived
confidence: 0.8       # LLM 置信度
---
```

---

## 🔄 与 OpenClaw 同步

Vault 位置：`/root/.openclaw/workspace/obsidian-vault/`

OpenClaw 技能：`~/.openclaw/skills/obsidian-wiki/`

---

## 📊 查询示例 (Dataview)

### 所有人物页面

````markdown
```dataview
LIST
FROM "02-Wiki/Entities/People"
WHERE type = "person"
SORT file.name ASC
```
````

### 最近创建的页面

````markdown
```dataview
TABLE created, type
FROM "02-Wiki"
WHERE created >= date(2026-04-01)
SORT created DESC
```
````

### 孤立页面 (无链接)

````markdown
```dataview
LIST
FROM "02-Wiki"
WHERE length(file.links) = 0
```
````

---

## ⚙️ 环境变量

```bash
# 可选：自定义 Vault 路径
export OBSIDIAN_VAULT_PATH=/path/to/vault
```

---

## 📝 操作日志

查看 `03-Logs/log.md` 了解所有 LLM 自动操作记录。

---

*由 Luna (OpenClaw Agent) 自动维护*
