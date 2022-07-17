# # # # # # # # # # # #
#         zsh         #
# # # # # # # # # # # #

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

	# set keyboard speed
	set r rate 200 50
fi

# fzf show hidden files
export FZF_DEFAULT_COMMAND="find -L"

# source alias

# source local cfg
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

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

export PATH=$HOME/.local/bin:$PATH

# pyenv init
eval "$(pyenv init -)"

# use .. instead of cd ..
setopt auto_cd

# # # # # # # # # # # #
#         nvm         #
# # # # # # # # # # # #

export NVM_DIR="$HOME/.nvm" # path
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


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
