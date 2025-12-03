# 🎨 Customization Guide

A comprehensive guide to customizing this dev environment setup and creating your own configurations.

## 📋 Table of Contents

- [Philosophy](#philosophy)
- [Before You Start](#before-you-start)
- [Customizing Each Component](#customizing-each-component)
- [Creating Your Own Setup](#creating-your-own-setup)
- [Best Practices](#best-practices)
- [Common Customizations](#common-customizations)
- [Advanced Tips](#advanced-tips)

## 🎯 Philosophy

> "Your dotfiles should reflect your workflow, not someone else's."

This setup is designed to be a starting point. Feel free to:
- Remove what you don't use
- Add what you need
- Modify everything to match your preferences
- Experiment without fear (backups exist for a reason!)

## 🚦 Before You Start

### 1. Understand What You're Changing

Before modifying a configuration:
- Read the comments in the file
- Check the tool's documentation
- Test changes in a non-critical environment
- Keep notes on what works and what doesn't

### 2. Use Version Control

```bash
# Initialize git in your dotfiles directory
cd ~/dotfiles
git init
git add .
git commit -m "Initial commit"

# Create a new branch for experiments
git checkout -b experiment/new-feature
```

### 3. Create a Testing Environment

```bash
# Test Zsh config in a subshell
zsh -f  # Start without config
source ~/dotfiles/.zshrc  # Test your config

# Test tmux config
tmux -f ~/dotfiles/.tmux.conf new-session
```

## ⚙️ Customizing Each Component

### Zsh Configuration (.zshrc)

#### Change Your Theme

```bash
# Current: Starship
eval "$(starship init zsh)"

# Alternative: Powerlevel10k
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Alternative: Pure
# autoload -U promptinit; promptinit
# prompt pure
```

#### Add Custom Aliases

```bash
# Find the aliases section and add your own:

# Personal shortcuts
alias work="cd ~/work && ls"
alias personal="cd ~/personal && ls"

# Docker shortcuts
alias dps="docker ps"
alias dcu="docker-compose up"
alias dcd="docker-compose down"

# Kubernetes shortcuts
alias k="kubectl"
alias kgp="kubectl get pods"
alias kgs="kubectl get services"

# Custom git aliases
alias gsync="git fetch --all && git pull"
alias gclean="git branch --merged | grep -v '\*' | xargs -n 1 git branch -d"

# Quick edits
alias ezsh="nvim ~/.zshrc"
alias etmux="nvim ~/.tmux.conf"
alias evim="nvim ~/.config/nvim/init.lua"
```

#### Modify Plugins

```bash
# Current plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  auto-notify
  z
  you-should-use
  fast-syntax-highlighting
  zsh-autocomplete
  history
  web-search
  copybuffer
  dirhistory
)

# Add more plugins:
# docker                  # Docker completions
# docker-compose          # Docker Compose completions
# kubectl                 # Kubernetes completions
# npm                     # NPM completions
# node                    # Node.js completions
# python                  # Python completions
# rust                    # Rust completions
# terraform               # Terraform completions
```

#### Customize Environment Variables

```bash
# Editor preferences
export EDITOR="nvim"              # or "code" or "vim"
export VISUAL="nvim"

# Language-specific
export PYTHONPATH="$HOME/python-libs:$PYTHONPATH"
export GOPATH="$HOME/go"
export RUSTUP_HOME="$HOME/.rustup"

# Tool configurations
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude .git"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

# Development
export NODE_ENV="development"
export DEBUG="app:*"
```

### Tmux Configuration (.tmux.conf)

#### Change Prefix Key

```bash
# Current: Ctrl+s
set -g prefix C-s

# Popular alternatives:
# set -g prefix C-a        # Like screen
# set -g prefix C-Space    # Spacebar
# set -g prefix C-q        # Q key
```

#### Customize Key Bindings

```bash
# Add your own bindings after existing ones:

# Quick window switching
bind -n M-1 select-window -t 1
bind -n M-2 select-window -t 2
bind -n M-3 select-window -t 3

# Easy config reload
bind r source-file ~/.tmux.conf \; display "Config reloaded!"

# Better pane splitting
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# Resize panes with arrow keys
bind -r Left resize-pane -L 5
bind -r Right resize-pane -R 5
bind -r Up resize-pane -U 5
bind -r Down resize-pane -D 5
```

#### Change Theme

```bash
# Current: Catppuccin
set -g @plugin 'catppuccin-tmux'

# Alternatives:
# set -g @plugin 'arcticicestudio/nord-tmux'
# set -g @plugin 'jimeh/tmux-themepack'
# set -g @plugin 'dracula/tmux'

# Or create your own status bar:
set -g status-style 'bg=#1e1e2e fg=#cdd6f4'
set -g status-left '#[fg=#89b4fa]Session: #S '
set -g status-right '#[fg=#f9e2af]%H:%M %d-%b-%y'
```

#### Add/Remove Plugins

```bash
# Remove plugins you don't need (comment out or delete):
# set -g @plugin 'tmux-plugins/tmux-sidebar'

# Add new plugins:
set -g @plugin 'tmux-plugins/tmux-cpu'
set -g @plugin 'tmux-plugins/tmux-net-speed'
set -g @plugin 'tmux-plugins/tmux-weather'

# After changes, run: Prefix + I to install
```

### Starship Prompt (starship.toml)

#### Change Symbols

```toml
[character]
success_symbol = "➜"      # or "❯" "→" "▶" "⚡" "🚀"
error_symbol = "✗"        # or "❌" "💥" "🔥" "⚠"
```

#### Modify Color Scheme

```toml
# Current: Catppuccin Mocha
palette = 'catppuccin_mocha'

# Create your own:
[palettes.custom]
primary = "#00ff00"
secondary = "#0000ff"
text = "#ffffff"
error = "#ff0000"

# Then use it:
palette = 'custom'
```

#### Customize Directory Display

```toml
[directory]
truncation_length = 3           # How many directories to show
truncation_symbol = "…/"
style = 'bold cyan'
format = '[$path]($style) '

# Show git repo root only
truncate_to_repo = true

# Or show full path
truncate_to_repo = false
```

#### Add/Remove Modules

```toml
# Current format
format = """
$directory\
$git_branch\
$git_status\
$fill\
$python\
$nodejs\
$rust\
$line_break\
$character\
"""

# Add more modules:
# $docker_context
# $kubernetes
# $terraform
# $aws
# $gcloud
# $azure
# $battery
# $time
# $username
# $hostname
```

### Git Configuration (.gitconfig)

#### Personal Information

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

#### Custom Aliases

```bash
# Add to .gitconfig under [alias] section:
[alias]
    # Quick commands
    st = status
    co = checkout
    br = branch
    ci = commit
    
    # Pretty log
    lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
    
    # Show all aliases
    alias = config --get-regexp alias
    
    # Undo last commit
    undo = reset --soft HEAD^
    
    # Stash with message
    stashm = stash push -m
    
    # Delete merged branches
    cleanup = "!git branch --merged | grep -v '\\*\\|master\\|main\\|develop' | xargs -n 1 git branch -d"
```

#### Multiple Git Identities

```bash
# Use different configs for different directories
[includeIf "gitdir:~/work/"]
    path = ~/.gitconfig-work

[includeIf "gitdir:~/personal/"]
    path = ~/.gitconfig-personal
```

Then create `~/.gitconfig-work`:
```bash
[user]
    name = Work Name
    email = work@company.com
```

### Neovim Configuration (nvim/)

#### Change Leader Key

```lua
-- In lua/config/options.lua or init.lua
vim.g.mapleader = " "          -- Current: Space
-- vim.g.mapleader = ","       -- Alternative: Comma
-- vim.g.mapleader = "\\"      -- Alternative: Backslash
```

#### Modify Keymaps

```lua
-- In lua/config/keymaps.lua

-- Add your custom keymaps:
local keymap = vim.keymap.set

-- Quick save
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- Quick quit
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Split navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })

-- Buffer navigation
keymap("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Move lines
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
```

#### Add/Remove Plugins

```lua
-- In lua/plugins/ directory, create new files or modify existing ones

-- Add a new plugin:
return {
  "github/copilot.vim",
  event = "VeryLazy",
  config = function()
    -- Plugin configuration
  end,
}

-- Or use lazy.nvim spec directly:
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- Your options
  },
}
```

#### Change Color Scheme

```lua
-- In lua/plugins/colorscheme.lua
return {
  "catppuccin/nvim",              -- Current
  -- "folke/tokyonight.nvim",     -- Alternative
  -- "EdenEast/nightfox.nvim",    -- Alternative
  -- "rebelot/kanagawa.nvim",     -- Alternative
  
  config = function()
    vim.cmd("colorscheme catppuccin-mocha")
  end,
}
```

### VS Code Settings (.vscode/settings.json)

#### Change Theme and Fonts

```json
{
  "workbench.colorTheme": "Your Theme Here",
  "editor.fontFamily": "JetBrains Mono, Fira Code, Consolas",
  "editor.fontSize": 14,
  "editor.fontLigatures": true
}
```

#### Customize Key Bindings

Edit `.vscode/keybindings.json`:
```json
[
  {
    "key": "ctrl+shift+t",
    "command": "workbench.action.terminal.toggleTerminal"
  },
  {
    "key": "ctrl+p",
    "command": "workbench.action.quickOpen"
  }
]
```

## 🏗️ Creating Your Own Setup

### Step 1: Start a Dotfiles Repository

```bash
# Create a new repository
mkdir ~/dotfiles
cd ~/dotfiles
git init

# Add a README
cat > README.md << EOF
# My Dotfiles

Personal development environment configuration

## Installation

\`\`\`bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
\`\`\`
EOF

git add README.md
git commit -m "Initial commit"
```

### Step 2: Add Your Configurations

```bash
# Copy your current configs
cp ~/.zshrc ~/dotfiles/
cp ~/.tmux.conf ~/dotfiles/
cp ~/.gitconfig ~/dotfiles/

# Neovim
cp -r ~/.config/nvim ~/dotfiles/

# VS Code
mkdir -p ~/dotfiles/vscode
cp ~/Library/Application\ Support/Code/User/settings.json ~/dotfiles/vscode/
cp ~/Library/Application\ Support/Code/User/keybindings.json ~/dotfiles/vscode/
```

### Step 3: Create Installation Script

See `install.sh` in this repo as a template. Customize it for your needs:

```bash
#!/bin/bash

# Your custom installation steps
echo "Installing dotfiles..."

# Create symlinks
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

echo "Done! Reload your shell."
```

### Step 4: Document Your Setup

Create sections for:
- What's included
- Prerequisites
- Installation instructions
- Customization guide
- Common issues and solutions

### Step 5: Keep It Updated

```bash
# Add an update script
cat > update.sh << 'EOF'
#!/bin/bash
echo "Pulling latest changes..."
git pull origin main

echo "Reloading configurations..."
source ~/.zshrc
tmux source-file ~/.tmux.conf

echo "Updated!"
EOF

chmod +x update.sh
```

## 📚 Best Practices

### 1. Modular Configuration

Split configs into multiple files:

```bash
# Zsh example
~/.zshrc                    # Main config
~/.zsh/
  ├── aliases.zsh          # All aliases
  ├── functions.zsh        # Custom functions
  ├── exports.zsh          # Environment variables
  └── plugins.zsh          # Plugin configuration
```

Then in `.zshrc`:
```bash
for file in ~/.zsh/*.zsh; do
  source "$file"
done
```

### 2. Use Comments Liberally

```bash
# Bad
alias gs="git status"

# Good
# Quick git status check - saves typing
# Usage: gs
alias gs="git status"
```

### 3. Make It Portable

```bash
# Check OS before applying OS-specific configs
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS specific
  export EDITOR="nvim"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux specific
  export EDITOR="vim"
fi
```

### 4. Version Your Plugins

```bash
# In Neovim, pin plugin versions
{
  "folke/lazy.nvim",
  tag = "v1.0.0",  -- Pin to specific version
}
```

### 5. Keep Secrets Separate

```bash
# Never commit secrets to your dotfiles

# .zshrc
if [ -f ~/.secrets ]; then
  source ~/.secrets
fi

# .gitignore
.secrets
*.key
*.pem
```

## 🎨 Common Customizations

### Terminal Transparency

**Alacritty:**
```yaml
window:
  opacity: 0.9
```

**WezTerm:**
```lua
config.window_background_opacity = 0.9
```

### Custom Status Bar (Tmux)

```bash
# Minimal status bar
set -g status-left ''
set -g status-right '%H:%M '
set -g status-style 'bg=default fg=white'
set -g window-status-current-style 'bg=blue fg=black'
```

### Custom Git Prompt (Starship)

```toml
[git_branch]
symbol = "🌱 "
style = "bold purple"

[git_status]
ahead = "⇡${count}"
behind = "⇣${count}"
diverged = "⇕⇡${ahead_count}⇣${behind_count}"
modified = "📝${count}"
```

### Custom Shell Functions

```bash
# Quick project creator
mkproject() {
  mkdir -p ~/projects/$1
  cd ~/projects/$1
  git init
  touch README.md
  code .
}

# Smart cd with ls
cd() {
  builtin cd "$@" && ls
}

# Extract any archive
extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2) tar xjf $1 ;;
      *.tar.gz) tar xzf $1 ;;
      *.zip) unzip $1 ;;
      *.rar) unrar x $1 ;;
      *) echo "Unknown format" ;;
    esac
  fi
}
```

## 🚀 Advanced Tips

### 1. Conditional Loading

```bash
# Only load heavy plugins when needed
if [[ $TERM_PROGRAM == "tmux" ]]; then
  # Tmux-specific plugins
fi
```

### 2. Performance Profiling

```bash
# Profile Zsh startup
zsh -i -c "time source ~/.zshrc"

# Or use zinit turbo mode for faster loading
```

### 3. Lazy Loading

```lua
-- Neovim: Lazy load on command
{
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>" },
  },
}
```

### 4. Dynamic Configuration

```bash
# Load different configs based on location
if [ -d "$HOME/work" ]; then
  source ~/.zsh/work.zsh
else
  source ~/.zsh/personal.zsh
fi
```

### 5. Automation Scripts

```bash
# Auto-update script
cat > ~/dotfiles/auto-update.sh << 'EOF'
#!/bin/bash
cd ~/dotfiles
git pull
./install.sh
echo "Dotfiles updated!"
EOF
```

## 🎯 Quick Wins

### 1. Better History

```bash
# .zshrc
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
```

### 2. Directory Bookmarks

```bash
# .zshrc
export WORK="$HOME/work"
export DOCS="$HOME/Documents"
export DOTS="$HOME/dotfiles"

# Quick jump
alias work="cd $WORK"
alias docs="cd $DOCS"
alias dots="cd $DOTS"
```

### 3. Color Everything

```bash
# .zshrc
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias diff="diff --color=auto"

# Or use modern alternatives
alias ls="eza --icons"
alias cat="bat"
```

## 📖 Resources

- [Dotfiles Community](https://dotfiles.github.io/)
- [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles)
- [r/unixporn](https://reddit.com/r/unixporn) - For inspiration
- Tool Documentation:
  - [Zsh](https://zsh.sourceforge.io/Doc/)
  - [Tmux](https://github.com/tmux/tmux/wiki)
  - [Neovim](https://neovim.io/doc/)
  - [Starship](https://starship.rs/config/)

## 💡 Remember

- **Start Small**: Don't try to customize everything at once
- **Test Often**: Make small changes and test them
- **Document Everything**: Future you will thank present you
- **Share Your Setup**: Help others learn from your configuration
- **Keep Learning**: The tools evolve, so should your configs

---

**Happy Customizing! 🎨**

_"The best dotfiles are the ones you understand and maintain yourself."_
