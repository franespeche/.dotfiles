# found at https://thevaluable.dev/zsh-install-configure-mouseless/
# store config files at ~/.config
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"


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
. "$HOME/.cargo/env"

# env
[ -f $XDG_CONFIG_HOME/.env ] && source $XDG_CONFIG_HOME/.env
