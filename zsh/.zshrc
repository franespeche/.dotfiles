# # # # # # # # # # # #
#         zsh         #
# # # # # # # # # # # #

# path
export ZSH="/Users/franespeche/.oh-my-zsh"

# theme
ZSH_THEME="frean"

# hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# terminal title.
DISABLE_AUTO_TITLE="true"

# history timestamp
HIST_STAMPS="mm/dd/yyyy"

# plugins
plugins=(git vi-mode)

# omz
source $ZSH/oh-my-zsh.sh

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
#       unused        #
# # # # # # # # # # # #
#
# case-sensitive completion.
# CASE_SENSITIVE="true"
#
# this wasn't commented until 02/05/22
# enable text objects for quotes or brackets in CLI vim editor
#
# autoload -Uz select-bracketed select-quoted
# zle -N select-quoted
# zle -N select-bracketed
# for km in viopp visual; do
#   bindkey -M $km -- '-' vi-up-line-or-history
#   for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
#     bindkey -M $km $c select-quoted
#   done
#   for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
#     bindkey -M $km $c select-bracketed
#   done
# done
#
