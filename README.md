# Dev Environment Configuration

This repository is used to manage development environment files, such as dotfiles, configuration files, and setup scripts. It includes configurations for various tools and editors to streamline the development workflow.

## Repository Structure

-   .idea/
    -   .gitignore
    -   dev-environment-setup.iml
    -   modules.xml
    -   vcs.xml
-   .vscode/
    -   custom-vscode.css
    -   keybindings.json
    -   settings.json
    -   vscode-script.js
-   nvim/
    -   lua/
        -   config/
            -   keymaps.lua
            -   autocmds.lua
            -   ptions.lua
            -   lazy.lua o
        -   plugins/
            -   lsp/
                lspconfig.lua
            -   alpha.lua
            -   bufferline.lua
            -   colorscheme.lua
            -   comment.lua
            -   example.lus
            -   etc
    -   init.lua
-   ssh/
    -   .config.md
    -   .ssh.md
-   .gitconfig
-   .tmux.conf
-   .zshrc
-   alacritty.yml
-   starship.toml
-   wezterm.lua

## Configuration Files

-   **.gitconfig**: Git configuration.
-   **.idea/**: IntelliJ IDEA project files.
-   **.tmux.conf**: Tmux configuration.
-   **.vscode/**: Visual Studio Code settings and extensions.
-   **.zshrc**: Zsh shell configuration.
-   **alacritty.yml**: Alacritty terminal emulator configuration.
-   **nvim/**: Neovim configuration files.
-   **ssh/**: SSH configuration and setup guides.
-   **starship.toml**: Starship prompt configuration.
-   **wezterm.lua**: WezTerm terminal emulator configuration.

## Usage

Clone the repository and symlink the necessary configuration files to their respective locations in your home directory.

```sh
git clone https://github.com/yourusername/dev-environment.git
cd dev-environment
# Example for .zshrc
ln -s $(pwd)/.zshrc ~/.zshrc

Git Configuration
For setting up multiple Git accounts, refer to the SSH Configuration Guide.

Visual Studio Code
The settings for Visual Studio Code can be found in the .vscode/settings.json file. This includes configurations for GitHub Copilot, themes, and UI settings.

IntelliJ IDEA
The IntelliJ IDEA project configuration is located in the .idea/ directory. The main project file is modules.xml.

License
This repository is licensed under the MIT License.

```
