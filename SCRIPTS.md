# 📜 Available Scripts

This document describes all the scripts available in this repository and how to use them.

## 🚀 Installation & Setup Scripts

### `install.sh`

**Purpose**: Automated installation of all dotfiles and configurations

**Usage**:

```bash
chmod +x install.sh
./install.sh
```

**What it does**:

- Creates backups of existing configurations
- Creates symlinks for all config files
- Detects your operating system
- Sets up configurations for:
  - Zsh (.zshrc)
  - Tmux (.tmux.conf)
  - Git (.gitconfig)
  - Starship (starship.toml)
  - Neovim (nvim/)
  - VS Code (.vscode/)
  - Terminal emulators (Alacritty, WezTerm, Ghostty)
  - Zed editor (.zed/)

**Features**:

- ✅ Automatic backups with timestamps
- ✅ Colorful output with status indicators
- ✅ Prerequisite checking
- ✅ OS-specific installation paths
- ✅ Shows next steps after installation

**Backup Location**: `~/dotfiles-backup-YYYYMMDD-HHMMSS/`

---

### `check-prerequisites.sh`

**Purpose**: Verify all required and optional tools are installed

**Usage**:

```bash
chmod +x check-prerequisites.sh
./check-prerequisites.sh
```

**What it checks**:

**Essential Tools**:

- Git
- Zsh
- Oh My Zsh
- Tmux
- TPM (Tmux Plugin Manager)
- Starship prompt

**Optional Tools**:

- Neovim
- FZF (fuzzy finder)
- fd (better find)
- bat (better cat)
- eza (better ls)
- zoxide (smart cd)
- ripgrep (better grep)
- Node.js
- Python

**Zsh Plugins**:

- zsh-autosuggestions
- zsh-syntax-highlighting
- fast-syntax-highlighting
- zsh-autocomplete
- auto-notify
- you-should-use

**Terminal Emulators**:

- Alacritty
- WezTerm
- Ghostty

**Editors**:

- VS Code
- Zed
- IntelliJ IDEA

**Output**:

- Shows what's installed ✓
- Shows what's missing ✗
- Provides installation commands for missing tools

**When to use**:

- Before running `install.sh`
- To diagnose missing dependencies
- To see what optional tools you might want

---

### `verify-setup.sh`

**Purpose**: Verify that the installation was successful and everything is working

**Usage**:

```bash
chmod +x verify-setup.sh
./verify-setup.sh
```

**What it verifies**:

1. **Core Configurations**:
   - Checks if files are properly symlinked
   - Verifies Zsh is the default shell
   - Confirms TPM is installed
   - Validates Git user configuration

2. **Terminal Emulators**:
   - Checks Alacritty configuration
   - Checks WezTerm configuration
   - Checks Ghostty configuration

3. **Neovim**:
   - Verifies init.lua is symlinked
   - Checks lua directory
   - Confirms Lazy.nvim is ready

4. **VS Code**:
   - Checks settings.json
   - Checks keybindings.json
   - Verifies correct path for OS

5. **Zsh Plugins**:
   - Confirms all plugins are installed
   - Shows which plugins are missing

6. **CLI Tools**:
   - Tests essential tools
   - Lists optional tools status

7. **Functionality Tests**:
   - Tests if running in Zsh
   - Tests Starship initialization
   - Tests FZF configuration
   - Tests zoxide initialization
   - Tests Tmux sessions

8. **Common Issues**:
   - Finds broken symlinks
   - Checks default shell
   - Verifies file permissions

**Output**:

- Passed: X
- Warnings: X
- Failed: X
- Summary with next steps

**When to use**:

- After running `install.sh`
- When troubleshooting issues
- To ensure everything is working correctly

---

### `update-dates.sh`

**Purpose**: Automatically update dates in documentation based on git commit history

- "Last Updated" uses the **latest commit date**
- "Created" uses the **first commit date**

**Usage**:

```bash
chmod +x update-dates.sh
./update-dates.sh
```

**What it does**:

- Gets the **first commit date** (for "Created" dates)
- Gets the **latest commit date** (for "Last Updated" dates)
- Scans all documentation files
- Updates "Last Updated" dates to latest commit
- Updates "Created" dates to first commit
- Shows what was updated and with which dates

**Output**:

- ✓ Lists each file updated
- Shows the new date applied
- Displays total number of updates

**When to use**:

- After making commits
- Before pushing to repository
- To keep documentation dates current
- After batch updates to configs

**Example Output**:

```
🔄 Updating dates in documentation...

First commit:  6b14efc - April 18, 2024
Latest commit: bd0ef99 - December 03, 2025

✓ Updated Last Updated in: README.md
✓ Updated Last Updated in: STRUCTURE.md
✓ Updated Created in: PROJECT-SUMMARY.md

✅ Successfully updated dates in 4 location(s)

📅 Created dates:      April 18, 2024 (first commit)
📅 Last Updated dates: December 03, 2025 (latest commit)

💡 Tip: This script runs automatically to keep documentation dates current
💡 Tip: Commit these changes with: git add *.md && git commit -m 'Update documentation dates'
```

---

## 📊 Quick Reference

### Installation Workflow

```bash
# 1. Check what you need
./check-prerequisites.sh

# 2. Install missing prerequisites
# (Follow the installation commands shown)

# 3. Install the dotfiles
./install.sh

# 4. Verify everything works
./verify-setup.sh

# 5. Reload your shell
source ~/.zshrc
```

### Script Comparison

| Script                   | Purpose                    | When to Use         | Output                          |
| ------------------------ | -------------------------- | ------------------- | ------------------------------- |
| `check-prerequisites.sh` | Check dependencies         | Before installation | List of installed/missing tools |
| `install.sh`             | Install dotfiles           | First time setup    | Creates symlinks, shows success |
| `verify-setup.sh`        | Verify installation        | After installation  | Pass/Warn/Fail counts           |
| `update-dates.sh`        | Update documentation dates | After commits       | List of files updated           |

## 🎯 Common Scenarios

### Scenario 1: Fresh Installation

```bash
# Step 1: Clone the repo
git clone https://github.com/yourusername/dev-environment-setup.git
cd dev-environment-setup

# Step 2: Check prerequisites
./check-prerequisites.sh

# Step 3: Install missing tools (based on output)
# Example for macOS:
brew install zsh tmux starship fzf fd bat eza zoxide ripgrep

# Step 4: Install dotfiles
./install.sh

# Step 5: Verify
./verify-setup.sh

# Step 6: Reload
source ~/.zshrc
```

### Scenario 2: Troubleshooting

```bash
# Something not working? Run verify script
./verify-setup.sh

# Check for missing prerequisites
./check-prerequisites.sh

# Reinstall if needed
./install.sh

# Update dates
./update-dates.sh
```

### Scenario 3: Update Configuration

```bash
# Pull latest changes
git pull origin main

# Reinstall (will update symlinks)
./install.sh

# Verify everything still works
./verify-setup.sh

# Update documentation dates
./update-dates.sh
```

## 🔧 Script Customization

### Adding Your Own Checks to verify-setup.sh

```bash
# Add to the verify_custom() function
verify_custom() {
    print_header "🎨 Checking Custom Setup"

    # Check your custom config
    if [ -f "$HOME/.my-custom-config" ]; then
        print_pass "Custom config found"
    else
        print_fail "Custom config missing"
    fi
}

# Then call it in main()
main() {
    # ... existing checks ...
    verify_custom
    generate_summary
}
```

### Extending install.sh

```bash
# Add custom installation steps
install_custom() {
    print_header "🎨 Installing Custom Configs"

    # Your custom symlinks
    create_symlink "$SCRIPT_DIR/my-config" "$HOME/.my-config"
}

# Call it in main()
main() {
    # ... existing installation ...
    install_custom
    print_header "✨ Installation Complete!"
}
```

## 📝 Script Options

### Silent Mode (Future Enhancement)

```bash
# Suppress all output except errors
./install.sh --silent

# Only show warnings and errors
./verify-setup.sh --quiet
```

### Dry Run (Future Enhancement)

```bash
# Show what would be done without doing it
./install.sh --dry-run
```

### Selective Installation (Future Enhancement)

```bash
# Install only specific components
./install.sh --only zsh,tmux,git
./install.sh --skip vscode,neovim
```

## 🆘 Troubleshooting Scripts

### Scripts Won't Execute

```bash
# Make scripts executable
chmod +x *.sh

# Or specific script
chmod +x install.sh
```

### Permission Denied

```bash
# Check file ownership
ls -la *.sh

# Fix ownership if needed
chown $USER:$USER *.sh
```

### Unexpected Behavior

```bash
# Run with bash explicitly
bash install.sh

# Run with debug output
bash -x verify-setup.sh
```

## 📚 Additional Documentation

- [README.md](README.md) - Main documentation
- [QUICKSTART.md](QUICKSTART.md) - Quick setup guide
- [CUSTOMIZATION.md](CUSTOMIZATION.md) - Customization guide
- [ssh/.config.md](ssh/.config.md) - SSH setup guide

## 💡 Tips

1. **Always backup**: The scripts create backups, but manually backup important configs too
2. **Read the output**: Scripts provide helpful information - read it!
3. **Run verify after changes**: After modifying configs, run `verify-setup.sh`
4. **Use check-prerequisites first**: Save time by checking prerequisites before installation
5. **Keep scripts updated**: Pull latest changes to get script improvements

## 🤝 Contributing

Found a bug in a script? Want to add a feature?

1. Open an issue describing the problem/feature
2. Fork the repository
3. Make your changes
4. Test thoroughly
5. Submit a pull request

---

**Script Maintenance**: Scripts are tested on macOS and Linux (Ubuntu/Debian)

**Last Updated**: December 03, 2025

**Questions?** Open an issue on GitHub or check the main README.md
