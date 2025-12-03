# 🚀 Getting Started

Welcome! This is your **5-minute quickstart** to get this dev environment up and running.

## ⚡ Super Quick Setup (5 minutes)

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/yourusername/dev-environment-setup.git
cd dev-environment-setup
```

### 2️⃣ Run the Installer
```bash
chmod +x install.sh
./install.sh
```

### 3️⃣ Reload Your Shell
```bash
source ~/.zshrc
```

**That's it! You're done!** 🎉

---

## 📚 What to Read Next

Depending on your situation, here's what to read:

### 🆕 Complete Beginner
1. **[README.md](README.md)** - Full documentation (20 min read)
2. **[QUICKSTART.md](QUICKSTART.md)** - Detailed setup guide
3. **[STRUCTURE.md](STRUCTURE.md)** - Understand what's where

### ⚡ Want to Get Started Fast
1. **[QUICKSTART.md](QUICKSTART.md)** - Essential setup (5 min)
2. **[SCRIPTS.md](SCRIPTS.md)** - Understand the tools

### 🎨 Want to Customize
1. **[CUSTOMIZATION.md](CUSTOMIZATION.md)** - Make it your own
2. **[README.md](README.md)** - Configuration details

### 🔧 Troubleshooting
1. Run `./verify-setup.sh` to check your installation
2. Check **[README.md](README.md)** Troubleshooting section
3. Run `./check-prerequisites.sh` to find missing tools

---

## 🎯 Essential Commands

```bash
# Installation & Verification
./check-prerequisites.sh    # Check if you have everything
./install.sh                 # Install the dotfiles
./verify-setup.sh           # Verify installation worked

# Daily Usage
sz                          # Reload Zsh (alias for 'source ~/.zshrc')
cl                          # Clear terminal
gs                          # Git status
ga                          # Git add all

# Tmux
tn myproject               # New tmux session
tk myproject               # Kill tmux session

# Navigation
z project                  # Jump to directory (zoxide)
Ctrl+r                     # Search command history (FZF)
Ctrl+t                     # Fuzzy find files (FZF)
```

---

## ✅ Quick Checklist

- [ ] Cloned the repository
- [ ] Ran `./install.sh`
- [ ] Reloaded shell with `source ~/.zshrc`
- [ ] Configured Git: `git config --global user.name "Your Name"`
- [ ] Configured Git: `git config --global user.email "your@email.com"`
- [ ] Installed Tmux plugins (Start tmux, press `Ctrl+s` then `I`)
- [ ] Opened Neovim to auto-install plugins (if using Neovim)

---

## 🆘 Something Not Working?

1. **Run the verification script**:
   ```bash
   ./verify-setup.sh
   ```

2. **Check prerequisites**:
   ```bash
   ./check-prerequisites.sh
   ```

3. **Check the troubleshooting section** in [README.md](README.md)

---

## 📖 Documentation Map

```
📄 GETTING-STARTED.md  ← You are here (Start here!)
├─ 📄 QUICKSTART.md    → Fast setup guide
├─ 📄 README.md        → Complete documentation
├─ 📄 CUSTOMIZATION.md → How to customize
├─ 📄 SCRIPTS.md       → Script documentation
└─ 📄 STRUCTURE.md     → Repository layout
```

---

## 🎓 Learning Resources

- **Zsh**: [Oh My Zsh Wiki](https://github.com/ohmyzsh/ohmyzsh/wiki)
- **Tmux**: [Tmux Cheat Sheet](https://tmuxcheatsheet.com/)
- **Neovim**: [Neovim Docs](https://neovim.io/doc/)
- **Starship**: [Starship Config](https://starship.rs/config/)

---

## 💡 Pro Tips

1. **Use aliases**: Type `alias` to see all available shortcuts
2. **Master FZF**: Press `Ctrl+r` to search command history
3. **Use zoxide**: After visiting directories, use `z dirname` to jump
4. **Tmux sessions**: Name your sessions for better organization
5. **Read the docs**: Each config file has comments explaining what it does

---

**Ready to dive deeper?** Read [README.md](README.md) for the complete guide!

**Want to customize?** Check out [CUSTOMIZATION.md](CUSTOMIZATION.md)!

**Happy coding!** 🎉
