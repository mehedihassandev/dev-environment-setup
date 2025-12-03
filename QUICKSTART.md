# ⚡ Quick Start Guide

Get up and running in 5 minutes!

## 🚀 Super Fast Setup

```bash
# 1. Clone the repository
git clone https://github.com/yourusername/dev-environment-setup.git
cd dev-environment-setup

# 2. Run the installer
chmod +x install.sh
./install.sh

# 3. Reload your shell
source ~/.zshrc
```

That's it! You're done! 🎉

## 🔧 Essential Setup (5 minutes)

### Step 1: Install Oh My Zsh (if not installed)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Step 2: Install Starship Prompt

```bash
curl -sS https://starship.rs/install.sh | sh
```

### Step 3: Install Zsh Plugins

```bash
# Auto-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Fast syntax highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

### Step 4: Install Tmux Plugin Manager

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Step 5: Configure Git

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

## 📦 Install CLI Tools (Recommended)

### macOS (Homebrew)

```bash
# Install Homebrew first if needed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install all tools at once
brew install fzf fd bat eza zoxide ripgrep tmux neovim
```

### Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install -y fzf fd-find bat tmux neovim zsh

# Install eza (better ls)
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# Install zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
```

## 🎯 First Time Setup

### Tmux

1. Start tmux: `tmux`
2. Install plugins: Press `Ctrl+s` then `I` (capital i)
3. Wait for plugins to install
4. Restart tmux: `tmux kill-server && tmux`

### Neovim

1. Open neovim: `nvim`
2. Plugins will auto-install via Lazy.nvim
3. Wait for installation to complete
4. Restart neovim

### VS Code

1. Settings are automatically applied via symlinks
2. Install recommended extensions:
   - GitHub Copilot
   - Material Icon Theme
   - Flate Arc Theme

## ✅ Verify Installation

```bash
# Check if everything is working
echo "Zsh: $(zsh --version)"
echo "Tmux: $(tmux -V)"
echo "Starship: $(starship --version)"
echo "Neovim: $(nvim --version | head -1)"
echo "FZF: $(fzf --version)"
```

## 🎨 Customization Checklist

- [ ] Update Git user name and email
- [ ] Set up SSH keys for GitHub/GitLab
- [ ] Install a Nerd Font (Cascadia Code recommended)
- [ ] Customize Starship prompt colors
- [ ] Add your personal aliases to `.zshrc`
- [ ] Install your favorite VS Code extensions
- [ ] Set terminal color scheme

## 🔑 Essential Keybindings to Remember

### Tmux
- `Ctrl+s` - Prefix key
- `Prefix + v` - Split vertically
- `Prefix + s` - Split horizontally
- `Prefix + w` - Session manager
- `Prefix + I` - Install plugins

### Zsh/Terminal
- `Ctrl+r` - Search command history (FZF)
- `Ctrl+t` - Fuzzy find files (FZF)
- `Alt+c` - Fuzzy find directories (FZF)

### Quick Aliases
- `gs` - git status
- `ga` - git add .
- `gcm` - git commit -m
- `cl` - clear
- `sz` - source ~/.zshrc

## 🐛 Quick Troubleshooting

### Starship not showing?
```bash
# Add to ~/.zshrc (should already be there)
eval "$(starship init zsh)"
source ~/.zshrc
```

### Tmux plugins not working?
```bash
# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Inside tmux: Ctrl+s then I
```

### Colors look wrong?
```bash
# Install a Nerd Font
brew tap homebrew/cask-fonts
brew install --cask font-cascadia-code-nerd-font
# Then set it in your terminal preferences
```

## 📚 Learn More

- Full documentation: [README.md](README.md)
- SSH setup: [ssh/.config.md](ssh/.config.md)
- Neovim config: [nvim/](nvim/)

## 💡 Pro Tips

1. **Use `z` instead of `cd`**: After installation, `z project` will jump to frequently visited directories
2. **Tmux sessions**: Use `tn project-name` to create named sessions
3. **Git worktrees**: Use `gwa ../branch-name branch-name` for parallel branches
4. **FZF everywhere**: Try `kill $(ps aux | fzf | awk '{print $2}')`
5. **Bat for syntax**: Use `bat file.js` instead of `cat` for syntax highlighting

## 🆘 Need Help?

1. Check the full [README.md](README.md)
2. Open an issue on GitHub
3. Review the configuration files for comments

---

**Ready to code like a pro!** 🚀

_Setup time: ~5 minutes | Worth it: Absolutely!_
