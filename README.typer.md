# Typer - Simplified Code Editor

**Typer** is a lightweight, simplified version of VS Code focused on essential development features. It provides a clean, fast coding experience with GitHub integration and AI assistance.

## 🚀 Quick Start

### Launch Typer
```bash
# Windows
.\typer.bat

# Or use the build script
.\build-simplified.bat

# Or manually
.\scripts\code.bat
```

## ✨ Features

### ✅ **Included in Typer:**
- **📝 Core Text Editing** - Monaco editor with syntax highlighting
- **📁 File Explorer** - Navigate and manage your project files
- **🔧 GitHub Integration** - Built-in Git/SCM support
- **💬 Chat Features** - AI assistance for coding help
- **🧩 Extensions** - Support for GitHub Copilot and essential extensions
- **💻 Terminal** - Integrated terminal for running commands
- **⚙️ Settings** - Essential preferences and configurations

### ❌ **Removed from Typer:**
- Advanced debugging tools
- Testing frameworks and runners
- Notebook support (Jupyter)
- Telemetry and data collection
- Remote development features
- Complex task runners
- Advanced theme customization
- User data synchronization
- Performance monitoring tools
- Survey systems

## 📦 Installation

### Prerequisites
- **Node.js** (installed on A: drive for this setup)
- **Git** (for version control features)

### Setup Steps
1. **Clone/Download** this repository
2. **Run the launcher**: `.\typer.bat`
3. **First time setup** may take a moment to configure

### Configuration Files
- `product.simplified.json` - Typer branding and settings
- `package.simplified.json` - Minimal dependencies
- `simple-code-settings.json` - Default user settings
- `workbench.simplified.main.ts` - Core feature imports

## 🎯 Usage

### Basic Operations
- **Open Project**: File → Open Folder
- **Git Operations**: Source Control panel (Ctrl+Shift+G)
- **Terminal**: View → Terminal (Ctrl+`)
- **Extensions**: Extensions panel (Ctrl+Shift+X)
- **Chat**: Chat panel for AI assistance

### Recommended Extensions
- **GitHub Copilot** - AI code completion
- **GitLens** - Enhanced Git integration
- **Live Server** - Web development server
- **Prettier** - Code formatting

## ⚡ Performance

Typer is designed to be:
- **~50% smaller** than full VS Code
- **Faster startup** with reduced feature loading
- **Lower memory usage** for basic development tasks
- **Focused workflow** without distracting advanced features

## 🛠 Customization

### Feature Toggles
Edit `src/vs/workbench/simpleCodeFeatures.ts` to enable/disable features:

```typescript
export const SIMPLE_CODE_FEATURES = {
    editor: true,        // Core editing
    explorer: true,      // File explorer
    scm: true,          // Git integration
    chat: true,         // AI chat
    terminal: true,     // Integrated terminal
    extensions: true,   // Extension support
    
    // Advanced features (disabled)
    debug: false,
    testing: false,
    notebooks: false,
};
```

### Branding
Update `product.simplified.json` to change:
- Application name and title
- Icon and branding
- Default settings
- Extension marketplace

### Dependencies
Modify `package.simplified.json` to:
- Add/remove npm dependencies
- Update package versions
- Change build scripts

## 🚧 Development

### Building from Source
```bash
# Full build
.\build-simplified.bat

# Development mode
.\scripts\code.bat

# Watch mode (auto-rebuild)
npm run watch
```

### Project Structure
```
typer/
├── src/vs/workbench/
│   ├── workbench.simplified.main.ts  # Main entry point
│   └── simpleCodeFeatures.ts         # Feature configuration
├── product.simplified.json           # App configuration
├── package.simplified.json           # Dependencies
├── simple-code-settings.json         # Default settings
├── typer.bat                          # Quick launcher
└── build-simplified.bat              # Build script
```

## 📄 License

MIT License - Same as VS Code

## 🤝 Contributing

This is a simplified version of VS Code. For the main VS Code project, visit: https://github.com/microsoft/vscode

---

**Typer** - Code simple, code fast. 🚀
