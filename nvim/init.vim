" plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'machakann/vim-sandwich'											" wrap words with specified character
Plug 'rakr/vim-one'
Plug 'tpope/vim-commentary'												" comment text
Plug 'kdheepak/lazygit.nvim'											" git console
Plug 'danro/rename.vim'														" :rename[!] {newname}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'											" statusline
Plug 'josa42/vim-lightline-coc'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'antoinemadec/coc-fzf'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jremmen/vim-ripgrep'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'tjdevries/coc-zsh'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-vinegar'
Plug 'chiel92/vim-autoformat'
Plug 'wellle/targets.vim'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}" terminal
" Plug 'stefandtw/quickfix-reflector.vim'
call plug#end()

" configs
source ~/.config/nvim/coc-explorer.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/scale.vim
source ~/.config/nvim/plugs.vim
source ~/.config/nvim/theme.vim
source ~/.config/nvim/lightline.vim
source ~/.config/nvim/fzf.vim
