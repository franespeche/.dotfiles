local Plug = vim.fn['plug#']
local dataPath = vim.fn['stdpath']('data') .. '/plugged'

vim.call('plug#begin', dataPath)
Plug "neovim/nvim-lspconfig"                                                              -- lsp (also navic dependency)
Plug 'MunifTanjim/nui.nvim'                                                               -- [neotree] (dependency)
Plug 'nvim-neo-tree/neo-tree.nvim'                                                        -- [neotree] file explorer
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })                                     -- completion, lsp, ...
Plug 'tjdevries/coc-zsh'                                                                  -- coc zsh support
Plug 'antoinemadec/coc-fzf'                                                               -- coc fzf support
Plug 'mxw/vim-jsx'                                                                        -- jsx support
Plug 'maxmellon/vim-jsx-pretty'                                                           -- jsx support
Plug 'pangloss/vim-javascript'                                                            -- javascript support
Plug 'leafgarland/typescript-vim'                                                         -- typescript support
Plug 'HerringtonDarkholme/yats.vim'                                                       -- typescript highlighting (for better folding)
Plug 'vim-scripts/indentpython.vim'                                                       -- python
Plug 'jremmen/vim-ripgrep'                                                                -- ripgrep	(dependency)
Plug 'junegunn/fzf'                                                                       -- fuzzy finder (dependency)
Plug 'junegunn/fzf.vim'                                                                   -- fuzzy finder
Plug 'nvim-lualine/lualine.nvim'                                                          -- statusline
Plug('prettier/vim-prettier', { ['do'] = 'yarn install --frozen-lockfile --production' }) -- prettier
Plug 'wellle/targets.vim'                                                                 -- change words between delimiters
Plug 'machakann/vim-sandwich'                                                             -- wrap words with a given character
Plug 'kdheepak/lazygit.nvim'                                                              -- [git] lazygit
Plug 'lewis6991/gitsigns.nvim'                                                            -- [git] ui
Plug 'tpope/vim-fugitive'                                                                 -- [git] fugitive
Plug 'tpope/vim-rhubarb'                                                                  -- [git] fugitive's hub
Plug 'tpope/vim-commentary'                                                               -- comment text
Plug 'morhetz/gruvbox'                                                                    -- colorscheme
Plug 'EdenEast/nightfox.nvim'                                                             -- colorscheme
Plug 'rebelot/kanagawa.nvim'                                                              -- colorscheme
Plug 'catppuccin/nvim'                                                                    -- colorscheme
Plug 'nvim-lua/plenary.nvim'                                                              -- [telescope] (dependenvy)
Plug 'sharkdp/fd'                                                                         -- [telescope] (dependency)
Plug('nvim-telescope/telescope.nvim', { ['branch'] = 'release' })                         -- [telescope] chore
Plug 'nvim-telescope/telescope-file-browser.nvim'                                         -- [telescope] file browser
Plug 'nvim-treesitter/nvim-treesitter'                                                    -- [telescope] finder/preview
Plug 'lukas-reineke/indent-blankline.nvim'                                                -- indent lines
Plug 'nvim-tree/nvim-web-devicons'                                                        -- devicons
Plug 'liuchengxu/vista.vim'                                                               -- show symbols
Plug "SmiteshP/nvim-navic"                                                                -- breadcrumbs
Plug "kevinhwang91/promise-async"                                                         -- [folds] (dependency)
Plug 'vim-syntastic/syntastic'                                                            -- check !
Plug 'cameron-wags/rainbow_csv.nvim'                                                      -- easily read csv
Plug 'folke/trouble.nvim'                                                                 -- diagnostics
Plug 'm-demare/hlargs.nvim'                                                               -- highlight arguments
Plug 'brenoprata10/nvim-highlight-colors'                                                 -- highlight colors
Plug 'folke/neodev.nvim'                                                                  -- lua types (?)
Plug 'andrejlevkovitch/vim-lua-format'                                                    -- lua formatter (?)
vim.call('plug#end')

-- source
require 'config'
require 'plugins'
-- legacy
vim.cmd [[
  source ~/.dotfiles/nvim/keymaps.vim
]]

-- private
if (vim.fn.filereadable(vim.fn.expand('~/.dotfiles/nvim/init.local.vim')))
then
  vim.cmd 'source ~/.dotfiles/nvim/init.local.vim'
end
