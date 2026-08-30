#!/usr/bin/env bash
# wiki 自动提交脚本
# 用法: ./auto-commit.sh [commit message]
# 示例: ./auto-commit.sh "整理 Inbox 中的三篇笔记"

set -euo pipefail
cd "$(dirname "$0")"

if ! git diff-index --quiet HEAD -- 2>/dev/null && [ -n "$(git status --porcelain)" ]; then
    git add -A
    if [ -n "${1:-}" ]; then
        git commit -m "$1"
    else
        git commit -m "chore: auto-sync $(date '+%Y-%m-%d %H:%M')"
    fi
    # 推送失败不影响本地提交（网络不通时下次再推）
    git push origin main || echo "[warn] push 失败，本地提交已保存，下次网络恢复后再推"
else
    echo "没有需要提交的变更"
fi
