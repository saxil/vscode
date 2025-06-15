# Simple Code Editor

A simplified version of Visual Studio Code focused on essential code editing features with GitHub integration and AI chat capabilities.

## Features Included ✅

### Core Functionality
- **Text Editor**: Full-featured code editor with syntax highlighting
- **File Explorer**: Basic file and folder management
- **Search**: File and text search capabilities
- **Command Palette**: Quick access to commands and actions

### GitHub Integration
- **Source Control Management (SCM)**: Full Git integration
- **GitHub Authentication**: Sign in with GitHub account
- **Repository Management**: Clone, commit, push, pull operations

### AI Features
- **Chat Interface**: Built-in AI chat for coding assistance
- **GitHub Copilot Support**: Extension system supports GitHub Copilot
- **Inline Chat**: AI assistance directly in the editor

### Extensions
- **Extension Manager**: Install and manage extensions
- **GitHub Copilot**: AI-powered code completion (when installed)
- **Language Support**: Support for popular programming languages

### Terminal
- **Integrated Terminal**: Run commands and scripts
- **Multiple Shells**: Support for PowerShell, Command Prompt, etc.

## Features Removed ❌

To keep the editor lightweight and focused, the following features have been removed:

- Advanced debugging tools
- Testing framework integration
- Jupyter notebook support
- Complex telemetry and analytics
- User data synchronization
- Remote development features
- Advanced task running system
- Timeline and file history
- Performance monitoring tools
- Complex merge editor
- Surveys and feedback systems
- Advanced themes and customization

## Installation and Setup

### Prerequisites
- Node.js (v18 or higher)
- npm (comes with Node.js)
- Git

### Build from Source

1. **Clone the repository:**
   ```bash
   git clone https://github.com/microsoft/vscode.git
   cd vscode
   ```

2. **Run the simplified build:**

   On Windows:
   ```batch
   build-simplified.bat
   ```

   On macOS/Linux:
   ```bash
   chmod +x build-simplified.sh
   ./build-simplified.sh
   ```

3. **Start the application:**
   ```bash
   npm run watch    # Development mode with hot reload
   # OR
   npm run electron # Run the built application
   ```

### Configuration

The simplified editor comes with optimized settings in `simple-code-settings.json`. Key configurations include:

- Telemetry disabled
- Simplified UI layout
- GitHub Copilot enabled
- Essential extensions only
- Basic themes

## Usage

### Getting Started
1. Open a folder or file using File → Open Folder
2. Use the file explorer to navigate your project
3. Start coding with syntax highlighting and basic IntelliSense

### GitHub Integration
1. Sign in to GitHub via the account menu
2. Clone repositories using Command Palette (Ctrl+Shift+P) → "Git: Clone"
3. Use the Source Control panel for Git operations

### AI Chat
1. Open the chat panel from the activity bar
2. Ask coding questions or request help
3. Use inline chat (Ctrl+I) for contextual assistance

### Installing GitHub Copilot
1. Open Extensions panel (Ctrl+Shift+X)
2. Search for "GitHub Copilot"
3. Install and sign in with your GitHub account

## Development

### File Structure
```
src/vs/workbench/
├── workbench.simplified.main.ts    # Main entry point (simplified)
├── contrib/                        # Feature contributions
│   ├── chat/                       # AI chat features
│   ├── scm/                        # Source control
│   ├── extensions/                 # Extension management
│   ├── terminal/                   # Terminal integration
│   └── files/                      # File explorer
└── services/                       # Core services
```

### Building for Production
```bash
npm run compile
npm run electron
```

### Customizing the Build
- Modify `workbench.simplified.main.ts` to add/remove features
- Update `product.simplified.json` for branding changes
- Edit `package.simplified.json` for dependency management

## Comparison with Full VS Code

| Feature | Full VS Code | Simple Code |
|---------|--------------|-------------|
| Code Editing | ✅ | ✅ |
| File Management | ✅ | ✅ |
| GitHub Integration | ✅ | ✅ |
| AI Chat | ✅ | ✅ |
| Extensions | ✅ | ✅ (Limited) |
| Terminal | ✅ | ✅ (Basic) |
| Debugging | ✅ | ❌ |
| Testing | ✅ | ❌ |
| Notebooks | ✅ | ❌ |
| Remote Dev | ✅ | ❌ |
| Telemetry | ✅ | ❌ |
| Size | ~200MB | ~100MB |

## Contributing

This is a simplified fork of VS Code. For the original project:
- [VS Code Repository](https://github.com/microsoft/vscode)
- [VS Code Contributing Guide](https://github.com/microsoft/vscode/blob/main/CONTRIBUTING.md)

## License

MIT License - see [LICENSE.txt](LICENSE.txt) for details.

This project is based on Visual Studio Code, which is licensed under the MIT License.

## Support

For issues related to the simplified version, please check:
1. [VS Code Issues](https://github.com/microsoft/vscode/issues) for core functionality
2. [GitHub Copilot Support](https://github.com/github/copilot-docs) for AI features
3. Extension-specific repositories for extension issues

## Changelog

### v1.0.0
- Initial simplified release
- Removed advanced debugging, testing, notebooks
- Disabled telemetry and data sync
- Streamlined UI and features
- Focus on code editing, GitHub integration, and AI chat
