" plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'machakann/vim-sandwich'																													" wrap words with a given character
Plug 'neoclide/coc.nvim', { 'branch': 'release' } 																		" coc nodejs host
Plug 'tjdevries/coc-zsh'																															" coc zsh support
Plug 'antoinemadec/coc-fzf'																														" coc fzf support
" Plug 'rakr/vim-one'																																		" colorscheme
Plug 'catppuccin/nvim', {'as': 'catppuccin'}                                          " colorscheme
Plug 'itchyny/lightline.vim'																													" statusline
Plug 'josa42/vim-lightline-coc'                   																		" coc statusline support
Plug 'tpope/vim-commentary'																														" comment text
Plug 'kdheepak/lazygit.nvim'																													" git console
Plug 'tpope/vim-fugitive'																															" git
Plug 'jremmen/vim-ripgrep'																														" ripgrep	(dependency)
" Plug 'junegunn/fzf'																																		" fuzzy finder (dependency)
" Plug 'junegunn/fzf.vim'                           																		" fuzzy finder
Plug 'pangloss/vim-javascript'                    																		" javascript support
Plug 'leafgarland/typescript-vim'																											" typescript support
Plug 'maxmellon/vim-jsx-pretty'																												" jsx support
Plug 'tpope/vim-vinegar'																															" simpler netrw
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' } " prettier
Plug 'wellle/targets.vim'																															" change words between delimiters
" Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}  																		" terminal
Plug 'voldikss/vim-floaterm'																													" floating terminal
Plug 'jiangmiao/auto-pairs'																														" auto close things
Plug 'nvim-lua/plenary.nvim'																													" (telescope dependenvy)
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }  														" telescope
Plug 'nvim-treesitter/nvim-treesitter'																								" telescope finder/review
Plug 'mfussenegger/nvim-dap'																													" dap
Plug 'rcarriga/nvim-dap-ui'																														" dap ui
Plug 'nvim-telescope/telescope-dap.nvim'																							" telescope dap
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }																		" go
" Plug 'norcalli/nvim-colorizer.lua'																									" highlight hex colors
call plug#end()

" configs
source ~/.dotfiles/nvim/coc-explorer.vim
source ~/.dotfiles/nvim/settings.vim
source ~/.dotfiles/nvim/coc.vim
source ~/.dotfiles/nvim/mappings.vim
source ~/.dotfiles/nvim/plugs.vim
source ~/.dotfiles/nvim/theme.vim
source ~/.dotfiles/nvim/lightline.vim
source ~/.dotfiles/nvim/prettier.vim
source ~/.dotfiles/nvim/prettier.vim
if filereadable('init.local.vim')
  source ~/.dotfiles/nvim/init.local.vim
endif
" source ~/.config/nvim/fzf.vim
