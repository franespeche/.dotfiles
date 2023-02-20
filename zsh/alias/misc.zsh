# # # # # # # # # # # #
#        misc         #
# # # # # # # # # # # #

alias rmrf='rm -rf $1'
alias cdz="changeDirectory $DOTFILES/zsh"
alias cdn="changeDirectory $DOTFILES/nvim"
alias cdd="changeDirectory $DOTFILES"
alias realvim="vim"
alias vim="nvim"
alias s=shoot
alias g=googler
alias p=python3
alias pyl=py3install
alias c=clear
alias ls='exa --icons --tree --level 1'
alias ll='ls -la'
alias lld="ll | grep \"^\.\""
alias va='nvim $ZDOTDIR/alias/misc.zsh'
alias vz='nvim $ZDOTDIR/.zshrc'
alias kan='killall -9 node'
alias ac="arduino-cli"
alias meteo="curl wttr.in/Buenos%20Aires"

# vi git
function vg() {
  vim $(git ls-files --others --exclude-standard && git diff --name-only)
}

