# Obsidian LLM Wiki 配置进度

**开始日期**: 2026-04-13  
**状态**: 🟡 步骤 2 - 配置 Git 同步

---

## 步骤清单

### ✅ 步骤 0: 服务器端准备 (已完成)

- [x] 创建 Vault 目录结构
- [x] 初始化 Git 仓库
- [x] 创建页面模板
- [x] 创建 OpenClaw 技能
- [x] 配置 Hook

---

### ✅ 步骤 1: 安装 Obsidian (已完成)

- [x] 通过 snap 安装 Obsidian 1.12.7

---

### 🟡 步骤 2: 配置 Git 同步 (进行中)

**用户选择**: 方案 A - 本地安装 + Git 同步

**服务器端准备**:
- [x] Git 仓库已初始化
- [ ] 配置 SSH 公钥 (可选，用于无密码同步)
- [ ] 创建同步说明文档

---

### ⏳ 步骤 3: 本地操作 (用户执行)

- [ ] 本地安装 Obsidian (https://obsidian.md)
- [ ] 同步 Vault 到本地
- [ ] 在 Obsidian 中打开

---

### ⏳ 步骤 4: 安装插件

- [ ] Dataview
- [ ] Templater
- [ ] Obsidian Git

---

### ⏳ 步骤 5: 测试功能

- [ ] 创建测试页面
- [ ] LLM 创建第一个实体页面

---

## Git 同步命令

### 从本地同步到服务器
```bash
# 首次克隆
git clone root@<server-ip>:/root/.openclaw/workspace/obsidian-vault/ ~/obsidian-vault

# 后续同步
cd ~/obsidian-vault
git pull  # 获取服务器变更
git push  # 推送本地变更
```

### 配置 SSH 公钥 (可选，免密码)
```bash
# 在本地生成 SSH 密钥 (如果还没有)
ssh-keygen -t ed25519 -C "obsidian-sync"

# 复制公钥到服务器
ssh-copy-id root@<server-ip>
```

---

## 当前状态

**进度**: 2/5 步骤进行中  
**等待**: 用户执行本地安装和 Git 克隆

---

*最后更新：2026-04-13 16:56*
