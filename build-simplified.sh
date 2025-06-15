#!/bin/bash

# Simple Code Build Script
# This script builds a simplified version of VS Code with only essential features

echo "Building Simple Code Editor..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Error: Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "Error: npm is not installed. Please install npm first."
    exit 1
fi

# Copy simplified configurations
echo "Setting up simplified configurations..."
cp product.simplified.json product.json
cp package.simplified.json package.json

# Update the main workbench file to use simplified version
echo "Updating workbench configuration..."
if [ -f "src/vs/workbench/workbench.simplified.main.ts" ]; then
    cp src/vs/workbench/workbench.simplified.main.ts src/vs/workbench/workbench.common.main.ts
    echo "✓ Workbench configuration updated to simplified version"
else
    echo "Warning: Simplified workbench file not found, using default"
fi

# Install dependencies
echo "Installing dependencies..."
npm install

# Clean previous builds
echo "Cleaning previous builds..."
if [ -d "out" ]; then
    rm -rf out
fi

# Build the application
echo "Compiling TypeScript and building application..."
npm run compile

# Check if build was successful
if [ $? -eq 0 ]; then
    echo ""
    echo "✓ Simple Code Editor build completed successfully!"
    echo ""
    echo "Features included:"
    echo "  ✓ Core text editing"
    echo "  ✓ File explorer"
    echo "  ✓ GitHub integration (SCM)"
    echo "  ✓ Chat features"
    echo "  ✓ Extensions support (for GitHub Copilot)"
    echo "  ✓ Basic terminal"
    echo ""
    echo "Features removed:"
    echo "  ✗ Advanced debugging"
    echo "  ✗ Testing framework"
    echo "  ✗ Notebooks"
    echo "  ✗ Telemetry"
    echo "  ✗ Advanced themes"
    echo "  ✗ User data sync"
    echo "  ✗ Remote development"
    echo "  ✗ Task system"
    echo "  ✗ Performance monitoring"
    echo ""
    echo "To run the application:"
    echo "  npm run watch    # Start in development mode"
    echo "  npm run electron # Run the built application"
else
    echo "✗ Build failed. Please check the error messages above."
    exit 1
fi
