call plug#begin(stdpath('data') . '/plugged')
Plug 'machakann/vim-sandwich'
Plug 'rakr/vim-one'
Plug 'tpope/vim-commentary'
Plug 'kdheepak/lazygit.nvim'
Plug 'danro/rename.vim'			" :rename[!] {newname}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'antoinemadec/coc-fzf'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jremmen/vim-ripgrep'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

" NERDTree
" Plug 'preservim/nerdtree'
" Plug 'ryanoasis/vim-devicons'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Plug 'mattn/vim-gist'

Plug 'tpope/vim-vinegar'
Plug 'chiel92/vim-autoformat'
Plug 'wellle/targets.vim'


" Plug 'stefandtw/quickfix-reflector.vim'

" Scala
" Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}
" Plug 'gre/play2vim'

" Rust
" Plug 'rust-lang/rust.vim'
call plug#end()


" source ~/.config/nvim/diff.vim
source ~/.config/nvim/settings.vim
" source ~/.config/nvim/NERDTree.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugs.vim
source ~/.config/nvim/theme.vim
source ~/.config/nvim/lightline.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/coc-explorer.vim
" source ~/.config/nvim/project.vim
"source ~/.config/nvim/.vim

