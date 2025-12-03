# 🚀 Dev Environment Setup

A comprehensive collection of development environment configurations for terminals, editors, and tools. This repository contains my personal dotfiles and configurations optimized for a productive development workflow.

> **🎯 New here?** Start with [GETTING-STARTED.md](GETTING-STARTED.md) for a 5-minute quickstart!

## 📋 Table of Contents

- [Overview](#overview)
- [What's Included](#whats-included)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Installation](#installation)
- [Configuration Details](#configuration-details)
- [Customization Guide](#customization-guide)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

## 📖 Documentation

- **[GETTING-STARTED.md](GETTING-STARTED.md)** - Start here! 5-minute quickstart
- **[QUICKSTART.md](QUICKSTART.md)** - Detailed quick setup guide
- **[CUSTOMIZATION.md](CUSTOMIZATION.md)** - Make it your own
- **[SCRIPTS.md](SCRIPTS.md)** - Script documentation
- **[STRUCTURE.md](STRUCTURE.md)** - Repository structure
- **[ssh/.config.md](ssh/.config.md)** - SSH & Git multi-account setup

## 🎯 Overview

This repository contains dotfiles and configurations for:

- **Shell**: Zsh with Oh My Zsh, Starship prompt
- **Terminal Emulators**: Alacritty, WezTerm, Ghostty
- **Terminal Multiplexer**: Tmux with extensive plugin setup
- **Code Editors**: Neovim, VS Code, IntelliJ IDEA, Zed
- **Version Control**: Git with multi-account support
- **Development Tools**: Node.js, Python, Docker, AWS, and more

## 📦 What's Included

```
.
├── .config/
│   └── ghostty/          # Ghostty terminal configuration
├── .idea/                # IntelliJ IDEA project settings
├── .vscode/              # VS Code settings, keybindings, and customizations
├── .zed/                 # Zed editor configuration
├── nvim/                 # Neovim configuration with Lazy.nvim
│   ├── init.lua
│   └── lua/
│       ├── config/       # Core configurations
│       └── plugins/      # Plugin configurations
├── ssh/                  # SSH and Git multi-account setup guides
├── .gitconfig            # Global Git configuration
├── .tmux.conf            # Tmux configuration with plugins
├── .zshrc                # Zsh configuration with aliases and tools
├── alacritty.yml         # Alacritty terminal emulator config
├── starship.toml         # Starship prompt configuration
└── wezterm.lua           # WezTerm terminal emulator config
```

## ⚙️ Prerequisites

Before using these configurations, ensure you have the following installed:

### Essential

- **Git**: Version control system
- **Zsh**: Unix shell (macOS default, Linux: `sudo apt install zsh`)
- **Oh My Zsh**: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

### Terminal & Shell Enhancements

- **Starship**: `curl -sS https://starship.rs/install.sh | sh`
- **Tmux**: `brew install tmux` (macOS) or `sudo apt install tmux` (Linux)
- **TPM** (Tmux Plugin Manager):
  ```bash
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ```

### Optional Terminal Emulators (choose one or more)

- **Alacritty**: `brew install --cask alacritty`
- **WezTerm**: `brew install --cask wezterm`
- **Ghostty**: Download from [ghostty.org](https://ghostty.org)

### CLI Tools

- **fzf**: Fuzzy finder - `brew install fzf`
- **fd**: Better find - `brew install fd`
- **bat**: Better cat - `brew install bat`
- **eza**: Better ls - `brew install eza`
- **zoxide**: Smarter cd - `brew install zoxide`
- **ripgrep**: Better grep - `brew install ripgrep`

### Zsh Plugins

```bash
# Auto-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Fast syntax highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# Auto-notify
git clone https://github.com/MichaelAquilina/zsh-auto-notify.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/auto-notify

# You should use
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use

# Autocomplete
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
```

### Editors (optional)

- **Neovim**: `brew install neovim` (requires Neovim 0.9+)
- **VS Code**: Download from [code.visualstudio.com](https://code.visualstudio.com)
- **Zed**: Download from [zed.dev](https://zed.dev)

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/dev-environment-setup.git
cd dev-environment-setup
```

### 2. Backup Existing Configurations

```bash
# Backup your current configs (important!)
mkdir -p ~/dotfiles-backup
cp ~/.zshrc ~/dotfiles-backup/.zshrc 2>/dev/null
cp ~/.tmux.conf ~/dotfiles-backup/.tmux.conf 2>/dev/null
cp ~/.gitconfig ~/dotfiles-backup/.gitconfig 2>/dev/null
```

### 3. Create Symlinks

```bash
# Zsh configuration
ln -sf $(pwd)/.zshrc ~/.zshrc

# Tmux configuration
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf

# Git configuration
ln -sf $(pwd)/.gitconfig ~/.gitconfig

# Starship prompt
ln -sf $(pwd)/starship.toml ~/.config/starship.toml

# Alacritty (if using)
mkdir -p ~/.config/alacritty
ln -sf $(pwd)/alacritty.yml ~/.config/alacritty/alacritty.yml

# WezTerm (if using)
ln -sf $(pwd)/wezterm.lua ~/.wezterm.lua

# Ghostty (if using)
mkdir -p ~/.config/ghostty
ln -sf $(pwd)/.config/ghostty/config ~/.config/ghostty/config

# Neovim (if using)
mkdir -p ~/.config/nvim
ln -sf $(pwd)/nvim/init.lua ~/.config/nvim/init.lua
ln -sf $(pwd)/nvim/lua ~/.config/nvim/lua

# VS Code (if using - macOS)
ln -sf $(pwd)/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf $(pwd)/.vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# VS Code (if using - Linux)
# ln -sf $(pwd)/.vscode/settings.json ~/.config/Code/User/settings.json
# ln -sf $(pwd)/.vscode/keybindings.json ~/.config/Code/User/keybindings.json
```

### 4. Reload Configurations

```bash
# Reload Zsh
source ~/.zshrc

# Reload Tmux (if already running)
tmux source-file ~/.tmux.conf

# Install Tmux plugins (inside tmux)
# Press: Ctrl+s (prefix) + I (capital i)
```

## 📝 Installation

### Complete Installation Script

Create this script for automated installation:

```bash
#!/bin/bash

REPO_DIR=$(pwd)
BACKUP_DIR=~/dotfiles-backup-$(date +%Y%m%d-%H%M%S)

echo "🔥 Starting Dev Environment Setup..."

# Create backup directory
mkdir -p "$BACKUP_DIR"
echo "📦 Backing up existing configs to $BACKUP_DIR"

# Backup existing files
for file in .zshrc .tmux.conf .gitconfig; do
  [ -f ~/$file ] && cp ~/$file "$BACKUP_DIR/"
done

# Create necessary directories
mkdir -p ~/.config/{alacritty,nvim,ghostty,starship}

# Create symlinks
echo "🔗 Creating symlinks..."

ln -sf "$REPO_DIR/.zshrc" ~/.zshrc
ln -sf "$REPO_DIR/.tmux.conf" ~/.tmux.conf
ln -sf "$REPO_DIR/.gitconfig" ~/.gitconfig
ln -sf "$REPO_DIR/starship.toml" ~/.config/starship.toml
ln -sf "$REPO_DIR/alacritty.yml" ~/.config/alacritty/alacritty.yml
ln -sf "$REPO_DIR/wezterm.lua" ~/.wezterm.lua

# Neovim
ln -sf "$REPO_DIR/nvim/init.lua" ~/.config/nvim/init.lua
ln -sf "$REPO_DIR/nvim/lua" ~/.config/nvim/lua

echo "✅ Installation complete!"
echo "🔄 Run 'source ~/.zshrc' to apply changes"
echo "📝 Don't forget to configure your Git user details!"
```

Save as `install.sh`, make executable with `chmod +x install.sh`, and run `./install.sh`.

## ⚡ Configuration Details

### Zsh (.zshrc)

**Features:**

- Starship prompt integration
- Oh My Zsh framework
- Extensive plugin support
- Custom aliases for Git, npm, yarn, tmux
- FZF integration with custom previews
- Zoxide for smarter navigation
- Auto-notification for long-running commands

**Key Aliases:**

```bash
# Git shortcuts
gs          # git status
ga          # git add .
gcm         # git commit -m
gpl         # git pull
gpu         # git push
glg         # Pretty git log

# Development
ni          # npm install
ns          # npm start
yi          # yarn install
ys          # yarn start
c           # code .

# Tmux
tn          # tmux new -s (new session)
tk          # tmux kill-session -t

# System
cl          # clear
sz          # source ~/.zshrc
```

### Tmux (.tmux.conf)

**Features:**

- Custom prefix: `Ctrl+s` (instead of `Ctrl+b`)
- Vi mode keybindings
- Mouse support enabled
- 20+ plugins for enhanced functionality
- Catppuccin theme
- Session management with sessionx
- Vim-tmux navigator integration
- Automatic session persistence and restore

**Key Bindings:**

```bash
Ctrl+s          # Prefix key
Prefix + v      # Split vertically
Prefix + s      # Split horizontally
Prefix + h/j/k/l # Navigate panes (vim-style)
Prefix + H/L    # Previous/Next window
Prefix + w      # Session manager (sessionx)
Prefix + f      # Floating window
Prefix + I      # Install plugins
```

### Starship (starship.toml)

**Features:**

- Catppuccin Mocha color scheme
- Git status indicators
- Language version displays (Node, Python, Go, Rust, etc.)
- AWS profile display
- Docker context awareness
- Custom success/error symbols (🚀/🔥)
- Minimal and fast prompt

### Git (.gitconfig)

**Configuration:**

- Update with your personal details:
  ```bash
  git config --global user.name "Your Name"
  git config --global user.email "your.email@example.com"
  ```

### Multiple Git Accounts Setup

See `ssh/.config.md` for detailed setup. Quick overview:

1. Generate SSH keys for each account:

   ```bash
   ssh-keygen -t ed25519 -C "personal@email.com" -f ~/.ssh/id_ed25519_personal
   ssh-keygen -t ed25519 -C "work@email.com" -f ~/.ssh/id_ed25519_work
   ```

2. Add to SSH config (`~/.ssh/config`):

   ```
   Host personal.github.com
     HostName github.com
     PreferredAuthentications publickey
     IdentityFile ~/.ssh/id_ed25519_personal

   Host work.github.com
     HostName github.com
     PreferredAuthentications publickey
     IdentityFile ~/.ssh/id_ed25519_work
   ```

3. Clone with custom host:
   ```bash
   git clone git@personal.github.com:username/repo.git
   git clone git@work.github.com:company/repo.git
   ```

### Neovim (nvim/)

**Features:**

- Lazy.nvim plugin manager
- LSP configuration for multiple languages
- Treesitter for syntax highlighting
- Telescope for fuzzy finding
- Auto-completion with nvim-cmp
- File explorer and buffer management
- Custom keymaps in `lua/config/keymaps.lua`

**First Launch:**

```bash
nvim
# Lazy.nvim will automatically install plugins
```

### VS Code (.vscode/)

**Features:**

- Custom theme: Flate Arc
- Cascadia Code font with ligatures
- Relative line numbers
- Activity bar on top
- Sidebar on right
- Custom CSS and JavaScript modifications
- Extensive keybindings

**Apply Settings:**
The symlink will automatically apply settings to VS Code.

## 🎨 Customization Guide

### Making It Your Own

#### 1. Update Personal Information

**Git Configuration:**

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

**Zsh (.zshrc):**

- Change Java paths if needed
- Modify Android SDK paths
- Add/remove aliases based on your workflow
- Adjust environment variables

#### 2. Customize Starship Prompt

Edit `starship.toml`:

```toml
[character]
success_symbol = "➜"  # Change this to your preferred symbol
error_symbol = "✗"

# Change color palette
palette = 'catppuccin_mocha'  # Try: nord, onedark, mehedi
```

#### 3. Modify Tmux Theme

Edit `.tmux.conf`:

```bash
# Change theme plugin
set -g @plugin 'catppuccin-tmux'  # Try: nord-tmux, tmux-themepack

# Modify status bar modules
set -g @catppuccin_status_modules_right "directory date_time"
```

#### 4. Add Custom Aliases

Edit `.zshrc`:

```bash
# Add your custom aliases
alias myproject="cd ~/projects/my-awesome-project"
alias dc="docker-compose"
alias k="kubectl"
```

#### 5. Configure Terminal Colors

Each terminal emulator config file has color schemes you can modify:

- **Alacritty**: Edit `alacritty.yml` colors section
- **WezTerm**: Edit `wezterm.lua` color scheme
- **Ghostty**: Edit `.config/ghostty/config`

## 🔧 Troubleshooting

### Zsh Plugins Not Working

```bash
# Reinstall Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone missing plugins (see Prerequisites section)
```

### Tmux Plugins Not Loading

```bash
# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Inside tmux, press: Ctrl+s then I (capital i)
```

### Starship Not Showing

```bash
# Install Starship
curl -sS https://starship.rs/install.sh | sh

# Add to .zshrc (already included)
eval "$(starship init zsh)"
```

### Neovim LSP Not Working

```bash
# Install language servers
npm install -g typescript-language-server
npm install -g vscode-langservers-extracted
pip install python-lsp-server
```

### FZF Preview Not Working

```bash
# Install required tools
brew install bat eza fd ripgrep
```

### Fonts Not Rendering Properly

Install a Nerd Font:

```bash
brew tap homebrew/cask-fonts
brew install --cask font-cascadia-code-nerd-font
brew install --cask font-fira-code-nerd-font
```

## 🎯 Usage Tips

### Tmux Workflow

```bash
# Start new session
tn mysession

# Detach from session
Ctrl+s then d

# List sessions
tmux ls

# Attach to session
tmux attach -t mysession

# Kill session
tk mysession
```

### Git Workflow with Multiple Accounts

```bash
# Clone with personal account
git clone git@personal.github.com:username/repo.git

# In the repo, set local config
cd repo
git config user.name "Personal Name"
git config user.email "personal@email.com"
```

### FZF Power Usage

```bash
# Fuzzy find files
Ctrl+t

# Fuzzy find directories
Alt+c

# Search command history
Ctrl+r

# Use in commands
nvim $(fzf)
cd $(fd -t d | fzf)
```

### Zoxide Smart Navigation

```bash
# Jump to frequently used directories
z proj          # Goes to ~/projects
z doc           # Goes to ~/Documents
z env setup     # Goes to ~/dev-environment-setup

# List all tracked directories
z -l
```

## 📚 Additional Resources

- [Oh My Zsh Documentation](https://github.com/ohmyzsh/ohmyzsh/wiki)
- [Tmux Cheat Sheet](https://tmuxcheatsheet.com/)
- [Starship Documentation](https://starship.rs/)
- [Neovim Documentation](https://neovim.io/doc/)
- [FZF Examples](https://github.com/junegunn/fzf#examples)

## 🤝 Contributing

Feel free to fork this repository and customize it for your own needs! If you have improvements or suggestions:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🔧 Maintaining Your Setup

### Keeping Documentation Dates Current

Use the included `update-dates.sh` script to automatically update dates in documentation:

```bash
# After making commits
./update-dates.sh

# This will automatically update:
# - "Last Updated" dates → Latest commit date
# - "Created" dates → First commit date
```

The script intelligently uses:

- **First commit date** (e.g., April 18, 2024) for "Created" dates
- **Latest commit date** (e.g., December 03, 2025) for "Last Updated" dates

Files automatically updated:

- README.md
- QUICKSTART.md
- CUSTOMIZATION.md
- SCRIPTS.md
- SCRIPTS-REFERENCE.md
- STRUCTURE.md
- PROJECT-SUMMARY.md
- GETTING-STARTED.md
- And other documentation files

## 💡 Tips for Creating Your Own

1. **Start Small**: Don't copy everything at once. Start with shell configuration, then add tools gradually
2. **Document Changes**: Keep notes on what each configuration does
3. **Version Control**: Use Git to track changes to your dotfiles
4. **Test First**: Try configurations in a test environment before applying to your main setup
5. **Backup Always**: Always backup your existing configurations before replacing them
6. **Share and Learn**: Share your setup with others and learn from their configurations
7. **Keep Dates Current**: Run `./update-dates.sh` after commits - it automatically uses first commit for "Created" and latest commit for "Last Updated"

## 🌟 Acknowledgments

Thanks to the amazing open-source community for creating these incredible tools and plugins!

---

**Made with ❤️ for developers who love customization**

_Last Updated: 
