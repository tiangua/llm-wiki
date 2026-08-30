@echo off
rem wiki auto-commit script (double-click to run)
rem usage: auto-commit.bat "commit message"

setlocal
cd /d %~dp0

set GIT=git
where git >nul 2>&1
if errorlevel 1 (
    set GIT=%USERPROFILE%\.workbuddy\binaries\PortableGit\versions\1.2.0\cmd\git.exe
)

%GIT% rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo ERROR: git not found or not a git repository.
    echo If git is missing, install Git for Windows and add it to PATH.
    pause
    exit /b 1
)

for /f %%i in ('%GIT% status --porcelain ^| find /c /v ""') do set COUNT=%%i
if "%COUNT%"=="0" (
    echo Nothing to commit.
) else (
    %GIT% add -A
    if "%~1"=="" (
        %GIT% commit -m "chore: auto-sync %date% %time:~0,8%"
    ) else (
        %GIT% commit -m "%~1"
    )
)

rem always push, even when nothing new to commit
%GIT% push origin main
if errorlevel 1 (
    echo [warn] Push failed. Local commit is safe, push again later.
) else (
    echo [ok] Pushed to GitHub.
)

timeout /t 5 >nul
