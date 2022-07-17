" plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'machakann/vim-sandwich' " wrap words with a given character
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " coc nodejs host
Plug 'tjdevries/coc-zsh' " coc zsh support
Plug 'antoinemadec/coc-fzf' " coc fzf support
Plug 'rakr/vim-one' " colorscheme
Plug 'itchyny/lightline.vim' " statusline
Plug 'josa42/vim-lightline-coc' " coc statusline support
Plug 'tpope/vim-commentary' " comment text
Plug 'kdheepak/lazygit.nvim' " git console
Plug 'jremmen/vim-ripgrep' " ripgrep	(dependency)
Plug 'junegunn/fzf' " fuzzy finder (dependency)
Plug 'junegunn/fzf.vim' " fuzzy finder
Plug 'pangloss/vim-javascript' " javascript support
Plug 'leafgarland/typescript-vim' " typescript support
Plug 'maxmellon/vim-jsx-pretty' " jsx support
Plug 'tpope/vim-vinegar' " simpler netrw
Plug 'chiel92/vim-autoformat' " format text
Plug 'wellle/targets.vim' " change words between delimiters
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}  " terminal
Plug 'voldikss/vim-floaterm'
" Plug 'stefandtw/quickfix-reflector.vim'
" Plug 'danro/rename.vim' " :rename[!] {newname}
" Plug 'tpope/vim-fugitive'
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
