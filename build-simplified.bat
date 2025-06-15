@echo off
REM Typer Build Script for Windows
REM This script builds a simplified version of VS Code (now called Typer) with only essential features

echo Building Typer Code Editor...

REM Set Node.js paths (installed in A: drive)
set NODE_PATH=A:\node.exe
set NPM_PATH=A:\npm.cmd
set PATH=A:\;%PATH%

REM Check if Node.js is installed
%NODE_PATH% --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Node.js not found at %NODE_PATH%. Please check installation.
    exit /b 1
)

REM Check if npm is installed
echo Checking npm installation...
%NPM_PATH% --version
if %errorlevel% neq 0 (
    echo Error: npm not found at %NPM_PATH%. Please check installation.
    exit /b 1
)

REM Copy simplified configurations
echo Setting up simplified configurations...
copy product.simplified.json product.json >nul
copy package.simplified.json package.json >nul

REM Update the main workbench file to use simplified version
echo Updating workbench configuration...
if exist "src\vs\workbench\workbench.simplified.main.ts" (
    copy src\vs\workbench\workbench.simplified.main.ts src\vs\workbench\workbench.common.main.ts >nul
    echo ✓ Workbench configuration updated to simplified version
) else (
    echo Warning: Simplified workbench file not found, using default
)

REM Install dependencies
echo Installing dependencies (this may take a while)...
echo Cleaning previous installations...
if exist "node_modules" rmdir /s /q node_modules
if exist "package-lock.json" del package-lock.json

echo Running npm install...
%NPM_PATH% install --no-optional --no-audit --no-fund --legacy-peer-deps

REM Clean previous builds
echo Cleaning previous builds...
if exist "out" rmdir /s /q out

REM Build the application
echo Compiling TypeScript and building application...
%NPM_PATH% run compile

REM Check if build was successful
if %errorlevel% equ 0 (
    echo.
    echo ✓ Typer Code Editor build completed successfully!
    echo.
    echo Features included:
    echo   ✓ Core text editing
    echo   ✓ File explorer
    echo   ✓ GitHub integration ^(SCM^)
    echo   ✓ Chat features
    echo   ✓ Extensions support ^(for GitHub Copilot^)
    echo   ✓ Basic terminal
    echo.
    echo Features removed:
    echo   ✗ Advanced debugging
    echo   ✗ Testing framework
    echo   ✗ Notebooks
    echo   ✗ Telemetry
    echo   ✗ Advanced themes
    echo   ✗ User data sync
    echo   ✗ Remote development
    echo   ✗ Task system
    echo   ✗ Performance monitoring
    echo.
    echo To run Typer:
    echo   .\scripts\code.bat    # Start Typer in development mode
    echo   %NPM_PATH% run watch  # Start in watch mode
) else (
    echo ✗ Build failed. Please check the error messages above.
    exit /b 1
)
