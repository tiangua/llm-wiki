@echo off
rem wiki auto-commit script (double-click to run)
rem usage: auto-commit.bat "commit message"

cd /d %~dp0

git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo Not a git repository.
    pause
    exit /b 1
)

for /f %%i in ('git status --porcelain ^| find /c /v ""') do set COUNT=%%i
if "%COUNT%"=="0" (
    echo Nothing to commit.
    timeout /t 3 >nul
    exit /b 0
)

git add -A
if "%~1"=="" (
    git commit -m "chore: auto-sync %date% %time:~0,8%"
) else (
    git commit -m "%~1"
)

git push origin main
if errorlevel 1 (
    echo [warn] Push failed. Local commit is safe, push again later.
)

timeout /t 5 >nul
