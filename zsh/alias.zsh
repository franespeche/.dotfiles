#!/bin/zsh
# $COLUMNS = n of columns in terminal
# pwd=$(echo "${PWD/$HOME/}" | wc -c)
# branch=$(git branch --show-current | wc -c)

# # # # # # # # # # # #
#         env         #
# # # # # # # # # # # #

CUSTOM_SCRIPTS=$ZDOTDIR/custom/scripts
MUSIC_BOT_DIRECTORY=$CUSTOM_SCRIPTS/voice/examples/music-bot
CHROME_EXTENSION_DIRECTORY=/Users/franespeche/ecommerce-catalog
DARK_MODE_SCRIPT_EXEC=$CUSTOM_SCRIPTS/dark.sh
ZSHC=$ZDOTDIR
NVIM=$XDG_CONFIG_HOME/nvim/

# # # # # # # # # # # #
#       styles        #
# # # # # # # # # # # #

# color mapping
grey='\033[1;30m'
red='\033[0;31m'
RED='\033[1;31m'
green='\033[0;32m'
GREEN='\033[1;32m'
yellow='\033[0;33m'
YELLOW='\033[1;33m'
purple='\033[0;35m'
PURPLE='\033[1;35m'
white='\033[0;37m'
WHITE='\033[1;37m'
blue='\033[0;34m'
BLUE='\033[1;34m'
local cyan='\033[0;36m'
CYAN='\033[1;36m'
NC='\033[0m'

# # # # # # # # # # # #
#       prompt        #
# # # # # # # # # # # #

function msg() {
  echo "$blue·  ➜  $yellow$1"
  echo "·"
  # reset terminal attributes
  tput sgr0
}

# # # # # # # # # # # #
#      functions      #
# # # # # # # # # # # #

# change iterm profile
function setItermProfile(){
	export ITERM_PROFILE="$1"
  echo -e "\033]50;SetProfile=$1\a"
}

# toggle dark mode
function dark() {
  # check current mode and set to opposite
  # prevent stdout and stderr

  if [[ $(defaults read -g AppleInterfaceStyle) == 'Dark' ]]; then
    setItermProfile light &&
    msg "switched to light mode" &&
    -
   else
    setItermProfile dark &&
    msg "switched to dark mode" &&
    -
   fi
  # change os mode
  $DARK_MODE_SCRIPT_EXEC
}

# upload screenshot from mouse selection and store url on the clipboard
function shoot() {
  msg "python3 $CUSTOM_SCRIPTS/screenshoot/run.py"
  cd $CUSTOM_SCRIPTS/screenshoot
  python3 run.py
  -
}

# make gif from .mov
function makegif(){
  # notes:
  #   echo -e "\07" === tput bell
  ffmpeg -i $1 -pix_fmt rgb8 -r 10 output.gif && gifsicle -03 output.gif -o output.gif && echo -e "\07"
}

# get dollar blue
function dolar() {
  DOLAR=$(curl -s https://api.bluelytics.com.ar/v2/latest)
  DOLAR_COMPRA=$(echo $DOLAR | jq -r .blue.value_buy)
  DOLAR_VENTA=$(echo $DOLAR | jq -r .blue.value_sell)

  msg "dolar hoy: \n        compra: $DOLAR_COMPRA \n        venta: $DOLAR_VENTA"
}

# install py3 dependencies
function py3install() {
  msg "python3 -m pip install --upgrade $1"
  python3 -m pip install --upgrade $1
}

# relaod zsh
function ra() {
  msg "reload .zshrc"
	source $ZDOTDIR/.zshrc
  # omz reload
}

# cd
function changeDirectory() {
  msg "cd $1"
  cd "$1"
}

# music bot
function bot() {
  START="start"
  if [[ "$1" = "start" ]]
  then
    cd $MUSIC_BOT_DIRECTORY
    msg "start music bot"
    yarn start
  else
    msg "uknown command \"$1\""
  fi
}

# # # # # # # # # # # #
#        alias        #
# # # # # # # # # # # #

alias vim='nvim'
alias zc="changeDirectory $ZDOTDIR"
alias s=shoot
alias g=googler
alias p=python3
alias pyl=py3install
alias c=clear
alias ls='exa --icons --tree --level 1'
alias ll='ls -la'
alias lld="ll | grep \"^\..*\""
alias va='vim $ZDOTDIR/alias.zsh'
alias vs='vim $ZDOTDIR/.scale.env'
# alias vg='vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh'
# alias vo='vim ~/.oh-my-zsh/oh-my-zsh.sh'
alias vz='vim ~/.zshrc'

# # # # # # # # # # # #
#         git         #
# # # # # # # # # # # #

# restore file from staging area
function grs() {
  msg "git restore --staged"
  # variables
  declare -A dictionary
  stagedFiles=$(git diff --name-only --cached)
  i=0

  echo "$green:: choose a file to restore from staging area"

  echo $stagedFiles |
    while read x; do
      i=$[$i + 1]
      echo "  $i. $x"
      dict[$i]=$x
    done

 i=$[$i + 1]
 dict[$i]="exit"
 echo "  $i. exit"

  #prompt
  read -s file
  echo

  if [[ ${dict[$file]} == "exit" ]] then
    return
  fi

  { #try
      git restore --staged ${dict[$file]} &&
      echo "  ➜ $white ${dict[$file]}$yellow restored from staging area"
  } || { # catch
      echo "failed to restore file ${dict[$file]}"
  }
}

function removeLocalAndRemoteBranch() {
  # remove local
  git branch -D $1 &&
    msg "deleted local branch $1"

  # remove remote
  git push origin --delete $1 &&
    msg "deleted remote branch $1"
}

function gcob() {
  msg "git checkout -b $1"
  git checkout -b $1
}


function gcmsg() {
  msg "git commit -m $1"
  git commit -m $1
}

function gce() {
  msg "git commit --allow-empty -m \"$1\""
  git commit --allow-empty -m "$1"
}

function gri() {
  if [[ $# == 0 ]]; then
    exit 1
  fi
  msg "git rebase -i HEAD~\"$1\""
  git rebase -i HEAD~"$1"
}

function glom() {
  msg "git pull origin main"
  git pull origin main
}

function gsh() {
  msg "git stash"
  git stash
}

function gshp() {
  msg "git stash pop"
  git stash pop
}

function ggp() {
  msg "git log"
  git log --pretty=oneline
}

function gg() {
  msg "git log"
  git log
}

function gl() {
  msg "git pull"
  git pull
}

function gp() {
  msg "git push"
  git push
}

function g-() {
  msg "git switch -"
  git switch -
}

function gpsu() {
  CURRENT=`git_current_branch`
  msg "git push --set-upstream $CURRENT"
  git push --set-upstream origin $CURRENT
}

function gf() {
  msg "git fetch"
  git fetch
}
alias lg="lazygit"

alias glol='git log --graph --oneline --decorate'