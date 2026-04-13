# 🔄 GitHub 同步方案

**用途**: 通过 GitHub 在本地和服务器之间同步 Obsidian Vault

---

## 📋 方案架构

```
┌─────────────────┐         ┌─────────────────┐         ┌─────────────────┐
│   本地电脑       │         │    GitHub       │         │    服务器        │
│  Obsidian 编辑   │  →→→   │  私有仓库        │  →→→   │  OpenClaw 读取   │
│  git push       │         │  (llm-wiki)     │         │  git pull       │
└─────────────────┘         └─────────────────┘         └─────────────────┘
```

---

## 🚀 设置步骤

### 步骤 1: 创建 GitHub 仓库 (用户执行)

1. 打开 https://github.com/new
2. 仓库名：`llm-wiki` (或 `obsidian-vault`)
3. **设为私有 (Private)** ⚠️
4. 不要初始化 (不勾选 README/.gitignore)
5. 点击 "Create repository"

---

### 步骤 2: 推送本地 Vault 到 GitHub (用户执行)

```bash
# 在你的本地 Vault 目录
cd ~/obsidian-vault  # 或你的实际路径

# 关联 GitHub 远程
git remote add origin https://github.com/<你的用户名>/llm-wiki.git

# 推送
git branch -M main
git push -u origin main
```

---

### 步骤 3: 服务器端配置 (Luna 执行)

```bash
# 在服务器上
cd /root/.openclaw/workspace/obsidian-vault

# 添加 GitHub 远程
git remote add github https://github.com/<你的用户名>/llm-wiki.git

# 拉取最新内容
git pull github main

# 设置自动同步
git config remote.github.fetch '+refs/heads/*:refs/remotes/github/*'
```

---

## 🔄 日常同步流程

### 本地修改后
```bash
cd ~/obsidian-vault
git add -A
git commit -m "更新内容"
git push  # 推送到 GitHub
```

### 服务器端自动/手动同步
```bash
cd /root/.openclaw/workspace/obsidian-vault
git pull github main  # 从 GitHub 拉取
```

---

## ⚙️ 自动同步配置 (可选)

### 方案 A: Cron 定时同步
```bash
# 添加到服务器 crontab
# 每 5 分钟从 GitHub 拉取最新内容
*/5 * * * * cd /root/.openclaw/workspace/obsidian-vault && git pull github main
```

### 方案 B: GitHub Webhook
- 配置 GitHub Webhook 触发服务器同步
- 需要公开端点或 ngrok 隧道

---

## 🔐 认证方式

### HTTPS (简单，需每次输入密码)
```bash
git remote add origin https://github.com/user/repo.git
```

### SSH (推荐，免密码)
```bash
# 生成 SSH 密钥
ssh-keygen -t ed25519 -C "github-obsidian"

# 添加公钥到 GitHub
# https://github.com/settings/keys

# 使用 SSH 远程
git remote add origin git@github.com:user/repo.git
```

### Personal Access Token (推荐用于 HTTPS)
1. https://github.com/settings/tokens
2. 创建 token (勾选 `repo` 权限)
3. 使用时：
   ```bash
   git remote add origin https://<token>@github.com/user/repo.git
   ```

---

## ⚠️ 注意事项

1. **隐私保护** — 务必设为私有仓库
2. **大文件** — 附件建议用 Git LFS 或排除同步
3. **冲突处理** — 多人编辑时注意 `git pull` 解决冲突
4. **.obsidian 配置** — 建议加入 `.gitignore` (个人化配置不同步)

---

## 📝 推荐的 .gitignore

```
# Obsidian
.obsidian/workspace.json
.obsidian/workspace-mobile.json
.obsidian/appearance.css
.obsidian/plugins/

# Attachments (可选)
06-Attachments/*.pdf
06-Attachments/*.mp3
06-Attachments/*.mp4

# OS
.DS_Store
Thumbs.db
```

---

## 🎯 下一步

1. 用户创建 GitHub 仓库
2. 用户推送本地 Vault
3. 告诉我仓库地址
4. 我配置服务器端同步

---

*由 Luna 自动生成 | 2026-04-13*
