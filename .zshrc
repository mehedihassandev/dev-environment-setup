if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="half-life"

DEFAULT_USER=$USER

plugins=(git zsh-autosuggestions history web-search copybuffer dirhistory zsh-syntax-highlighting)

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


# Common aliases
alias cl="clear"
alias yk="yarn kill"
alias ysp="yarn start pos"
alias yi="yarn install"
alias n="npm"
alias ns="npm start"
alias ni="npm install"
alias nrd="npm run dev"
alias c="code ."
alias s="sudo"
alias t="tmux"
alias tk="tmux kill-session -t"
alias tn="tmux new -s"
