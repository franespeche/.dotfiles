# # # # # # # # # # # #
#        misc         #
# # # # # # # # # # # #

alias rmrf='rm -rf $1'
alias cdz="changeDirectory $DOTFILES/zsh"
alias cdd="changeDirectory $DOTFILES"
alias v="nvim"
alias vim='v'
alias s=shoot
alias g=googler
alias p=python3
alias pyl=py3install
alias c=clear
alias ls='exa --icons --tree --level 1'
alias ll='ls -la'
alias lld="ll | grep \"^\.\""
alias va='vim $ZDOTDIR/alias/misc.zsh'
alias vz='vim $ZDOTDIR/.zshrc'
alias kan='killall -9 node'
alias ac="arduino-cli"

# vi git
function vg() {
  vim $(git ls-files --others --exclude-standard && git diff --name-only)
}

