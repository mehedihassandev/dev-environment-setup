# 📁 Repository Structure

A visual guide to understand what's in this repository and where everything is located.

## 🗂️ Complete Directory Tree

```
dev-environment-setup/
├── 📄 README.md                          # Main documentation (START HERE!)
├── 📄 QUICKSTART.md                      # 5-minute setup guide
├── 📄 CUSTOMIZATION.md                   # How to customize configs
├── 📄 SCRIPTS.md                         # Documentation for all scripts
├── 📄 STRUCTURE.md                       # This file
├── 📄 LICENSE                            # MIT License
│
├── 🔧 Core Configuration Files
│   ├── .zshrc                            # Zsh shell configuration
│   ├── .tmux.conf                        # Tmux terminal multiplexer config
│   ├── .gitconfig                        # Git global configuration
│   └── starship.toml                     # Starship prompt configuration
│
├── 🖥️ Terminal Emulator Configs
│   ├── alacritty.yml                     # Alacritty terminal config
│   ├── wezterm.lua                       # WezTerm terminal config
│   └── .config/
│       └── ghostty/                      # Ghostty terminal config
│
├── 📝 Editor Configurations
│   ├── nvim/                             # Neovim configuration
│   │   ├── init.lua                      # Neovim entry point
│   │   └── lua/                          # Lua configuration modules
│   │       ├── config/                   # Core settings
│   │       │   ├── keymaps.lua          # Key bindings
│   │       │   ├── options.lua          # Editor options
│   │       │   ├── autocmds.lua         # Auto commands
│   │       │   └── lazy.lua             # Plugin manager setup
│   │       └── plugins/                  # Plugin configurations
│   │           ├── lsp/                  # LSP configurations
│   │           ├── colorscheme.lua      # Theme config
│   │           ├── treesitter.lua       # Syntax highlighting
│   │           └── [other plugins]      # Various plugins
│   │
│   ├── .vscode/                          # VS Code configuration
│   │   ├── settings.json                # Editor settings
│   │   ├── keybindings.json            # Custom keybindings
│   │   ├── custom-vscode.css           # Custom CSS
│   │   └── vscode-script.js            # Custom JavaScript
│   │
│   ├── .zed/                             # Zed editor configuration
│   │   └── [config files]
│   │
│   └── .idea/                            # IntelliJ IDEA configuration
│       ├── .gitignore
│       ├── modules.xml
│       └── [other IDEA files]
│
├── 🔐 SSH & Git Setup
│   └── ssh/
│       ├── .config.md                    # Multiple Git account setup
│       └── .ssh.md                       # SSH configuration guide
│
├── 🤖 Automation Scripts
│   ├── install.sh                        # ⭐ Main installation script
│   ├── check-prerequisites.sh            # Check required tools
│   └── verify-setup.sh                   # Verify installation
│
└── 📚 GitHub Templates
    └── .github/
        └── PULL_REQUEST_TEMPLATE.md      # PR template for contributors
```

## 📊 File Categories

### 🎯 Essential Files (Must Read)

1. **README.md** - Complete documentation with everything you need
2. **QUICKSTART.md** - Fast track to get started in 5 minutes
3. **install.sh** - Automated installation script

### 🔧 Configuration Files

| File            | Purpose                 | Symlink Target                      |
| --------------- | ----------------------- | ----------------------------------- |
| `.zshrc`        | Zsh shell configuration | `~/.zshrc`                          |
| `.tmux.conf`    | Tmux configuration      | `~/.tmux.conf`                      |
| `.gitconfig`    | Git configuration       | `~/.gitconfig`                      |
| `starship.toml` | Prompt configuration    | `~/.config/starship.toml`           |
| `alacritty.yml` | Alacritty terminal      | `~/.config/alacritty/alacritty.yml` |
| `wezterm.lua`   | WezTerm terminal        | `~/.wezterm.lua`                    |

### 📝 Editor Configurations

#### Neovim (nvim/)

```
nvim/
├── init.lua              → ~/.config/nvim/init.lua
└── lua/                  → ~/.config/nvim/lua/
    ├── config/           # Core configurations
    │   ├── keymaps.lua   # All key mappings
    │   ├── options.lua   # Editor options (line numbers, tabs, etc)
    │   ├── autocmds.lua  # Automatic commands
    │   └── lazy.lua      # Lazy.nvim plugin manager
    └── plugins/          # Plugin configurations
        ├── lsp/          # Language Server Protocol
        ├── colorscheme.lua
        ├── treesitter.lua
        ├── telescope.lua
        └── [many more]
```

#### VS Code (.vscode/)

```
.vscode/
├── settings.json        → ~/Library/Application Support/Code/User/settings.json (macOS)
│                        → ~/.config/Code/User/settings.json (Linux)
├── keybindings.json     → [same pattern]/keybindings.json
├── custom-vscode.css    # Custom styling
└── vscode-script.js     # Custom scripts
```

### 🤖 Scripts Overview

| Script                   | Size    | Purpose             | Usage                      |
| ------------------------ | ------- | ------------------- | -------------------------- |
| `install.sh`             | ~7.8KB  | Install all configs | `./install.sh`             |
| `check-prerequisites.sh` | ~12.4KB | Check dependencies  | `./check-prerequisites.sh` |
| `verify-setup.sh`        | ~12.1KB | Verify installation | `./verify-setup.sh`        |

### 📚 Documentation Files

| File               | Purpose              | When to Read          |
| ------------------ | -------------------- | --------------------- |
| `README.md`        | Complete guide       | First time setup      |
| `QUICKSTART.md`    | Fast setup guide     | Want to start quickly |
| `CUSTOMIZATION.md` | Customization guide  | Making it your own    |
| `SCRIPTS.md`       | Script documentation | Understanding scripts |
| `STRUCTURE.md`     | This file            | Understanding layout  |
| `ssh/.config.md`   | SSH setup            | Multiple Git accounts |
| `LICENSE`          | MIT License          | Legal information     |

## 🎨 Configuration Themes

### Current Theme Setup

- **Shell Prompt**: Starship with Catppuccin Mocha
- **Tmux**: Catppuccin theme
- **Neovim**: Catppuccin (configurable)
- **VS Code**: Flate Arc theme
- **Terminal**: Various color schemes available

### Color Palettes Available

1. **Catppuccin Mocha** (Current)
   - Warm, pastel colors
   - Excellent readability
   - Used across: Starship, Tmux, Neovim

2. **Nord** (Alternative)
   - Arctic, north-bluish color palette
   - Available in Starship config

3. **OneDark** (Alternative)
   - Atom's iconic One Dark theme
   - Available in Starship config

## 🔄 Installation Flow

```
1. Clone Repository
   ↓
2. Run check-prerequisites.sh
   ↓
3. Install missing tools
   ↓
4. Run install.sh
   ↓
5. Run verify-setup.sh
   ↓
6. Reload shell (source ~/.zshrc)
   ↓
7. Configure Git user info
   ↓
8. Start tmux → Install plugins (Ctrl+s + I)
   ↓
9. Open nvim → Auto-install plugins
   ↓
10. Done! 🎉
```

## 📦 What Gets Installed Where

### Home Directory (~/)

```
~/
├── .zshrc                    # Symlink → dev-environment-setup/.zshrc
├── .tmux.conf                # Symlink → dev-environment-setup/.tmux.conf
├── .gitconfig                # Symlink → dev-environment-setup/.gitconfig
└── .wezterm.lua              # Symlink → dev-environment-setup/wezterm.lua
```

### Config Directory (~/.config/)

```
~/.config/
├── nvim/
│   ├── init.lua              # Symlink → dev-environment-setup/nvim/init.lua
│   └── lua/                  # Symlink → dev-environment-setup/nvim/lua/
├── alacritty/
│   └── alacritty.yml         # Symlink → dev-environment-setup/alacritty.yml
├── ghostty/
│   └── config                # Symlink → dev-environment-setup/.config/ghostty/config
└── starship.toml             # Symlink → dev-environment-setup/starship.toml
```

### VS Code Config

```
macOS: ~/Library/Application Support/Code/User/
Linux: ~/.config/Code/User/

Both contain:
├── settings.json             # Symlink → dev-environment-setup/.vscode/settings.json
└── keybindings.json          # Symlink → dev-environment-setup/.vscode/keybindings.json
```

## 🎯 Quick Navigation

### Want to customize...

**Shell (Zsh)**

- File: `.zshrc`
- Add aliases: Line ~45 onwards
- Change plugins: Line ~28
- Modify PATH: Line ~80 onwards

**Terminal Multiplexer (Tmux)**

- File: `.tmux.conf`
- Change prefix: Line ~5
- Modify keybindings: Line ~12 onwards
- Change theme: Line ~35 onwards

**Prompt (Starship)**

- File: `starship.toml`
- Change colors: Line ~130 (palettes section)
- Modify modules: Line ~6 (format section)
- Change symbols: Line ~16 onwards

**Editor (Neovim)**

- Main file: `nvim/init.lua`
- Keymaps: `nvim/lua/config/keymaps.lua`
- Options: `nvim/lua/config/options.lua`
- Plugins: `nvim/lua/plugins/`

**Git**

- File: `.gitconfig`
- User info: Add with `git config --global user.name "Name"`
- Aliases: Add under `[alias]` section

## 📏 File Sizes

```
Total repository size: ~250KB (without git history)

Breakdown:
- Documentation:     ~50KB  (README, guides)
- Scripts:           ~32KB  (install, check, verify)
- Zsh config:        ~5KB   (.zshrc)
- Tmux config:       ~5KB   (.tmux.conf)
- Alacritty config:  ~6KB   (alacritty.yml)
- Neovim config:     ~varies (depends on plugins)
- VS Code config:    ~varies (depends on extensions)
- Other configs:     ~10KB  (starship, wezterm, etc.)
```

## 🔍 Finding What You Need

### "I want to change..."

- **Shell prompt appearance** → `starship.toml`
- **Terminal colors** → Terminal-specific config (`alacritty.yml`, `wezterm.lua`, etc.)
- **Git aliases** → `.gitconfig`
- **Shell aliases** → `.zshrc` (search for "aliases")
- **Tmux key bindings** → `.tmux.conf` (search for "bind")
- **Neovim key bindings** → `nvim/lua/config/keymaps.lua`
- **VS Code settings** → `.vscode/settings.json`
- **Multiple Git accounts** → `ssh/.config.md`

### "I need help with..."

- **Installation** → `README.md` or `QUICKSTART.md`
- **Customization** → `CUSTOMIZATION.md`
- **Scripts** → `SCRIPTS.md`
- **Structure** → This file!
- **SSH/Git setup** → `ssh/.config.md`
- **Troubleshooting** → `README.md` (Troubleshooting section)

## 🚀 Power User Tips

### 1. Quick File Access

```bash
# Add to .zshrc
alias ezsh="nvim ~/.zshrc"
alias etmux="nvim ~/.tmux.conf"
alias egit="nvim ~/.gitconfig"
alias estart="nvim ~/.config/starship.toml"
alias envim="cd ~/.config/nvim && nvim ."
```

### 2. Sync Multiple Machines

```bash
# On machine 1
cd ~/dev-environment-setup
git add .
git commit -m "Update configs"
git push

# On machine 2
cd ~/dev-environment-setup
git pull
./install.sh
```

### 3. Test Changes Before Committing

```bash
# Create a test branch
git checkout -b test/my-changes

# Make changes
nvim .zshrc

# Test
source ~/.zshrc

# If good, merge
git checkout main
git merge test/my-changes
```

## 🎓 Learning Path

### Beginner

1. Read `QUICKSTART.md`
2. Run `install.sh`
3. Start using basic aliases
4. Customize colors/theme

### Intermediate

1. Read `CUSTOMIZATION.md`
2. Add custom aliases
3. Modify keybindings
4. Configure plugins

### Advanced

1. Study individual config files
2. Create custom plugins
3. Write custom functions
4. Contribute improvements

## 📞 Quick Reference

| Task                | Command                                |
| ------------------- | -------------------------------------- |
| Install everything  | `./install.sh`                         |
| Check dependencies  | `./check-prerequisites.sh`             |
| Verify installation | `./verify-setup.sh`                    |
| Reload Zsh          | `source ~/.zshrc`                      |
| Reload Tmux         | `tmux source-file ~/.tmux.conf`        |
| Edit Zsh config     | `nvim ~/.zshrc`                        |
| Edit Tmux config    | `nvim ~/.tmux.conf`                    |
| Git user setup      | `git config --global user.name "Name"` |

## 🌟 Key Features by Component

### Zsh (.zshrc)

- ✅ Starship prompt
- ✅ Oh My Zsh framework
- ✅ 10+ plugins
- ✅ 50+ aliases
- ✅ FZF integration
- ✅ Zoxide smart cd

### Tmux (.tmux.conf)

- ✅ Custom prefix (Ctrl+s)
- ✅ Vi mode
- ✅ 20+ plugins
- ✅ Session persistence
- ✅ Catppuccin theme
- ✅ Mouse support

### Neovim (nvim/)

- ✅ Lazy.nvim plugin manager
- ✅ LSP support
- ✅ Treesitter
- ✅ Telescope fuzzy finder
- ✅ Auto-completion
- ✅ Modern UI

### Git (.gitconfig)

- ✅ Custom aliases
- ✅ Multi-account support
- ✅ Color configuration
- ✅ Default settings

---

**Last Updated**: December 03, 2025

**Maintained By**: MD Mehedi Hassan

**Questions?** Check the main [README.md](README.md) or open an issue!
