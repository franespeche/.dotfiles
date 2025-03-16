#!/bin/bash


# # # # # # # # # # # #
#        misc         #
# # # # # # # # # # # #

# change iterm profile
function setTerminalProfile() {
  if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    BASE_DIR="${XDG_DATA_HOME:-$HOME/.dotfiles}"
    $XDG_CONFIG_HOME/zsh/venv/bin/python "$BASE_DIR/zsh/functions/set_iterm2_profile.py" --profile "$1" &
  else
    echo $TERM_PROGRAM 'not supported'
  fi
}

function nvim_emit() {
  for socket in $(lsof -U | grep /tmp/nvim | awk '{print $NF}'); do
    if [ -S "$socket" ]; then
      nvim --server "$socket" --remote-send "<Cmd>doautocmd User $1<CR>" > /dev/null 2>&1
    fi
  done
}

# MacOS only
function dark() {
  if [ "$(uname)" = "Linux" ]; then
    echo "OS not supported"
    return
  fi

  osascript -e \
  'tell application "System Events" to tell appearance preferences to set dark mode to not dark mode' &> /dev/null

  CURRENT_MODE=$(defaults read -g AppleInterfaceStyle 2>/dev/null || echo "Light")

  if [[ "$CURRENT_MODE" == "Dark" ]]; then
    nvim_emit 'SetDarkMode' &&
    setTerminalProfile dark
  else
    nvim_emit 'SetLightMode' &&
    setTerminalProfile light
  fi
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
