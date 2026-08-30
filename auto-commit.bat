# wiki 自动提交脚本（Windows 原生，双击即可运行）
# 用法: 双击运行，或命令行带参数: auto-commit.bat "提交说明"

@echo off
chcp 65001 >nul
cd /d %~dp0

git status --porcelain >nul 2>&1
if %errorlevel% neq 0 goto :fail

for /f %%i in ('git status --porcelain ^| find /c /v ""') do set COUNT=%%i
if %COUNT%==0 (
    echo 没有需要提交的变更
    goto :end
)

git add -A
if "%~1"=="" (
    for /f "tokens=1,2 delims= " %%a in ('date /t') do set D=%%a
    git commit -m "chore: auto-sync %DATE% %TIME:~0,8%"
) else (
    git commit -m "%~1"
)

git push origin main
if %errorlevel% neq 0 echo [warn] push 失败，本地提交已保存，下次网络恢复后再推
goto :end

:fail
echo git 命令执行失败

:end
timeout /t 3 >nul
