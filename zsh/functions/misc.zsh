#!/bin/bash

# # # # # # # # # # # #
#        misc         #
# # # # # # # # # # # #

# change iterm profile
function setItermProfile(){
  #	might be safe to remove
  #	export ITERM_PROFILE="$1"
  echo -e "\033]50;SetProfile=$1\a"
}

# toggle dark mode
function dark() {
  CURRENT_MODE=$(defaults read -g AppleInterfaceStyle 2> /dev/null)
  if [[ "$CURRENT_MODE" == "Dark" ]]; then
    setItermProfile light &&
    -
  else
    setItermProfile dark &&
    -
  fi
  # change os mode
  osascript -e \
  'tell application "System Events" to tell appearance preferences to set dark mode to not dark mode'
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

# relaod zsh
function rr() {
  msg "reload .zshrc"
	source $ZDOTDIR/.zshrc $1
  # omz reload
}

# cd
function changeDirectory() {
  msg "cd $1"
  cd "$1"
}

function llg() {
  ll | grep "$1"
}

# print formated message
function msg() {
	# TODO: get number of lines $PS1 currently has
  echo "$blue·  ➜  $yellow$1"
  echo "·"
  # reset terminal attributes
  tput sgr0
}

# kill
function ka() {
	killall -9 node
	killall -9 java
	killall -9 firebase
}
