# install cargo
# install pyenv
# install exa
# install neovim
# install lazygit
# install tldr
# install nodejs
# install npm
# install yarn
# install used font in terminal
# make symlink (or copy) .zshenv to ~
# sudo pacman -S cargo

# symlinks
# ln -s ~/.dotfiles/zsh/.zshenv ~
# ln -s ~/.dotfiles/tmux/.tmux.conf ~
# ln -sf ~/.dotfiles/alacritty.yml ~
# ln -sf ~/.dotfiles/zsh ~
# ln -sf ~/.dotfiles/nvim ~

# change default shell: chsh -s $(which zsh)
# may also need to comment out ~/.bashrc and exec zsh from there: $ exec zsh

# GIT ONCE

# https://spin.atomicobject.com/2020/05/05/git-configurations-default/
# git config --global pull.rebase true
# git config --global fetch.prune true
# git config --global diff.colorMoved zebra
# vim
# install vim-plug:
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' 
# install prettier globally to avoid bugs in neovim 
# npm install -g prettier

# Rust
# CocInstall coc-rust-analyzer
