# found at https://thevaluable.dev/zsh-install-configure-mouseless/
# store config files at ~/.config
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export DOTFILES="$HOME/.dotfiles"

# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# rust
# TODO: make directory if it doesn't exist
#. "$HOME/.cargo/env"

# env
[ -f $XDG_CONFIG_HOME/.env ] && source $XDG_CONFIG_HOME/.env

## A xterm-256color based TERMINFO that adds the escape sequences for italic.
#
# Install:
# create xterm-256color-italic.terminfo file with the following content:
# xterm-256color-italic|xterm with 256 colors and italic,
# 	sitm=\E[3m, ritm=\E[23m,
# 	use=xterm-256color, italics
#
# compile file:
#   tic xterm-256color-italic.terminfo
#
# Usage:
#
#   export TERM=xterm-256color-italic
#
export TERM=xterm-256color-italic
