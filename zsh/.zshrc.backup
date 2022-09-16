#!/bin/zsh
# $COLUMNS = n of columns in terminal
# pwd=$(echo "${PWD/$HOME/}" | wc -c)
# branch=$(git branch --show-current | wc -c)

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

# # TODO: remove omz
# path
# export ZSH="/Users/franespeche/.oh-my-zsh"

# # source omz
# source $ZSH/oh-my-zsh.sh

# plugins
# plugins=(git vi-mode)

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

export PATH=$HOME/.local/bin:$PATH

# pyenv init
eval "$(pyenv init -)"

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
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround

# # # # # # # # # # # #
#         zsh         #
# # # # # # # # # # # #

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/franespeche/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/franespeche/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/franespeche/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/franespeche/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# set theme
#ZSH_THEME="frean"

# source local cfg
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

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

# source alias
if [ -d $ZDOTDIR/alias/ ]; then
	# exit if empty
	if [ -z "$(ls $ZDOTDIR/alias/)" ]; then
		echo "No files in $ZDOTDIR/alias/"
			return
	fi

	for file ($ZDOTDIR/alias/*.zsh(D)); do
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
	for zsh_linux_file ($ZDOTDIR/linux/*.zsh(D)); do
		if [[ $1 == "-v" ]]; then
			# verbose
			echo "sourcing $zsh_linux_file"
		fi
		source $zsh_linux_file
	done
	unset zsh_linux_file

	# set keyboard speed
	xset r rate 200 50
fi


# Set ZSH_CACHE_DIR to the path where cache files should be created
# or else we will use the default cache/
if [[ -z "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="$ZSH/cache"
fi

# from omz ------------------------------------------------------------------------------------

# add a function path
# fpath=("$ZSH/functions" "$ZSH/completions" $fpath)

# Create cache and completions dir and add to $fpath
# mkdir -p "$ZSH_CACHE_DIR/completions"
# (( ${fpath[(Ie)"$ZSH_CACHE_DIR/completions"]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

# Load all stock functions (from $fpath files) called below.
# autoload -U compaudit compinit
# URL-decode a string
#
# Decodes a RFC 2396 URL-encoded (%-escaped) string.
# This decodes the '+' and '%' escapes in the input string, and leaves
# other characters unchanged. Does not enforce that the input is a
# valid URL-encoded string. This is a convenience to allow callers to
# pass in a full URL or similar strings and decode them for human
# presentation.
#
# Outputs the encoded string on stdout.
# Returns nonzero if encoding failed.
#
# Usage:
#   omz_urldecode <urlstring>  - prints decoded string followed by a newline
# function decodeurl {
#   emulate -L zsh
#   local encoded_url=$1

#   # Work bytewise, since URLs escape UTF-8 octets
#   local caller_encoding=$langinfo[CODESET]
#   local LC_ALL=C
#   export LC_ALL

#   # Change + back to ' '
#   local tmp=${encoded_url:gs/+/ /}
#   # Protect other escapes to pass through the printf unchanged
#   tmp=${tmp:gs/\\/\\\\/}
#   # Handle %-escapes by turning them into `\xXX` printf escapes
#   tmp=${tmp:gs/%/\\x/}
#   local decoded="$(printf -- "$tmp")"

#   # Now we have a UTF-8 encoded string in the variable. We need to re-encode
#   # it if caller is in a non-UTF-8 locale.
#   local -a safe_encodings
#   safe_encodings=(UTF-8 utf8 US-ASCII)
#   if [[ -z ${safe_encodings[(r)$caller_encoding]} ]]; then
#     decoded=$(echo -E "$decoded" | iconv -f UTF-8 -t $caller_encoding)
#     if [[ $? != 0 ]]; then
#       echo "Error converting string from UTF-8 to $caller_encoding" >&2
#       return 1
#     fi
#   fi

#   echo -E "$decoded"
# }

autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/completion.zsh

fpath=($ZDIR/plugins/zsh-completions/src $fpath)
# if this doesnt work, try running  rm -f ~/.zcompdump; compinit
