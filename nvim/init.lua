local Plug = vim.fn['plug#']
local dataPath = vim.fn['stdpath']('data') .. '/plugged'

vim.call('plug#begin', dataPath)
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })                                     -- coc nodejs host
Plug 'tjdevries/coc-zsh'                                                                  -- coc zsh support
Plug 'antoinemadec/coc-fzf'                                                               -- coc fzf support
Plug 'josa42/vim-lightline-coc'                                                           -- coc statusline support
Plug 'itchyny/lightline.vim'                                                              -- statusline
Plug 'tpope/vim-commentary'                                                               -- comment text
Plug 'kdheepak/lazygit.nvim'                                                              -- [git] lazygit
Plug 'tpope/vim-fugitive'                                                                 -- [git] fugitive
Plug 'tpope/vim-rhubarb'                                                                  -- [git] fugitive's hub
Plug 'rhysd/git-messenger.vim'                                                            -- [git] pop-up git blame
Plug 'jremmen/vim-ripgrep'                                                                -- ripgrep	(dependency)
Plug 'morhetz/gruvbox'                                                                    -- colorscheme
Plug 'EdenEast/nightfox.nvim'                                                             -- colorscheme (used in light mode)
Plug 'junegunn/fzf'                                                                       -- fuzzy finder (dependency)
Plug 'junegunn/fzf.vim'                                                                   -- fuzzy finder
Plug 'pangloss/vim-javascript'                                                            -- javascript support
Plug 'leafgarland/typescript-vim'                                                         -- typescript support
Plug 'HerringtonDarkholme/yats.vim'                                                       -- typescript highlighting (for better folding)
Plug 'mxw/vim-jsx'                                                                        -- jsx support
Plug 'maxmellon/vim-jsx-pretty'                                                           -- jsx support
Plug('prettier/vim-prettier', { ['do'] = 'yarn install --frozen-lockfile --production' }) -- prettier
Plug 'wellle/targets.vim'                                                                 -- change words between delimiters
Plug 'machakann/vim-sandwich'                                                             -- wrap words with a given character
Plug 'nvim-lua/plenary.nvim'                                                              -- [telescope] (dependenvy)
Plug 'sharkdp/fd'                                                                         -- [telescope] (dependency)
Plug('nvim-telescope/telescope.nvim')                                                     -- [telescope] chore
Plug 'nvim-telescope/telescope-file-browser.nvim'                                         -- [telescope] file browser
Plug 'nvim-treesitter/nvim-treesitter'                                                    -- [telescope] finder/preview
Plug 'lukas-reineke/indent-blankline.nvim'                                                -- indent lines
Plug 'nvim-tree/nvim-web-devicons'                                                        -- devicons
Plug 'MunifTanjim/nui.nvim'                                                               -- [neotree] (dependency)
Plug 'nvim-neo-tree/neo-tree.nvim'                                                        -- [neotree] file explorer
Plug 'liuchengxu/vista.vim'                                                               -- show symbols
Plug 'rust-lang/rust.vim'                                                                 -- rust
Plug "neovim/nvim-lspconfig"                                                              -- navic dependency
Plug "SmiteshP/nvim-navic"                                                                -- breadcrumbs
Plug "kevinhwang91/nvim-ufo"                                                              -- folds
Plug "kevinhwang91/promise-async"                                                         -- [folds] (dependency)
Plug 'vim-scripts/indentpython.vim'                                                       -- python
Plug 'vim-syntastic/syntastic'
-- Plug 'mfussenegger/nvim-dap'                                                              -- dap
-- Plug 'mxsdev/nvim-dap-vscode-js'                                                          -- vscode js dap

vim.call('plug#end')

require('config.settings')
require('navic')
require('ufo')
-- source configs
vim.cmd [[
  source ~/.dotfiles/nvim/coc.vim
  source ~/.dotfiles/nvim/neotree.vim
  source ~/.dotfiles/nvim/keymaps.vim
  source ~/.dotfiles/nvim/git.vim
  source ~/.dotfiles/nvim/theme.vim
  source ~/.dotfiles/nvim/lightline.vim
  source ~/.dotfiles/nvim/prettier.vim
  source ~/.dotfiles/nvim/telescope.vim
  source ~/.dotfiles/nvim/temp.vim
]]

-- private files
if (vim.fn.filereadable(vim.fn.expand('~/.dotfiles/nvim/init.local.vim')))
then
  vim.cmd 'source ~/.dotfiles/nvim/init.local.vim'
end
