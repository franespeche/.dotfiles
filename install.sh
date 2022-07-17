# creates symlinks
# TODO: make these dynamic

ln -sf alacritty.yml $XDG_CONFIG_HOME/alacritty.yml &&
echo "created symlink: alacritty.yml"

ln -sf zsh $XDG_CONFIG_HOME/zsh &&
echo "created symlink: zsh/"

ln -sf nvim $XDG_CONFIG_HOME/nvim &&
echo "created symlink: nvim/"
