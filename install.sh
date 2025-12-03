#!/bin/bash

# Dev Environment Setup Installation Script
# This script will backup existing configs and create symlinks to the new ones

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

# Function to print colored output
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

print_header() {
    echo -e "\n${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${PURPLE}  $1${NC}"
    echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
}

# Function to create backup
backup_file() {
    local file=$1
    if [ -f "$file" ] || [ -d "$file" ]; then
        mkdir -p "$BACKUP_DIR"
        cp -r "$file" "$BACKUP_DIR/" 2>/dev/null || true
        print_success "Backed up: $file"
        return 0
    fi
    return 1
}

# Function to create symlink
create_symlink() {
    local source=$1
    local target=$2

    # Backup existing file/directory
    if [ -e "$target" ] || [ -L "$target" ]; then
        backup_file "$target"
        rm -rf "$target"
    fi

    # Create parent directory if it doesn't exist
    mkdir -p "$(dirname "$target")"

    # Create symlink
    ln -sf "$source" "$target"
    print_success "Linked: $target -> $source"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Main installation
main() {
    print_header "🚀 Dev Environment Setup Installer"

    print_info "Installation directory: $SCRIPT_DIR"
    print_info "Backup directory: $BACKUP_DIR"

    # Ask for confirmation
    echo ""
    read -p "Do you want to proceed with the installation? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_warning "Installation cancelled"
        exit 0
    fi

    # Create backup directory
    print_header "📦 Creating Backup"
    mkdir -p "$BACKUP_DIR"
    print_success "Backup directory created: $BACKUP_DIR"

    # Install core configurations
    print_header "🔗 Installing Core Configurations"

    # Zsh
    if [ -f "$SCRIPT_DIR/.zshrc" ]; then
        create_symlink "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
    fi

    # Tmux
    if [ -f "$SCRIPT_DIR/.tmux.conf" ]; then
        create_symlink "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"
    fi

    # Git
    if [ -f "$SCRIPT_DIR/.gitconfig" ]; then
        create_symlink "$SCRIPT_DIR/.gitconfig" "$HOME/.gitconfig"
        print_warning "Remember to update Git user.name and user.email!"
    fi

    # Starship
    if [ -f "$SCRIPT_DIR/starship.toml" ]; then
        mkdir -p "$HOME/.config"
        create_symlink "$SCRIPT_DIR/starship.toml" "$HOME/.config/starship.toml"
    fi

    # Terminal Emulators
    print_header "🖥️  Installing Terminal Configurations"

    # Alacritty
    if [ -f "$SCRIPT_DIR/alacritty.yml" ]; then
        mkdir -p "$HOME/.config/alacritty"
        create_symlink "$SCRIPT_DIR/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
    fi

    # WezTerm
    if [ -f "$SCRIPT_DIR/wezterm.lua" ]; then
        create_symlink "$SCRIPT_DIR/wezterm.lua" "$HOME/.wezterm.lua"
    fi

    # Ghostty
    if [ -d "$SCRIPT_DIR/.config/ghostty" ]; then
        mkdir -p "$HOME/.config/ghostty"
        for file in "$SCRIPT_DIR/.config/ghostty"/*; do
            if [ -f "$file" ]; then
                create_symlink "$file" "$HOME/.config/ghostty/$(basename "$file")"
            fi
        done
    fi

    # Neovim
    print_header "📝 Installing Neovim Configuration"
    if [ -d "$SCRIPT_DIR/nvim" ]; then
        mkdir -p "$HOME/.config/nvim"
        if [ -f "$SCRIPT_DIR/nvim/init.lua" ]; then
            create_symlink "$SCRIPT_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"
        fi
        if [ -d "$SCRIPT_DIR/nvim/lua" ]; then
            create_symlink "$SCRIPT_DIR/nvim/lua" "$HOME/.config/nvim/lua"
        fi
    fi

    # VS Code
    print_header "💻 Installing VS Code Configuration"
    if [ -d "$SCRIPT_DIR/.vscode" ]; then
        # Detect OS
        if [[ "$OSTYPE" == "darwin"* ]]; then
            VSCODE_DIR="$HOME/Library/Application Support/Code/User"
        else
            VSCODE_DIR="$HOME/.config/Code/User"
        fi

        mkdir -p "$VSCODE_DIR"

        if [ -f "$SCRIPT_DIR/.vscode/settings.json" ]; then
            create_symlink "$SCRIPT_DIR/.vscode/settings.json" "$VSCODE_DIR/settings.json"
        fi

        if [ -f "$SCRIPT_DIR/.vscode/keybindings.json" ]; then
            create_symlink "$SCRIPT_DIR/.vscode/keybindings.json" "$VSCODE_DIR/keybindings.json"
        fi
    fi

    # Zed Editor
    print_header "⚡ Installing Zed Configuration"
    if [ -d "$SCRIPT_DIR/.zed" ]; then
        mkdir -p "$HOME/.config/zed"
        for file in "$SCRIPT_DIR/.zed"/*; do
            if [ -f "$file" ]; then
                create_symlink "$file" "$HOME/.config/zed/$(basename "$file")"
            fi
        done
    fi

    # Check prerequisites
    print_header "🔍 Checking Prerequisites"

    # Essential tools
    tools=(
        "git:Git"
        "zsh:Zsh"
        "tmux:Tmux"
    )

    missing_tools=()

    for tool_info in "${tools[@]}"; do
        tool="${tool_info%%:*}"
        name="${tool_info#*:}"
        if command_exists "$tool"; then
            print_success "$name is installed"
        else
            print_warning "$name is not installed"
            missing_tools+=("$name")
        fi
    done

    # Optional tools
    optional_tools=(
        "starship:Starship Prompt"
        "nvim:Neovim"
        "fzf:FZF Fuzzy Finder"
        "fd:fd (better find)"
        "bat:bat (better cat)"
        "eza:eza (better ls)"
        "zoxide:zoxide (smarter cd)"
        "rg:ripgrep (better grep)"
    )

    echo ""
    print_info "Optional tools:"
    for tool_info in "${optional_tools[@]}"; do
        tool="${tool_info%%:*}"
        name="${tool_info#*:}"
        if command_exists "$tool"; then
            print_success "$name is installed"
        else
            print_warning "$name is not installed (optional)"
        fi
    done

    # Installation complete
    print_header "✨ Installation Complete!"

    if [ ${#missing_tools[@]} -gt 0 ]; then
        echo ""
        print_warning "Missing essential tools:"
        for tool in "${missing_tools[@]}"; do
            echo "  - $tool"
        done
        echo ""
        print_info "Please install missing tools before using the configurations"
    fi

    echo ""
    print_success "All configurations have been installed!"
    print_info "Your old configs have been backed up to: $BACKUP_DIR"
    echo ""

    # Next steps
    print_header "📋 Next Steps"
    echo ""
    echo "1. ${CYAN}Reload your shell:${NC}"
    echo "   source ~/.zshrc"
    echo ""
    echo "2. ${CYAN}Update Git configuration:${NC}"
    echo "   git config --global user.name \"Your Name\""
    echo "   git config --global user.email \"your@email.com\""
    echo ""
    echo "3. ${CYAN}Install Tmux plugins (inside tmux):${NC}"
    echo "   Press: Ctrl+s then I (capital i)"
    echo ""
    echo "4. ${CYAN}Install Oh My Zsh plugins:${NC}"
    echo "   Run the commands from the README Prerequisites section"
    echo ""
    echo "5. ${CYAN}Install Neovim plugins:${NC}"
    echo "   Open nvim and plugins will auto-install"
    echo ""

    print_success "Happy coding! 🎉"
    echo ""
}

# Run main function
main
