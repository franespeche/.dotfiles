# # # # # # # # # # # #
#         omz         #
# # # # # # # # # # # #

# path
export ZSH="/Users/franespeche/.oh-my-zsh"

# source omz
source $ZSH/oh-my-zsh.sh

# # # # # # # # # # # #
#         zsh         #
# # # # # # # # # # # #

# set theme
#ZSH_THEME="frean"

# source local cfg
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

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
	
	# use .. instead of cd ..
	setopt auto_cd

	# set keyboard speed
	set r rate 200 50
fi

# fzf show hidden files
export FZF_DEFAULT_COMMAND="find -L"

# hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# terminal title.
DISABLE_AUTO_TITLE="true"

# history timestamp
HIST_STAMPS="mm/dd/yyyy"

# plugins
plugins=(git vi-mode)


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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/franespeche/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/franespeche/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/franespeche/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/franespeche/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# prompt
PROMPT='%B%m%~%b$(git_super_status) %# '
