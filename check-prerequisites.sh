#!/bin/bash

# Prerequisites Checker Script
# This script checks if all required and optional tools are installed

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Counters
ESSENTIAL_MISSING=0
OPTIONAL_MISSING=0
PLUGIN_MISSING=0

# Print functions
print_header() {
    echo -e "\n${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${PURPLE}  $1${NC}"
    echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if file/directory exists
path_exists() {
    [ -e "$1" ]
}

# Check essential tools
check_essential() {
    print_header "🔍 Checking Essential Tools"

    # Git
    if command_exists git; then
        VERSION=$(git --version | awk '{print $3}')
        print_success "Git installed (version $VERSION)"
    else
        print_error "Git is NOT installed"
        echo "  Install: brew install git (macOS) or sudo apt install git (Linux)"
        ((ESSENTIAL_MISSING++))
    fi

    # Zsh
    if command_exists zsh; then
        VERSION=$(zsh --version | awk '{print $2}')
        print_success "Zsh installed (version $VERSION)"
    else
        print_error "Zsh is NOT installed"
        echo "  Install: brew install zsh (macOS) or sudo apt install zsh (Linux)"
        ((ESSENTIAL_MISSING++))
    fi

    # Oh My Zsh
    if [ -d "$HOME/.oh-my-zsh" ]; then
        print_success "Oh My Zsh installed"
    else
        print_error "Oh My Zsh is NOT installed"
        echo "  Install: sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
        ((ESSENTIAL_MISSING++))
    fi

    # Tmux
    if command_exists tmux; then
        VERSION=$(tmux -V | awk '{print $2}')
        print_success "Tmux installed (version $VERSION)"
    else
        print_error "Tmux is NOT installed"
        echo "  Install: brew install tmux (macOS) or sudo apt install tmux (Linux)"
        ((ESSENTIAL_MISSING++))
    fi

    # TPM (Tmux Plugin Manager)
    if [ -d "$HOME/.tmux/plugins/tpm" ]; then
        print_success "Tmux Plugin Manager (TPM) installed"
    else
        print_error "TPM is NOT installed"
        echo "  Install: git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
        ((ESSENTIAL_MISSING++))
    fi

    # Starship
    if command_exists starship; then
        VERSION=$(starship --version | awk '{print $2}')
        print_success "Starship prompt installed (version $VERSION)"
    else
        print_error "Starship is NOT installed"
        echo "  Install: curl -sS https://starship.rs/install.sh | sh"
        ((ESSENTIAL_MISSING++))
    fi
}

# Check optional tools
check_optional() {
    print_header "🛠️  Checking Optional Tools"

    # Neovim
    if command_exists nvim; then
        VERSION=$(nvim --version | head -1 | awk '{print $2}')
        print_success "Neovim installed (version $VERSION)"
    else
        print_warning "Neovim is not installed (optional)"
        echo "  Install: brew install neovim (macOS) or sudo apt install neovim (Linux)"
        ((OPTIONAL_MISSING++))
    fi

    # FZF
    if command_exists fzf; then
        VERSION=$(fzf --version | awk '{print $1}')
        print_success "FZF installed (version $VERSION)"
    else
        print_warning "FZF is not installed (recommended)"
        echo "  Install: brew install fzf (macOS) or sudo apt install fzf (Linux)"
        ((OPTIONAL_MISSING++))
    fi

    # fd
    if command_exists fd; then
        VERSION=$(fd --version | awk '{print $2}')
        print_success "fd installed (version $VERSION)"
    else
        print_warning "fd is not installed (recommended)"
        echo "  Install: brew install fd (macOS) or sudo apt install fd-find (Linux)"
        ((OPTIONAL_MISSING++))
    fi

    # bat
    if command_exists bat; then
        VERSION=$(bat --version | awk '{print $2}')
        print_success "bat installed (version $VERSION)"
    else
        print_warning "bat is not installed (recommended)"
        echo "  Install: brew install bat (macOS) or sudo apt install bat (Linux)"
        ((OPTIONAL_MISSING++))
    fi

    # eza
    if command_exists eza; then
        VERSION=$(eza --version | head -1 | awk '{print $2}')
        print_success "eza installed (version $VERSION)"
    else
        print_warning "eza is not installed (recommended)"
        echo "  Install: brew install eza (macOS)"
        ((OPTIONAL_MISSING++))
    fi

    # zoxide
    if command_exists zoxide; then
        VERSION=$(zoxide --version | awk '{print $2}')
        print_success "zoxide installed (version $VERSION)"
    else
        print_warning "zoxide is not installed (recommended)"
        echo "  Install: brew install zoxide (macOS) or curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash"
        ((OPTIONAL_MISSING++))
    fi

    # ripgrep
    if command_exists rg; then
        VERSION=$(rg --version | head -1 | awk '{print $2}')
        print_success "ripgrep installed (version $VERSION)"
    else
        print_warning "ripgrep is not installed (recommended)"
        echo "  Install: brew install ripgrep (macOS) or sudo apt install ripgrep (Linux)"
        ((OPTIONAL_MISSING++))
    fi

    # Node.js
    if command_exists node; then
        VERSION=$(node --version)
        print_success "Node.js installed (version $VERSION)"
    else
        print_warning "Node.js is not installed (optional)"
        echo "  Install via nvm or brew install node"
        ((OPTIONAL_MISSING++))
    fi

    # Python
    if command_exists python3; then
        VERSION=$(python3 --version | awk '{print $2}')
        print_success "Python3 installed (version $VERSION)"
    else
        print_warning "Python3 is not installed (optional)"
        echo "  Usually pre-installed on macOS/Linux"
        ((OPTIONAL_MISSING++))
    fi
}

# Check Zsh plugins
check_zsh_plugins() {
    print_header "🔌 Checking Zsh Plugins"

    ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    # zsh-autosuggestions
    if [ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
        print_success "zsh-autosuggestions installed"
    else
        print_warning "zsh-autosuggestions is not installed"
        echo "  Install: git clone https://github.com/zsh-users/zsh-autosuggestions \$ZSH_CUSTOM/plugins/zsh-autosuggestions"
        ((PLUGIN_MISSING++))
    fi

    # zsh-syntax-highlighting
    if [ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
        print_success "zsh-syntax-highlighting installed"
    else
        print_warning "zsh-syntax-highlighting is not installed"
        echo "  Install: git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
        ((PLUGIN_MISSING++))
    fi

    # fast-syntax-highlighting
    if [ -d "$ZSH_CUSTOM/plugins/fast-syntax-highlighting" ]; then
        print_success "fast-syntax-highlighting installed"
    else
        print_warning "fast-syntax-highlighting is not installed"
        echo "  Install: git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \$ZSH_CUSTOM/plugins/fast-syntax-highlighting"
        ((PLUGIN_MISSING++))
    fi

    # zsh-autocomplete
    if [ -d "$ZSH_CUSTOM/plugins/zsh-autocomplete" ]; then
        print_success "zsh-autocomplete installed"
    else
        print_warning "zsh-autocomplete is not installed"
        echo "  Install: git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git \$ZSH_CUSTOM/plugins/zsh-autocomplete"
        ((PLUGIN_MISSING++))
    fi

    # auto-notify
    if [ -d "$ZSH_CUSTOM/plugins/auto-notify" ]; then
        print_success "auto-notify installed"
    else
        print_warning "auto-notify is not installed"
        echo "  Install: git clone https://github.com/MichaelAquilina/zsh-auto-notify.git \$ZSH_CUSTOM/plugins/auto-notify"
        ((PLUGIN_MISSING++))
    fi

    # you-should-use
    if [ -d "$ZSH_CUSTOM/plugins/you-should-use" ]; then
        print_success "you-should-use installed"
    else
        print_warning "you-should-use is not installed"
        echo "  Install: git clone https://github.com/MichaelAquilina/zsh-you-should-use.git \$ZSH_CUSTOM/plugins/you-should-use"
        ((PLUGIN_MISSING++))
    fi
}

# Check terminal emulators
check_terminals() {
    print_header "🖥️  Checking Terminal Emulators"

    TERMINAL_FOUND=0

    if command_exists alacritty; then
        print_success "Alacritty installed"
        ((TERMINAL_FOUND++))
    fi

    if command_exists wezterm; then
        print_success "WezTerm installed"
        ((TERMINAL_FOUND++))
    fi

    if command_exists ghostty; then
        print_success "Ghostty installed"
        ((TERMINAL_FOUND++))
    fi

    if [ $TERMINAL_FOUND -eq 0 ]; then
        print_warning "No configured terminal emulators found"
        echo "  Consider installing: Alacritty, WezTerm, or Ghostty"
    fi
}

# Check fonts
check_fonts() {
    print_header "🔤 Checking Fonts"

    if [[ "$OSTYPE" == "darwin"* ]]; then
        if [ -d "$HOME/Library/Fonts" ]; then
            NERD_FONTS=$(ls "$HOME/Library/Fonts" | grep -i "nerd\|cascadia\|fira" | wc -l)
            if [ "$NERD_FONTS" -gt 0 ]; then
                print_success "Nerd Fonts found in ~/Library/Fonts"
            else
                print_warning "No Nerd Fonts detected"
                echo "  Install: brew tap homebrew/cask-fonts && brew install --cask font-cascadia-code-nerd-font"
            fi
        fi
    else
        if [ -d "$HOME/.local/share/fonts" ] || [ -d "$HOME/.fonts" ]; then
            print_info "Font directories found - check manually for Nerd Fonts"
        else
            print_warning "Font directories not found"
        fi
    fi
}

# Check editors
check_editors() {
    print_header "📝 Checking Editors"

    if command_exists code; then
        print_success "VS Code installed"
    else
        print_info "VS Code is not installed (optional)"
    fi

    if command_exists zed; then
        print_success "Zed editor installed"
    else
        print_info "Zed editor is not installed (optional)"
    fi

    if command_exists idea || [ -d "/Applications/IntelliJ IDEA.app" ]; then
        print_success "IntelliJ IDEA found"
    else
        print_info "IntelliJ IDEA is not installed (optional)"
    fi
}

# Summary
print_summary() {
    print_header "📊 Summary"

    if [ $ESSENTIAL_MISSING -eq 0 ]; then
        print_success "All essential tools are installed! ✨"
    else
        print_error "$ESSENTIAL_MISSING essential tool(s) missing"
    fi

    if [ $PLUGIN_MISSING -gt 0 ]; then
        print_warning "$PLUGIN_MISSING Zsh plugin(s) missing"
    else
        print_success "All Zsh plugins are installed!"
    fi

    if [ $OPTIONAL_MISSING -gt 0 ]; then
        print_info "$OPTIONAL_MISSING optional tool(s) not installed"
    else
        print_success "All optional tools are installed!"
    fi

    echo ""

    if [ $ESSENTIAL_MISSING -eq 0 ] && [ $PLUGIN_MISSING -eq 0 ]; then
        echo -e "${GREEN}🎉 Your system is ready! You can now run ./install.sh${NC}"
    else
        echo -e "${YELLOW}⚠️  Please install missing essential tools and plugins before running ./install.sh${NC}"
    fi

    echo ""
    print_info "For detailed installation instructions, see README.md or QUICKSTART.md"
}

# Main execution
main() {
    clear
    echo -e "${CYAN}"
    echo "╔═══════════════════════════════════════════╗"
    echo "║   Dev Environment Prerequisites Checker   ║"
    echo "╚═══════════════════════════════════════════╝"
    echo -e "${NC}"

    check_essential
    check_optional
    check_zsh_plugins
    check_terminals
    check_fonts
    check_editors
    print_summary
}

# Run the script
main
