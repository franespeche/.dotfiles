# install cargo
# install pyenv
# install exa
# install neovim
# install lazygit
# make symlink (or copy) .zshenv to ~
# sudo pacman -S cargo
# ln -s ~/.dotfiles/zsh/.zshenv ~
# creates symlinks
# TODO: make these dynamic

ln -sf alacritty.yml $XDG_CONFIG_HOME/alacritty.yml &&
echo "created symlink: alacritty.yml"

ln -sf zsh $XDG_CONFIG_HOME/zsh &&
echo "created symlink: zsh/"

ln -sf nvim $XDG_CONFIG_HOME/nvim &&
echo "created symlink: nvim/"


# GIT ONCE

# https://spin.atomicobject.com/2020/05/05/git-configurations-default/
# git config --global pull.rebase true
# git config --global fetch.prune true
# git config --global diff.colorMoved zebra
