# Simple Code Build Script for Windows PowerShell
# This script builds a simplified version of VS Code with only essential features

Write-Host "Building Simple Code Editor..." -ForegroundColor Green

# Set Node.js paths (installed in A: drive)
$nodePath = "A:\node.exe"
$npmPath = "A:\npm.cmd"

# Add A:\ to PATH for this session
$env:PATH = "A:\;" + $env:PATH

# Check if Node.js is installed
Write-Host "Checking Node.js installation..."
try {
    $nodeVersion = & $nodePath --version
    Write-Host "✓ Node.js version: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Error: Node.js not found at $nodePath" -ForegroundColor Red
    exit 1
}

# Copy simplified configurations
Write-Host "Setting up simplified configurations..."
Copy-Item "product.simplified.json" "product.json" -Force
Copy-Item "package.simplified.json" "package.json" -Force
Write-Host "✓ Configuration files copied" -ForegroundColor Green

# Update the main workbench file to use simplified version
Write-Host "Updating workbench configuration..."
if (Test-Path "src\vs\workbench\workbench.simplified.main.ts") {
    Copy-Item "src\vs\workbench\workbench.simplified.main.ts" "src\vs\workbench\workbench.common.main.ts" -Force
    Write-Host "✓ Workbench configuration updated to simplified version" -ForegroundColor Green
} else {
    Write-Host "⚠ Warning: Simplified workbench file not found, using default" -ForegroundColor Yellow
}

# Check if dependencies are already installed
if (-not (Test-Path "node_modules")) {
    Write-Host "Installing dependencies (this may take a while)..."
    try {
        # Use cmd to run npm to avoid execution policy issues
        cmd /c "$npmPath install --no-progress --loglevel=error"
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ Dependencies installed successfully" -ForegroundColor Green
        } else {
            Write-Host "✗ Failed to install dependencies" -ForegroundColor Red
            exit 1
        }
    } catch {
        Write-Host "✗ Error installing dependencies: $_" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "✓ Dependencies already installed" -ForegroundColor Green
}

# Try to run VS Code in development mode directly
Write-Host "Starting Simple Code Editor in development mode..."
Write-Host "This will open the simplified VS Code with only essential features." -ForegroundColor Cyan

try {
    # Use the VS Code development script
    & ".\scripts\code.bat" --no-sandbox --disable-dev-shm-usage
} catch {
    Write-Host "✗ Failed to start VS Code: $_" -ForegroundColor Red
    Write-Host "Try running manually: .\scripts\code.bat" -ForegroundColor Yellow
}

Write-Host "`nSimple Code Editor Features:" -ForegroundColor Cyan
Write-Host "  ✓ Core text editing" -ForegroundColor Green
Write-Host "  ✓ File explorer" -ForegroundColor Green
Write-Host "  ✓ GitHub integration (SCM)" -ForegroundColor Green
Write-Host "  ✓ Chat features" -ForegroundColor Green
Write-Host "  ✓ Extensions support (for GitHub Copilot)" -ForegroundColor Green
Write-Host "  ✓ Basic terminal" -ForegroundColor Green
Write-Host "`nRemoved features:" -ForegroundColor Cyan
Write-Host "  ✗ Advanced debugging" -ForegroundColor Red
Write-Host "  ✗ Testing framework" -ForegroundColor Red
Write-Host "  ✗ Notebooks" -ForegroundColor Red
Write-Host "  ✗ Telemetry" -ForegroundColor Red
Write-Host "  ✗ Advanced themes" -ForegroundColor Red
Write-Host "  ✗ User data sync" -ForegroundColor Red
