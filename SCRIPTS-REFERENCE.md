# 🎯 Scripts Quick Reference Card

Quick reference for all available automation scripts.

## 📋 All Scripts

```bash
# Make all scripts executable
chmod +x *.sh

# Or individually
chmod +x install.sh check-prerequisites.sh verify-setup.sh update-dates.sh
```

## 🚀 Main Scripts

### 1. Prerequisites Checker
```bash
./check-prerequisites.sh
```
**Use before installation** - Checks if you have all required tools

### 2. Installer
```bash
./install.sh
```
**Main installation** - Creates symlinks and sets up everything

### 3. Setup Verifier
```bash
./verify-setup.sh
```
**Use after installation** - Confirms everything is working correctly

### 4. Date Updater
```bash
./update-dates.sh
```
**Use after commits** - Updates documentation dates automatically

---

## 📊 Quick Comparison

| Script | When | What | Output |
|--------|------|------|--------|
| `check-prerequisites.sh` | **Before** install | Checks dependencies | List of installed/missing |
| `install.sh` | **During** setup | Creates symlinks | Installation progress |
| `verify-setup.sh` | **After** install | Verifies everything | Pass/Warn/Fail report |
| `update-dates.sh` | **After** commits | Updates dates | Files updated count |

---

## 🎯 Common Workflows

### First Time Setup
```bash
# 1. Check what you need
./check-prerequisites.sh

# 2. Install the dotfiles
./install.sh

# 3. Verify it worked
./verify-setup.sh

# 4. Reload shell
source ~/.zshrc
```

### After Making Changes
```bash
# 1. Test changes
./verify-setup.sh

# 2. Commit changes
git add .
git commit -m "Updated configs"

# 3. Update documentation dates
./update-dates.sh

# 4. Commit the date changes
git add .
git commit -m "Updated documentation dates"
```

### Troubleshooting
```bash
# Check for issues
./verify-setup.sh

# Check missing tools
./check-prerequisites.sh

# Reinstall if needed
./install.sh
```

### Updating Repository
```bash
# Pull latest changes
git pull origin main

# Reinstall configs
./install.sh

# Verify everything works
./verify-setup.sh

# Update dates to match latest commit
./update-dates.sh
```

---

## 🔍 Script Details

### check-prerequisites.sh
- ✅ Checks Git, Zsh, Tmux, etc.
- ✅ Checks optional tools (FZF, bat, eza, etc.)
- ✅ Checks Zsh plugins
- ✅ Provides installation commands
- ⏱️ Takes: ~3 seconds

### install.sh
- ✅ Creates automatic backups
- ✅ Creates all symlinks
- ✅ Detects your OS
- ✅ Shows next steps
- ⏱️ Takes: ~5 seconds

### verify-setup.sh
- ✅ Checks symlinks
- ✅ Tests functionality
- ✅ Finds broken links
- ✅ Reports pass/warn/fail
- ⏱️ Takes: ~5 seconds

### update-dates.sh
- ✅ Gets latest commit date
- ✅ Updates all documentation
- ✅ Updates "Last Updated" dates
- ✅ Updates "Created" dates
- ⏱️ Takes: ~1 second

---

## 💡 Pro Tips

1. **Chain Commands**
   ```bash
   ./install.sh && ./verify-setup.sh
   ```

2. **Save Output**
   ```bash
   ./verify-setup.sh > setup-report.txt
   ```

3. **Quiet Mode** (suppress extra output)
   ```bash
   ./check-prerequisites.sh 2>/dev/null
   ```

4. **Run All Checks**
   ```bash
   echo "=== Prerequisites ===" && ./check-prerequisites.sh
   echo "=== Verification ===" && ./verify-setup.sh
   ```

5. **Automated Date Updates** (add to git hooks)
   ```bash
   # In .git/hooks/pre-commit
   ./update-dates.sh
   git add *.md
   ```

---

## 🆘 Common Issues

### Scripts Won't Run
```bash
# Make executable
chmod +x *.sh

# Or run with bash
bash install.sh
```

### Permission Denied
```bash
# Check ownership
ls -la *.sh

# Fix if needed
chown $USER *.sh
```

### Script Errors
```bash
# Run with debug mode
bash -x install.sh

# Check for syntax errors
bash -n install.sh
```

---

## 📚 More Information

- **Full Documentation**: [SCRIPTS.md](SCRIPTS.md)
- **Installation Guide**: [README.md](README.md)
- **Quick Setup**: [QUICKSTART.md](QUICKSTART.md)

---

**Keep this card handy for quick reference!** 📌

_Last Updated: 
