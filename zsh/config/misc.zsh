# # # # # # # # # # # #
#        misc         #
# # # # # # # # # # # #

function exec_neovim() {
  local socket

  # Find an available socket
  for i in {1..10}; do
    socket="${NVIM_BASE_SOCKET}_${i}"
    if [ ! -e "$socket" ]; then
      break
    fi
  done

  nvim --listen "$socket" "$@"
}

alias rmrf='rm -rf $1'
alias cdz="changeDirectory $DOTFILES/zsh"
alias cdt="changeDirectory $DOTFILES/tmux"
alias cdn="changeDirectory $DOTFILES/nvim"
alias cdd="changeDirectory $DOTFILES"
alias realvim="vim"
alias vim=exec_neovim
alias s=shoot
alias g=googler
alias p=python3
alias pyl=py3install
alias c=clear
alias ls='lsd --icon always --tree --depth 1'
alias ll='ls -la'


alias llg='ll | grep "$1"'
alias catg='cat | grep "$1"'
alias lld="ll | grep \"^\.\""
alias v='nvim'
alias va='nvim ~/.dotfiles/zsh/config/misc.zsh'
alias vz='nvim $ZDOTDIR/.zshrc'
alias vn='nvim $ZDOTDIR/nvim'
alias kan='killall -9 node'
alias ac='arduino-cli'
alias meteo="curl wttr.in/Buenos%20Aires"
alias xai="~/.local/bin/xai"
alias ge='gh copilot explain "$@"'
alias -- -='cd -'
alias yrun='yarn run $(cat package.json | jq ".scripts | keys[]" | fzf | tr -d "\"")'
alias yb='yarn build'

# vi git
function vg() {
  vim $(git ls-files --others --exclude-standard && git diff --name-only)
}

