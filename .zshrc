# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi


eval "$(starship init zsh)"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="avit"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

DEFAULT_USER=$USER



# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting auto-notify z you-should-use fast-syntax-highlighting zsh-autocomplete history web-search copybuffer dirhistory $plugins)

source $ZSH/oh-my-zsh.sh

# git aliases
alias g="git"
alias gs="git status"
alias ga="git add ."
alias gcm="git commit -m"
alias gbd="branch -d"
alias gbD="branch -D"
alias gpl="git pull"
alias gpu="git push"
alias gm="git merge"
alias gco="git checkout"
alias	gss="git stash save"
alias gsl="git stash list"
alias	gsp="git stash pop"
alias gcun="git config user.name"
alias gcue="git config user.email"
alias	glg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gwa="git worktree add"
alias gwr="git worktree remove"
alias gwl="git worktree list"
alias gwp="git worktree prune"
alias ge= "gh copilot explain"
alias gsu="gh copilot suggest"



# Custom aliases
alias cl="clear"
alias yk="yarn kill"
alias ysp="yarn start pos"
alias yi="yarn install"
alias ys="yarn start"
alias yrd="yarn run dev"
alias ya="yarn android"
alias n="npm"
alias ns="npm start"
alias ni="npm install"
alias nrd="npm run dev"
alias c="code ."
alias s="sudo"
alias t="tmux"
alias tk="tmux kill-session -t"
alias tn="tmux new -s"
alias sz="source ~/.zshrc"
alias yca="yarn clean:android"

eval "$(zoxide init zsh)"

# Set JAVA_HOME to the correct Java installation directory
# export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Update PATH to include JAVA_HOME/bin
# export PATH=$JAVA_HOME/bin:$PATH


# Set JAVA_HOME for OpenJDK 17
# export JAVA_HOME=/usr/lib/jvm/jdk-17.0.2
# export PATH=$JAVA_HOME/bin:$PATH

# Set JAVA_HOME for OpenJDK 17
# export JAVA_HOME=/usr/lib/jvm/openlogic-openjdk-11.0.25+9
# export PATH=$JAVA_HOME/bin:$PATH

# Set JAVA_HOME to the correct Java installation directory
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Update PATH to include JAVA_HOME/bin
export PATH=$JAVA_HOME/bin:$PATH

# Other existing PATH exports
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/path/to/neovim

# Set threshold to 20seconds
export AUTO_NOTIFY_THRESHOLD=20
export AUTO_NOTIFY_TITLE="Hey! %command has just finished"
export AUTO_NOTIFY_BODY="It completed in %elapsed seconds with exit code %exit_code"
# Set notification expiry to 10 seconds
export AUTO_NOTIFY_EXPIRE_TIME=10000



# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"




[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"
