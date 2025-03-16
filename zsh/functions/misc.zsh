#!/bin/bash

# # # # # # # # # # # #
#        misc         #
# # # # # # # # # # # #

# change iterm profile
function set_terminal_profile() {
  if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    $XDG_CONFIG_HOME/python/venv/bin/python "$PYTHON_SCRIPTS_DIR/set_iterm2_profile.py" --profile "$1" &
  else
    echo $TERM_PROGRAM ' not supported'
  fi
}

# emit command to nvim running instances
function nvim_emit() {
  for socket in $(lsof -U | grep $NVIM_BASE_SOCKET | awk '{print $NF}'); do
    if [ -S "$socket" ]; then
      nvim --server "$socket" --remote-send $1 > /dev/null 2>&1
    fi
  done
}

function set_nvim_dark_mode() {
  local autocmd
  if [ "$1" = "dark" ]; then
    autocmd="SetDarkMode"
  else
    autocmd="SetLightMode"
  fi
  nvim_emit "<Cmd>doautocmd User $autocmd<CR>"
  unset autocmd
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

  local mode
  if [[ "$CURRENT_MODE" == "Dark" ]]; then
    mode=dark
  else
    mode=light
  fi

  set_nvim_dark_mode "$mode" &> /dev/null &&
  set_terminal_profile "$mode" &> /dev/null &
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
  echo "${blue}·  ➜  ${yellow}$1"
  # reset terminal attributes
  tput sgr0
}

# kill
function ka() {
	killall -9 node
	killall -9 java
	killall -9 firebase
}
