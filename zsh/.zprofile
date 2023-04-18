# # # # # # # # # # # #
#    dark mode        #
# # # # # # # # # # # #

local CURRENT_MODE=$(defaults read -g AppleInterfaceStyle 2> /dev/null)
local MODE
# if [ "$(defaults read -g AppleInterfaceStyle)" = "Dark" ]; then
if [[ "$CURRENT_MODE" == "Dark" ]]; then
  MODE="dark"
  # export ITERM_PROFILE="dark"
  echo -e "\033]50;SetProfile=dark\a"
else
  MODE="light" 
  # export ITERM_PROFILE="light"
  echo -e "\033]50;SetProfile=light\a"
fi
unset CURRENT_MODE
unset MODE

# # # # # # # # # # # #
#      editors        #
# # # # # # # # # # # #

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

# go
export PATH=$PATH:/usr/local/go/bin
