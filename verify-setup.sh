#!/bin/bash

# Setup Verification Script
# Verifies that all configurations are properly installed and working

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Counters
PASS=0
FAIL=0
WARN=0

# Print functions
print_header() {
    echo -e "\n${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${PURPLE}  $1${NC}"
    echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
}

print_pass() {
    echo -e "${GREEN}✓${NC} $1"
    ((PASS++))
}

print_fail() {
    echo -e "${RED}✗${NC} $1"
    ((FAIL++))
}

print_warn() {
    echo -e "${YELLOW}⚠${NC} $1"
    ((WARN++))
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Check if file exists and is symlinked
check_symlink() {
    local target=$1
    local source=$2
    local name=$3

    if [ -L "$target" ]; then
        if [ -e "$target" ]; then
            local link_target=$(readlink "$target")
            if [[ "$link_target" == *"$source"* ]]; then
                print_pass "$name is properly symlinked"
                return 0
            else
                print_fail "$name is symlinked but points to wrong location"
                echo "  Expected: $source"
                echo "  Actual:   $link_target"
                return 1
            fi
        else
            print_fail "$name symlink is broken"
            return 1
        fi
    elif [ -f "$target" ] || [ -d "$target" ]; then
        print_warn "$name exists but is not symlinked"
        return 2
    else
        print_fail "$name does not exist"
        return 1
    fi
}

# Check if command works
check_command() {
    local cmd=$1
    local name=$2

    if command -v "$cmd" >/dev/null 2>&1; then
        print_pass "$name is available"
        return 0
    else
        print_fail "$name is not available"
        return 1
    fi
}

# Verify core configurations
verify_core() {
    print_header "🔍 Verifying Core Configurations"

    # Zsh
    check_symlink "$HOME/.zshrc" ".zshrc" "Zsh configuration"

    # Check if Zsh is actually being used
    if [ "$SHELL" = "$(which zsh)" ]; then
        print_pass "Zsh is the default shell"
    else
        print_warn "Zsh is not the default shell (current: $SHELL)"
    fi

    # Tmux
    check_symlink "$HOME/.tmux.conf" ".tmux.conf" "Tmux configuration"

    # Check TPM
    if [ -d "$HOME/.tmux/plugins/tpm" ]; then
        print_pass "Tmux Plugin Manager is installed"
    else
        print_fail "Tmux Plugin Manager is not installed"
    fi

    # Git
    check_symlink "$HOME/.gitconfig" ".gitconfig" "Git configuration"

    # Check git user config
    git_name=$(git config --global user.name 2>/dev/null)
    git_email=$(git config --global user.email 2>/dev/null)

    if [ -n "$git_name" ] && [ -n "$git_email" ]; then
        print_pass "Git user configured ($git_name <$git_email>)"
    else
        print_warn "Git user not fully configured"
        echo "  Run: git config --global user.name 'Your Name'"
        echo "  Run: git config --global user.email 'your@email.com'"
    fi

    # Starship
    check_symlink "$HOME/.config/starship.toml" "starship.toml" "Starship configuration"
}

# Verify terminal emulators
verify_terminals() {
    print_header "🖥️  Verifying Terminal Emulators"

    # Alacritty
    if [ -f "$HOME/.config/alacritty/alacritty.yml" ]; then
        check_symlink "$HOME/.config/alacritty/alacritty.yml" "alacritty.yml" "Alacritty configuration"
    else
        print_info "Alacritty configuration not installed (optional)"
    fi

    # WezTerm
    if [ -f "$HOME/.wezterm.lua" ]; then
        check_symlink "$HOME/.wezterm.lua" "wezterm.lua" "WezTerm configuration"
    else
        print_info "WezTerm configuration not installed (optional)"
    fi

    # Ghostty
    if [ -d "$HOME/.config/ghostty" ]; then
        print_pass "Ghostty configuration directory exists"
    else
        print_info "Ghostty configuration not installed (optional)"
    fi
}

# Verify Neovim
verify_neovim() {
    print_header "📝 Verifying Neovim Configuration"

    if command -v nvim >/dev/null 2>&1; then
        print_pass "Neovim is installed"

        # Check init.lua
        if [ -f "$HOME/.config/nvim/init.lua" ]; then
            check_symlink "$HOME/.config/nvim/init.lua" "init.lua" "Neovim init.lua"
        else
            print_fail "Neovim init.lua not found"
        fi

        # Check lua directory
        if [ -d "$HOME/.config/nvim/lua" ]; then
            if [ -L "$HOME/.config/nvim/lua" ]; then
                print_pass "Neovim lua directory is symlinked"
            else
                print_warn "Neovim lua directory exists but is not symlinked"
            fi
        else
            print_fail "Neovim lua directory not found"
        fi

        # Check if Lazy.nvim is installed
        if [ -d "$HOME/.local/share/nvim/lazy" ]; then
            print_pass "Lazy.nvim plugin manager directory exists"
        else
            print_info "Lazy.nvim not installed yet (will install on first nvim launch)"
        fi
    else
        print_info "Neovim is not installed (optional)"
    fi
}

# Verify VS Code
verify_vscode() {
    print_header "💻 Verifying VS Code Configuration"

    if command -v code >/dev/null 2>&1; then
        print_pass "VS Code is installed"

        # Detect OS for correct path
        if [[ "$OSTYPE" == "darwin"* ]]; then
            VSCODE_DIR="$HOME/Library/Application Support/Code/User"
        else
            VSCODE_DIR="$HOME/.config/Code/User"
        fi

        # Check settings
        if [ -f "$VSCODE_DIR/settings.json" ]; then
            check_symlink "$VSCODE_DIR/settings.json" "settings.json" "VS Code settings"
        else
            print_fail "VS Code settings.json not found"
        fi

        # Check keybindings
        if [ -f "$VSCODE_DIR/keybindings.json" ]; then
            check_symlink "$VSCODE_DIR/keybindings.json" "keybindings.json" "VS Code keybindings"
        else
            print_warn "VS Code keybindings.json not found (optional)"
        fi
    else
        print_info "VS Code is not installed (optional)"
    fi
}

# Verify Zsh plugins
verify_zsh_plugins() {
    print_header "🔌 Verifying Zsh Plugins"

    ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    local plugins=(
        "zsh-autosuggestions:zsh-autosuggestions"
        "zsh-syntax-highlighting:zsh-syntax-highlighting"
        "fast-syntax-highlighting:fast-syntax-highlighting"
        "zsh-autocomplete:zsh-autocomplete"
        "auto-notify:auto-notify"
        "you-should-use:you-should-use"
    )

    for plugin_info in "${plugins[@]}"; do
        plugin_dir="${plugin_info%%:*}"
        plugin_name="${plugin_info#*:}"

        if [ -d "$ZSH_CUSTOM/plugins/$plugin_dir" ]; then
            print_pass "$plugin_name installed"
        else
            print_warn "$plugin_name not installed"
        fi
    done
}

# Verify CLI tools
verify_tools() {
    print_header "🛠️  Verifying CLI Tools"

    # Essential
    check_command "git" "Git"
    check_command "zsh" "Zsh"
    check_command "tmux" "Tmux"
    check_command "starship" "Starship"

    # Optional but recommended
    echo ""
    print_info "Optional tools:"

    local optional_tools=(
        "fzf:FZF fuzzy finder"
        "fd:fd (better find)"
        "bat:bat (better cat)"
        "eza:eza (better ls)"
        "zoxide:zoxide (smart cd)"
        "rg:ripgrep (better grep)"
        "nvim:Neovim"
        "node:Node.js"
    )

    for tool_info in "${optional_tools[@]}"; do
        tool="${tool_info%%:*}"
        name="${tool_info#*:}"

        if command -v "$tool" >/dev/null 2>&1; then
            print_pass "$name"
        else
            print_info "  $name not installed"
        fi
    done
}

# Test functionality
test_functionality() {
    print_header "🧪 Testing Functionality"

    # Test Zsh
    if [ -n "$ZSH_VERSION" ]; then
        print_pass "Running in Zsh"
    else
        print_warn "Not running in Zsh (current shell: $SHELL)"
    fi

    # Test Starship
    if command -v starship >/dev/null 2>&1; then
        if type starship &>/dev/null; then
            print_pass "Starship is initialized"
        else
            print_warn "Starship is installed but not initialized"
        fi
    fi

    # Test FZF
    if command -v fzf >/dev/null 2>&1; then
        if [ -n "$FZF_DEFAULT_COMMAND" ]; then
            print_pass "FZF environment variables configured"
        else
            print_warn "FZF is installed but not configured"
        fi
    fi

    # Test zoxide
    if command -v zoxide >/dev/null 2>&1; then
        if type z &>/dev/null; then
            print_pass "Zoxide is initialized (z command available)"
        else
            print_warn "Zoxide is installed but not initialized"
        fi
    fi

    # Test Tmux
    if command -v tmux >/dev/null 2>&1; then
        if tmux list-sessions &>/dev/null; then
            print_pass "Tmux is running with sessions"
        else
            print_info "Tmux is installed but no sessions are running"
        fi
    fi
}

# Check for common issues
check_issues() {
    print_header "🔍 Checking for Common Issues"

    # Check for broken symlinks
    broken_found=false
    for link in ~/.zshrc ~/.tmux.conf ~/.gitconfig ~/.config/starship.toml; do
        if [ -L "$link" ] && [ ! -e "$link" ]; then
            if [ "$broken_found" = false ]; then
                print_warn "Found broken symlinks:"
                broken_found=true
            fi
            echo "  - $link"
        fi
    done

    if [ "$broken_found" = false ]; then
        print_pass "No broken symlinks found"
    fi

    # Check shell
    if [ "$SHELL" != "$(which zsh)" ]; then
        print_warn "Default shell is not Zsh"
        echo "  Run: chsh -s \$(which zsh)"
    else
        print_pass "Default shell is Zsh"
    fi

    # Check permissions
    if [ -w "$HOME/.zshrc" ]; then
        print_pass "Configuration files are writable"
    else
        print_warn "Some configuration files may not be writable"
    fi
}

# Generate summary
generate_summary() {
    print_header "📊 Summary"

    echo -e "${GREEN}Passed:${NC}  $PASS"
    echo -e "${YELLOW}Warnings:${NC} $WARN"
    echo -e "${RED}Failed:${NC}  $FAIL"
    echo ""

    if [ $FAIL -eq 0 ] && [ $WARN -eq 0 ]; then
        echo -e "${GREEN}🎉 Perfect! Your setup is complete and working!${NC}"
    elif [ $FAIL -eq 0 ]; then
        echo -e "${YELLOW}✅ Setup is working but there are some warnings to address${NC}"
    else
        echo -e "${RED}❌ Some critical issues need to be fixed${NC}"
    fi

    echo ""
    print_info "Next steps:"

    if [ $FAIL -gt 0 ]; then
        echo "  1. Fix the failed checks above"
        echo "  2. Run ./install.sh if configurations are missing"
    fi

    if [ $WARN -gt 0 ]; then
        echo "  - Address warnings for optimal experience"
    fi

    if command -v tmux >/dev/null 2>&1 && [ -d "$HOME/.tmux/plugins/tpm" ]; then
        echo "  - Start tmux and press Ctrl+s then I to install tmux plugins"
    fi

    if command -v nvim >/dev/null 2>&1; then
        echo "  - Open nvim to auto-install plugins"
    fi

    echo "  - Reload your shell: source ~/.zshrc"
    echo "  - Read QUICKSTART.md for usage tips"
}

# Main execution
main() {
    clear
    echo -e "${CYAN}"
    echo "╔═══════════════════════════════════════════╗"
    echo "║     Dev Environment Setup Verifier        ║"
    echo "╚═══════════════════════════════════════════╝"
    echo -e "${NC}"

    verify_core
    verify_terminals
    verify_neovim
    verify_vscode
    verify_zsh_plugins
    verify_tools
    test_functionality
    check_issues
    generate_summary

    echo ""
}

# Run the script
main
