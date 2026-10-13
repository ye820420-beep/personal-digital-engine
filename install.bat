@echo off
chcp 65001 >nul
setlocal
rem ============================================================
rem  personal-digital-engine - Windows installer
rem
rem  From a clone:  double-click this file, or run:  install.bat
rem  Without a clone it clones the repo into %TEMP% first.
rem
rem  Usage: install.bat [auto|all|claude|codex|workbuddy|cursor|here]
rem    auto (default) every AI tool already present on this machine
rem    all            create the skills folder even if the tool is missing
rem    here           just drop the .md in the current folder
rem
rem  It copies one file. No upload, no network calls, no keys.
rem ============================================================

set "REPO=https://github.com/ye820420-beep/personal-digital-engine.git"
set "NAME=personal-digital-engine"
set "MODE=%~1"
if "%MODE%"=="" set "MODE=auto"

set "SRC=%~dp0skills\个人数字化引擎.md"
if exist "%SRC%" goto :found

echo Repo not found locally - cloning to a temp folder first...
if exist "%TEMP%\pde-install" rmdir /s /q "%TEMP%\pde-install"
git clone --depth 1 "%REPO%" "%TEMP%\pde-install"
set "SRC=%TEMP%\pde-install\skills\个人数字化引擎.md"

:found
if exist "%SRC%" goto :ok
echo [ERROR] skill file not found: %SRC%
echo Download it here instead:
echo   https://github.com/ye820420-beep/personal-digital-engine/blob/main/skills/%%E4%%B8%%AA%%E4%%BA%%BA%%E6%%95%%B0%%E5%%AD%%97%%E5%%8C%%96%%E5%%BC%%95%%E6%%93%%8E.md
pause
exit /b 1

:ok
echo.
echo personal-digital-engine - install ^(%MODE%^)
echo.

if /i "%MODE%"=="here" goto :dohere
if /i "%MODE%"=="all"   goto :doall
if /i "%MODE%"=="claude"    call :install "%USERPROFILE%\.claude"    "Claude Code" & goto :done
if /i "%MODE%"=="codex"     call :install "%USERPROFILE%\.codex"     "Codex"       & goto :done
if /i "%MODE%"=="workbuddy" call :install "%USERPROFILE%\.workbuddy" "WorkBuddy"   & goto :done
if /i "%MODE%"=="cursor"    call :install "%USERPROFILE%\.cursor"    "Cursor"      & goto :done

:doauto
call :install "%USERPROFILE%\.claude"    "Claude Code"
call :install "%USERPROFILE%\.codex"     "Codex"
call :install "%USERPROFILE%\.workbuddy" "WorkBuddy"
call :install "%USERPROFILE%\.cursor"    "Cursor"
goto :done

:doall
set "MODE=all"
call :install "%USERPROFILE%\.claude"    "Claude Code"
call :install "%USERPROFILE%\.codex"     "Codex"
call :install "%USERPROFILE%\.workbuddy" "WorkBuddy"
call :install "%USERPROFILE%\.cursor"    "Cursor"
goto :done

:dohere
copy /y "%SRC%" "%CD%\个人数字化引擎.md" >nul
echo   [OK] current folder  -^>  %CD%\个人数字化引擎.md
echo.
echo Drag that one file into 豆包 / 元宝 / DeepSeek / ChatGPT / Claude and say "装这个".
goto :done

:done
echo.
echo ------------------------------------------------------------
echo Done. Start every new chat with this line ^(boot phrase^):
echo.
echo   你装了《个人数字化引擎》。先读 流水账-YYYY-MM.md 和 我的档案.md，
echo   然后回我三行：本月记了多少条 / 断更了几天 / 今天该补记什么。
echo   之后我说什么你就记什么，只回三行，别多说。
echo.
echo First run: say "跑一遍样例" to see a finished example in 60s, then "开始".
echo ------------------------------------------------------------
echo.
pause
exit /b 0

rem ---------------- :install <tool root> <label> ----------------
:install
if not exist "%~1" (
  if /i not "%MODE%"=="all" (
    echo   -  %~2 not installed ^(no %~1, skipped^)
    exit /b 0
  )
)
if not exist "%~1\skills" mkdir "%~1\skills"
if not exist "%~1\skills\%NAME%" mkdir "%~1\skills\%NAME%"
copy /y "%SRC%" "%~1\skills\%NAME%\SKILL.md" >nul
echo   [OK] %~2  -^>  %~1\skills\%NAME%\SKILL.md
exit /b 0
