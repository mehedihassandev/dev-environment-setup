# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# eval "$(starship init zsh)"
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="avit"

DEFAULT_USER=$USER



# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions history web-search copybuffer dirhistory zsh-syntax-highlighting auto-notify $plugins)

source $ZSH/oh-my-zsh.sh

# git aliases
alias g="git"
alias gs="git status"
alias cg="config"
alias ga="git add ."
alias a="add"
alias gcm="git commit -m"
alias c="commit"
alias cm="commit -m"
alias b="branch"
alias gbd="branch -d"
alias gbD="branch -D"
alias gpl="git pull"
alias pl="pull"
alias gpu="git push"
alias pu="push"
alias gm="git merge"
alias m="merge"
alias gco="git checkout"
alias co="checkout"
alias	gss="git stash save"
alias ss="stash save"
alias gsl="git stash list"
alias sl="stash list"
alias	gsp="git stash pop"
alias	sp="stash pop"
alias gcun="git config user.name"
alias cun="config user.name"
alias un="user.name"
alias gcue="git config user.email"
alias cue="config user.email"
alias ue="user.email"
alias cue="config user.email"
alias	glg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias	lg="log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gwa="git worktree add"
alias wa="worktree add"
alias gwr="git worktree remove"
alias wr="worktree remove"
alias gwl="git worktree list"
alias wl="worktree list"
alias gwp="git worktree prune"
alias wp="worktree prune"



# Custom aliases
alias cl="clear"
alias yk="yarn kill"
alias ysp="yarn start pos"
alias yi="yarn install"
alias ys="yarn start"
alias yrd="yarn run dev"
alias n="npm"
alias ns="npm start"
alias ni="npm install"
alias nrd="npm run dev"
alias c="code ."
alias s="sudo"
alias t="tmux"
alias tk="tmux kill-session -t"
alias tn="tmux new -s"

eval "$(zoxide init zsh)"

# export ANDROID_HOME=$HOME/Android/Sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export PATH=/home/mh/OpenJDK17U-jdk_x64_linux_hotspot_17.0.12_7/jdk-17.0.12+7/bin:$PATH

export PATH=/home/mh/OpenJDK17U-jdk_x64_linux_hotspot_17.0.12_7/jdk-17.0.12+7/bin:$PATH


export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set threshold to 20seconds
export AUTO_NOTIFY_THRESHOLD=20
export AUTO_NOTIFY_TITLE="Hey! %command has just finished"
export AUTO_NOTIFY_BODY="It completed in %elapsed seconds with exit code %exit_code"
# Set notification expiry to 10 seconds
export AUTO_NOTIFY_EXPIRE_TIME=10000


# starship prompt
eval "$(starship init zsh)"


