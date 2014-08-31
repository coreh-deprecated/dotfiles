#
# COREH'S BASH PROFILE
#

# Settings

## General Settings
export EDITOR="vim"
export CC=clang
export CLICOLOR=1
export LSCOLORS=exfxxxxxcxxxxxxxxxEeEx

## Bash Settings
set -o vi

# Bash Plugins
source $(brew --prefix)/etc/bash_completion
source ~/.z.sh
source ~/.git-completion.bash

# Prompt String (PS1)
function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \(\1\)/'
}
function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local DEFAULT="\[\033[00m\]"
  export PS1="$WHITEBOLD\w$GREEN\$(git_branch)$DEFAULT \$ "
}
prompt

# Aliases
## Misc Commands
alias m="mate"
alias s="subl"
alias v="vim"
alias f="fg"
alias ll='ls -l'
alias less='less -R'
alias rm!="rm -rf"
alias md="mkdir"

## Vim-like Commands
alias :e="vim"
alias :q="exit"

## NPM
alias ni='npm install'
alias nig='npm install --global'

## Burl
alias GET='burl GET'
alias HEAD='burl -I'
alias POST='burl POST'
alias PUT='burl PUT'
alias PATCH='burl PATCH'
alias DELETE='burl DELETE'
alias DEL='burl DELETE'
alias OPTIONS='burl OPTIONS'

## Git
alias g="git"
alias gd="git diff"
alias gds="git diff --staged"
alias ga="git add"
alias gst="git status"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit -a"
alias gcam="git commit -a -m"
alias gm="git merge --no-ff"
alias gpt="git push --tags"
alias gp="git push"
alias grh="git reset --hard"
alias gb="git branch"
alias gcob="git checkout -b"
alias gco="git checkout"
alias gba="git branch -a"
alias gcp="git cherry-pick"
alias gl="git lol"
alias gpom="git pull origin master"
alias gpoh="git push origin HEAD"
alias gcd='cd "`git rev-parse --show-toplevel`"'
alias gsu='git submodule update'

## Frequently Edited Files
alias hosts="sudo $EDITOR /etc/hosts"
alias profile="$EDITOR ~/.bash_profile"
alias vimrc="$EDITOR ~/.vimrc"

## Frequently Used Commands
alias proxy="ssh -N -D 8080 proxy"
alias cloudup="/Applications/Cloudup.app/Contents/MacOS/Cloudup"
alias cloudup-dev="CLOUDUP_ENV=dev NODE_ENV=development cloudup"
alias cloudup-stage="CLOUDUP_ENV=stage cloudup"

## Uncolor Colored Output
alias uncolor="perl -pe 's/\e\[?.*?[\@-~]//g'"

# Disable Tilde Expansion, Very Annoying
function _expand() { :;}

# Display a random man page title upon start
# dir="/usr/bin"; man $(ls $dir |sed -n "$(echo $(( $RANDOM % $(ls $dir |wc -l | awk "{ print $1; }" ) + 1 )) )p") | head -n 6 | tail -n 2
