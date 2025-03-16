#!/bin/zsh

# # # # # # # # # # # #
#    dark mode        #
# # # # # # # # # # # #

local IS_DARK_MODE=false

# TODO: make this OS agnostic
if defaults read -g AppleInterfaceStyle 2>/dev/null | grep -q "Dark"; then
  IS_DARK_MODE=true
fi

if $IS_DARK_MODE; then
  # TODO: make this terminal agnostic
  echo -e "\033]50;SetProfile=dark\a"
else
  echo -e "\033]50;SetProfile=light\a"
fi
unset IS_DARK_MODE

# # # # # # # # # # # #
#         env         #
# # # # # # # # # # # #

CUSTOM_SCRIPTS=$ZDOTDIR/scripts
MUSIC_BOT_DIRECTORY=$CUSTOM_SCRIPTS/voice/examples/music-bot
CHROME_EXTENSION_DIRECTORY=/Users/franespeche/ecommerce-catalog
DARK_MODE_SCRIPT_EXEC=$XDG_CONFIG_HOME/scripts/dark.sh
NVIM=$XDG_CONFIG_HOME/nvim/

# # # # # # # # # # # #
#         omz         #
# # # # # # # # # # # #

# fzf show hidden files
export FZF_DEFAULT_COMMAND="find -L"

# hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# terminal title.
DISABLE_AUTO_TITLE="true"

# history timestamp
HIST_STAMPS="mm/dd/yyyy"
# ignoreboth: ignoredups => ignore previous duplicated entries; ignorespace => ignores entries starting with an empty space
export HISTCONTROL=ignoreboth

autoload -Uz promptinit
promptinit

# # # # # # # # # # # #
#       default       #
# # # # # # # # # # # #

# setup brew
if [ "$(uname)" = "Darwin" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.rd/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

# pyenv init

if command -v pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)"
else
  echo "pyenv not found; skipping pyenv init."
  echo "try running: brew install pyenv"
fi

# # # # # # # # # # # #
#         nvm         #
# # # # # # # # # # # #

export NVM_DIR="$HOME/.nvm" # path
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# # # # # # # # # # # #
#       cursor        #
# # # # # # # # # # # #

cursor_mode() {
    # cursor shapes: https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init

    # makes changing btwn modes faster
    export KEYTIMEOUT=1
}
cursor_mode

# # # # # # # # # # # #
#         vim         #
# # # # # # # # # # # #

# surroundings
#
# https://github.com/tpope/vim-surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd sr change-surround
bindkey -M vicmd sd delete-surround
bindkey -M vicmd sa add-surround
bindkey -M visual S add-surround

# # # # # # # # # # # #
#         zsh         #
# # # # # # # # # # # #

# avoid duplicates
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
  if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
  elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
  fi
done

# source plugins
if [ -d $ZDOTDIR/plugins/ ]; then
	# exit if empty
	if [ -z "$(ls $ZDOTDIR/plugins/)" ]; then
		echo "No files in $ZDOTDIR/plugins/"
			return
	fi

	for file ($ZDOTDIR/plugins/*(D)); do
	if [[ $1 == "-v" ]]; then
		# verbose
		echo "sourcing $file"
	fi
	source $file
	done
fi

# source .zsh files
for zsh_file ($ZDOTDIR/*.zsh(D)); do
	if [[ $1 == "-v" ]]; then
		# verbose
		echo "sourcing $zsh_file"
	fi
	source $zsh_file
	unset zsh_file
done


# source config
if [ -d $ZDOTDIR/config/ ]; then
	for file ($ZDOTDIR/config/*.zsh(D)); do
	if [[ $1 == "-v" ]]; then
		# verbose
		echo "sourcing $file"
	fi
	source $file
	done
fi


# source functions
if [ -d $ZDOTDIR/functions/ ]; then
	# exit if empty
	if [ -z "$(ls $ZDOTDIR/functions/)" ]; then
		echo "No files in $ZDOTDIR/functions/"
			return
	fi

	for file ($ZDOTDIR/functions/*.zsh(D)); do
	if [[ $1 == "-v" ]]; then
		# verbose
		echo "sourcing $file"
	fi
	source $file
	done
fi

# use .. instead of cd ..
setopt auto_cd

# linux only
if [[ `uname` == 'Linux' ]]; then
	# source .zsh files
	for file ($ZDOTDIR/linux/*.zsh(D)); do
		if [[ $1 == "-v" ]]; then
			# verbose
			echo "sourcing $file"
		fi
		source $file
	done
	unset file

	# set keyboard speed
  if command -v xset > /dev/null 2>&1; then
      xset r rate 200 50
  else
      echo "xset not found; skipping xset rate configuration."
      echo "try running: sudo apt-get install x11-xserver-utils"
  fi
fi

# source local cfg
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Set ZSH_CACHE_DIR to the path where cache files should be created
# or else we will use the default cache/
if [[ -z "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="$ZSH/cache"
fi

autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

fpath=($ZDIR/plugins/zsh-completions/src $fpath)
# if this doesnt work, try running  rm -f ~/.zcompdump; compinit

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/franespeche/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/franespeche/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/franespeche/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/franespeche/google-cloud-sdk/completion.zsh.inc'; fi

# Ctrl+Z = fg
fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        # initial space prevents the command from being added to history
        BUFFER=" fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# tldr
TLDR_AUTO_UPDATE_DISABLED=true

export NVIM_BASE_SOCKET="/tmp/nvim"

# setup python
source $XDG_CONFIG_HOME/python/setup.sh
