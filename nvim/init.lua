local Plug = vim.fn["plug#"]
local dataPath = vim.fn["stdpath"]("data") .. "/plugged"

-- LuaFormatter off
vim.call('plug#begin', dataPath)
Plug 'MunifTanjim/nui.nvim'                           -- [neotree] (dependency)
Plug 'nvim-neo-tree/neo-tree.nvim'                    -- [neotree] file explorer
Plug('neoclide/coc.nvim', { ['branch'] = 'release' }) -- completion, lsp, ...
Plug 'tjdevries/coc-zsh'                              -- coc zsh support
Plug 'antoinemadec/coc-fzf'                           -- coc fzf support
Plug 'mxw/vim-jsx'                                    -- jsx support
Plug 'maxmellon/vim-jsx-pretty'                       -- jsx support
Plug 'pangloss/vim-javascript'                        -- javascript support
Plug 'leafgarland/typescript-vim'                     -- typescript support
Plug 'HerringtonDarkholme/yats.vim'                   -- typescript highlighting (for better folding)
Plug 'vim-scripts/indentpython.vim'                   -- python
Plug 'jremmen/vim-ripgrep'                            -- ripgrep	(dependency)
Plug 'junegunn/fzf'                                   -- fuzzy finder (dependency)
Plug 'junegunn/fzf.vim'                               -- fuzzy finder
Plug 'nvim-lualine/lualine.nvim'                      -- statusline
Plug 'wellle/targets.vim'                             -- change words between delimiters
Plug 'machakann/vim-sandwich'                         -- wrap words with a given character
Plug 'kdheepak/lazygit.nvim'                          -- [git] lazygit
Plug 'lewis6991/gitsigns.nvim'                        -- [git] ui
Plug 'tpope/vim-fugitive'                             -- [git] fugitive
Plug 'tpope/vim-rhubarb'                              -- [git] fugitive's hub
Plug 'tpope/vim-scriptease'                           -- vim debugging tools
Plug 'tpope/vim-commentary'                           -- comment text
Plug 'morhetz/gruvbox'                                -- colorscheme
Plug 'sainnhe/gruvbox-material'                       -- colorscheme
Plug 'EdenEast/nightfox.nvim'                         -- colorscheme
Plug 'rebelot/kanagawa.nvim'                          -- colorscheme
Plug 'catppuccin/nvim'                                -- colorscheme
Plug 'nvim-lua/plenary.nvim'                          -- [telescope] (dependenvy)
Plug 'sharkdp/fd'                                     -- [telescope] (dependency)
Plug 'nvim-telescope/telescope.nvim'                  -- [telescope] chore
-- Plug 'nvim-telescope/telescope-file-browser.nvim'                                         -- [telescope] file browser
Plug 'hedyhli/outline.nvim'
Plug 'nvim-treesitter/nvim-treesitter'     -- [telescope] finder/preview
Plug 'lukas-reineke/indent-blankline.nvim' -- indent lines
-- Plug 'ryanoasis/vim-devicons'                                                        -- devicons
Plug 'nvim-tree/nvim-web-devicons'         -- devicons
Plug 'liuchengxu/vista.vim'                -- show symbols
Plug "neovim/nvim-lspconfig"               -- lsp (also navic dependency)
Plug "SmiteshP/nvim-navic"                 -- breadcrumbs
Plug "kevinhwang91/promise-async"          -- [folds] (dependency)
Plug 'vim-syntastic/syntastic'             -- check !
Plug 'cameron-wags/rainbow_csv.nvim'       -- easily read csv
Plug 'm-demare/hlargs.nvim'                -- highlight arguments
Plug 'brenoprata10/nvim-highlight-colors'  -- highlight colors
Plug 'andrejlevkovitch/vim-lua-format'     -- lua formatter (?)
Plug 'milisims/nvim-luaref'
Plug 'MunifTanjim/nui.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'folke/lua-dev.nvim'
Plug 'rafcamlet/nvim-luapad'
Plug 'hashivim/vim-terraform'
Plug 'rrethy/vim-illuminate'     -- highlight symbol under cursor
Plug 'echasnovski/mini.jump'     -- used for the "f" repeated functionality
Plug 'ThePrimeagen/harpoon'      -- anchor files for quick access
Plug 'shellRaining/hlchunk.nvim' -- highlight chunks
Plug 'karb94/neoscroll.nvim'     -- highlight chunks
Plug 'vimwiki/vimwiki/'          -- vim wiki

-- Avante
-- Deps
Plug 'stevearc/dressing.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'

-- Optional deps
Plug 'hrsh7th/nvim-cmp'
-- Plug 'nvim-tree/nvim-web-devicons' "or Plug 'echasnovski/mini.icons'
Plug 'HakonHarnes/img-clip.nvim'
Plug 'zbirenbaum/copilot.lua'
Plug 'metakirby5/codi.vim'

-- Yay, pass source=true if you want to build from source
Plug('yetone/avante.nvim', { ['branch'] = 'main', ['do'] = 'make' })
vim.api.nvim_create_autocmd("User", {
  pattern = "avante.nvim",
  callback = function ()
    -- Your Lua code here
  end,
})
-- Local Plugins
Plug('franespeche/strawberry', { ['branch'] = 'main' })

if (vim.fn.isdirectory(vim.fn.expand('~/teleport.nvim/')) == 1) then
  Plug '~/teleport.nvim'
else
  Plug('franespeche/teleport.nvim', { ['branch'] = 'main' })
end

-- Development
Plug 'folke/neodev.nvim' -- lua types (?)
-- Plug 'hrsh7th/cmp-nvim-lsp' -- completions
-- Plug 'hrsh7th/cmp-buffer' -- completions
-- Plug 'hrsh7th/cmp-path' -- completions
-- Plug 'hrsh7th/cmp-cmdline' -- completions
-- Plug 'hrsh7th/nvim-cmp' -- completions
-- Plug 'hrsh7th/cmp-vsnip'
-- Plug 'hrsh7th/vim-vsnip'
-- Plug('L3MON4D3/LuaSnip', {['tag'] = 'v2.*', ['do'] = 'make install_jsregexp'}) -- snipets
-- Plug 'saadparwaiz1/cmp_luasnip' -- snipets completions
-- Plug 'puremourning/vimspector'                                                            -- vim debugger
vim.call('plug#end')
-- LuaFormatter on

-- source
require 'config'
require 'plugins'
-- private
if (vim.fn.filereadable(vim.fn.expand('~/.dotfiles/nvim/private.lua')) == 1) then
  vim.cmd 'source ~/.dotfiles/nvim/private.lua'
end
if (vim.fn.filereadable(vim.fn.expand('~/.dotfiles/nvim/private.vim')) == 1) then
  vim.cmd 'source ~/.dotfiles/nvim/private.vim'
end
if (vim.fn.filereadable(vim.fn.expand("~/.dotfiles/nvim/init.local.vim")) == 1) then
  vim.cmd "source ~/.dotfiles/nvim/init.local.vim"
end
