@echo off
REM Typer Code Editor Launcher
REM Quick launch script for the simplified VS Code editor

echo Starting Typer Code Editor...

REM Ensure we're in the correct directory
cd /d %~dp0

REM Set environment to skip long prelaunch if needed
set VSCODE_SKIP_PRELAUNCH=1

REM Copy our simplified configurations
if exist "product.simplified.json" copy product.simplified.json product.json >nul
if exist "package.simplified.json" copy package.simplified.json package.json >nul

REM Copy simplified workbench
if exist "src\vs\workbench\workbench.simplified.main.ts" (
    copy src\vs\workbench\workbench.simplified.main.ts src\vs\workbench\workbench.common.main.ts >nul
)

REM Launch Typer
echo ✓ Launching Typer - Simplified Code Editor
.\scripts\code.bat %*

echo Typer has been launched!
