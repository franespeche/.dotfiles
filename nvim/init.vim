" plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'machakann/vim-sandwich'                                                           " wrap words with a given character
Plug 'neoclide/coc.nvim', { 'branch': 'release' }                                       " coc nodejs host
" Plug 'prabirshrestha/vim-lsp'                                                           " lsp
Plug 'tjdevries/coc-zsh'                                                                " coc zsh support
Plug 'antoinemadec/coc-fzf'                                                             " coc fzf support
Plug 'josa42/vim-lightline-coc'                                                         " coc statusline support
Plug 'itchyny/lightline.vim'                                                            " statusline
Plug 'tpope/vim-commentary'                                                             " comment text
Plug 'kdheepak/lazygit.nvim'                                                            " [git] lazygit
Plug 'tpope/vim-fugitive'                                                               " [git] fugitive
Plug 'tpope/vim-rhubarb'                                                                " [git] fugitive's hub
Plug 'rhysd/git-messenger.vim'                                                          " [git] pop-up git blame
Plug 'jremmen/vim-ripgrep'                                                              " ripgrep	(dependency)
Plug 'morhetz/gruvbox'                                                                  " colorscheme
Plug 'EdenEast/nightfox.nvim'                                                           " colorscheme (used in light mode)
Plug 'junegunn/fzf'                                                                     " fuzzy finder (dependency)
Plug 'junegunn/fzf.vim'                                                                 " fuzzy finder
Plug 'pangloss/vim-javascript'                                                          " javascript support
Plug 'leafgarland/typescript-vim'                                                       " typescript support
Plug 'HerringtonDarkholme/yats.vim'                                                     " typescript highlighting (for better folding)
Plug 'mxw/vim-jsx'                                                                      " jsx support
Plug 'maxmellon/vim-jsx-pretty'                                                         " jsx support
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }   " prettier
Plug 'wellle/targets.vim'                                                               " change words between delimiters
Plug 'nvim-lua/plenary.nvim'                                                            " [telescope] (dependenvy)
Plug 'sharkdp/fd'                                                                       " [telescope] (dependency)
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }  												  		" [telescope] chore
Plug 'nvim-telescope/telescope-file-browser.nvim'                                       " [telescope] file browser
Plug 'nvim-treesitter/nvim-treesitter'                                                  " [telescope] finder/preview
Plug 'lukas-reineke/indent-blankline.nvim'                                              " indent lines
Plug 'mfussenegger/nvim-dap'                                                            " dap
Plug 'mxsdev/nvim-dap-vscode-js'                                                        " vscode js dap
Plug 'sudar/vim-arduino-syntax'                                                         " arduino
Plug 'nvim-tree/nvim-web-devicons'                                                      " devicons
Plug 'MunifTanjim/nui.nvim'                                                             " [neotree] (dependency)
Plug 'nvim-neo-tree/neo-tree.nvim'                                                      " [neotree] file explorer
Plug 'liuchengxu/vista.vim'                                                             " show symbols

" Plug 'github/copilot.vim'                                                               " copilot
" Plug 'nvim-neorg/neorg'                                                                 " notes
" Plug 'sindrets/diffview.nvim'                                                           " diff view
" Plug 'tpope/vim-vinegar'                                                                " simpler netrw
" Plug 'SirVer/ultisnips'                                                               " track snippets engine
" Plug 'voldikss/vim-floaterm'																													" floating terminal
" Plug 'ryanoasis/vim-devicons'                                                         " devicons
" Plug 'jiangmiao/auto-pairs'																														" auto close things
" Plug 'catppuccin/nvim', {'as': 'catppuccin'}                                          " colorscheme
" Plug 'terryma/vim-multiple-cursors'                                                   " multiple cursors
" Plug 'rcarriga/nvim-dap-ui'																														" dap ui
" Plug 'nvim-telescope/telescope-dap.nvim'																							" telescope dap
" Plug 'norcalli/nvim-colorizer.lua'																									  " highlight hex colors
" Plug 'chrisbra/csv.vim'                                                               " csv support
" Plug 'honza/vim-snippets'                                                             " adding this because snippets are separated from the engine 
" Plug 'numToStr/Comment.nvim'																												  " comment text
call plug#end()



" source configs
source ~/.dotfiles/nvim/settings.vim
source ~/.dotfiles/nvim/coc.vim
source ~/.dotfiles/nvim/neotree.vim
source ~/.dotfiles/nvim/dap.vim
source ~/.dotfiles/nvim/keymaps.vim
source ~/.dotfiles/nvim/git.vim
source ~/.dotfiles/nvim/theme.vim
source ~/.dotfiles/nvim/lightline.vim
source ~/.dotfiles/nvim/prettier.vim
source ~/.dotfiles/nvim/telescope.vim
" source ~/.dotfiles/nvim/ultisnips.vim
source ~/.dotfiles/nvim/temp.vim
if filereadable(expand('~/.dotfiles/nvim/init.local.vim'))
  source ~/.dotfiles/nvim/init.local.vim
endif
