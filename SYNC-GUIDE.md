# 🔄 Git 同步指南

**用途**: 在本地电脑和服务器之间同步 Obsidian Vault

---

## 📋 前提条件

1. ✅ 本地已安装 Git
2. ✅ 本地已安装 Obsidian (https://obsidian.md)
3. ✅ 能 SSH 连接到服务器

---

## 🚀 首次设置

### 步骤 1: 克隆 Vault 到本地

```bash
# 在你的本地电脑上执行
git clone root@<server-ip>:/root/.openclaw/workspace/obsidian-vault/ ~/obsidian-vault
```

**需要替换**:
- `<server-ip>` → 替换为服务器 IP 地址

**示例**:
```bash
git clone root@47.243.123.45:/root/.openclaw/workspace/obsidian-vault/ ~/obsidian-vault
```

---

### 步骤 2: 配置 SSH 公钥 (可选，推荐)

避免每次同步都输入密码：

```bash
# 1. 生成 SSH 密钥 (如果还没有)
ssh-keygen -t ed25519 -C "obsidian-sync"

# 2. 复制公钥到服务器
ssh-copy-id root@<server-ip>

# 3. 测试连接
ssh root@<server-ip>
```

---

### 步骤 3: 在 Obsidian 中打开

1. 打开 Obsidian
2. 点击 **"Open folder as vault"** (打开文件夹作为 Vault)
3. 选择 `~/obsidian-vault/` (或你克隆的目录)
4. ✅ 完成！

---

## 📝 日常同步流程

### 开始工作前
```bash
cd ~/obsidian-vault
git pull  # 获取服务器最新变更
```

### 结束工作后
```bash
cd ~/obsidian-vault
git add -A
git commit -m "更新内容描述"
git push  # 同步到服务器
```

---

## 🔌 Obsidian Git 插件 (自动同步)

安装后可自动备份：

1. 在 Obsidian 中安装插件：
   - 设置 → 社区插件 → 关闭安全模式
   - 搜索 "Obsidian Git" → 安装并启用

2. 配置自动备份：
   - 设置 → Obsidian Git
   - 启用 "Auto backup interval" → 设置为 5 分钟

3. 首次提交：
   - 按 `Ctrl/Cmd + P` → 输入 "Git: Create initial commit"

---

## ⚠️ 常见问题

### 冲突处理
```bash
# 如果 git push 失败，提示冲突
git pull  # 先拉取最新变更
# 解决冲突文件 (手动编辑)
git add <冲突文件>
git commit -m "解决冲突"
git push
```

### 忘记同步
如果本地修改后忘记 push，服务器上的 LLM 可能看不到最新内容。

**解决**: 养成习惯，每天结束前 `git push`

---

## 📊 同步架构

```
┌─────────────────┐         ┌─────────────────┐
│   本地电脑       │         │    服务器        │
│  ~/obsidian-vault/│  ←→  │ /root/.openclaw/ │
│                 │  Git   │ workspace/       │
│  Obsidian 编辑   │  Sync  │ obsidian-vault/  │
│                 │         │                  │
│                 │         │ OpenClaw 读取    │
└─────────────────┘         └─────────────────┘
```

---

## 🎯 下一步

1. 执行 `git clone` 命令
2. 在 Obsidian 中打开 Vault
3. 安装推荐插件 (Dataview, Templater, Obsidian Git)
4. 告诉我完成，我们继续测试功能！

---

*由 Luna 自动生成 | 2026-04-13*
