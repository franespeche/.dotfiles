local Plug = vim.fn["plug#"]
local dataPath = vim.fn["stdpath"]("data") .. "/plugged"

vim.call("plug#begin", dataPath)
Plug "MunifTanjim/nui.nvim"        -- [neotree] (dependency)
Plug "nvim-neo-tree/neo-tree.nvim" -- [neotree] file explorer
Plug("neoclide/coc.nvim", {
  ["branch"] = "release",
})                                         -- completion, lsp, ...
Plug "tjdevries/coc-zsh"                   -- coc zsh support
Plug "antoinemadec/coc-fzf"                -- coc fzf support
Plug "mxw/vim-jsx"                         -- jsx support
Plug "maxmellon/vim-jsx-pretty"            -- jsx support
Plug "pangloss/vim-javascript"             -- javascript support
Plug "leafgarland/typescript-vim"          -- typescript support
Plug "HerringtonDarkholme/yats.vim"        -- typescript highlighting (for better folding)
Plug "vim-scripts/indentpython.vim"        -- python
Plug "jremmen/vim-ripgrep"                 -- ripgrep	(dependency)
Plug "junegunn/fzf"                        -- fuzzy finder (dependency)
Plug "junegunn/fzf.vim"                    -- fuzzy finder
Plug "nvim-lualine/lualine.nvim"           -- statusline
Plug "wellle/targets.vim"                  -- change words between delimiters
Plug "machakann/vim-sandwich"              -- wrap words with a given character
Plug "kdheepak/lazygit.nvim"               -- [git] lazygit
Plug "lewis6991/gitsigns.nvim"             -- [git] ui
Plug "tpope/vim-fugitive"                  -- [git] fugitive
Plug "tpope/vim-rhubarb"                   -- [git] fugitive's hub
Plug "tpope/vim-scriptease"                -- vim debugging tools
Plug "tpope/vim-commentary"                -- comment text
Plug "morhetz/gruvbox"                     -- colorscheme
Plug "sainnhe/gruvbox-material"            -- colorscheme
Plug "EdenEast/nightfox.nvim"              -- colorscheme
Plug "rebelot/kanagawa.nvim"               -- colorscheme
Plug "catppuccin/nvim"                     -- colorscheme
Plug "nvim-lua/plenary.nvim"               -- [telescope] (dependenvy)
Plug "sharkdp/fd"                          -- [telescope] (dependency)
Plug "nvim-telescope/telescope.nvim"       -- [telescope] chore
Plug "hedyhli/outline.nvim"
Plug "nvim-treesitter/nvim-treesitter"     -- [telescope] finder/preview
Plug "lukas-reineke/indent-blankline.nvim" -- indent lines
Plug "nvim-tree/nvim-web-devicons"         -- devicons
Plug "liuchengxu/vista.vim"                -- show symbols
Plug "neovim/nvim-lspconfig"               -- lsp (also navic dependency)
Plug "SmiteshP/nvim-navic"                 -- breadcrumbs
Plug "kevinhwang91/promise-async"          -- [folds] (dependency)
Plug "vim-syntastic/syntastic"             -- check !
Plug "cameron-wags/rainbow_csv.nvim"       -- easily read csv
Plug "m-demare/hlargs.nvim"                -- highlight arguments
Plug "brenoprata10/nvim-highlight-colors"  -- highlight colors
Plug "andrejlevkovitch/vim-lua-format"     -- lua formatter (?)
Plug "rrethy/vim-illuminate"               -- highlight symbol under cursor
Plug "echasnovski/mini.jump"               -- used for the "f" repeated functionality
Plug "ThePrimeagen/harpoon"                -- anchor files for quick access
Plug "shellRaining/hlchunk.nvim"           -- highlight chunks
Plug "karb94/neoscroll.nvim"               -- scroll smoothly
Plug "vimwiki/vimwiki/"                    -- vim wiki
Plug "christoomey/vim-tmux-navigator"      -- support tmux
Plug "milisims/nvim-luaref"
Plug "folke/lua-dev.nvim"
Plug "rafcamlet/nvim-luapad"
Plug "metakirby5/codi.vim"
Plug "hashivim/vim-terraform"

-- Avante
-- Deps
Plug "stevearc/dressing.nvim"

-- Optional deps
Plug "hrsh7th/nvim-cmp"
Plug "HakonHarnes/img-clip.nvim"
Plug "zbirenbaum/copilot.lua"

Plug("yetone/avante.nvim", {
  ["branch"] = "main",
  ["do"] = "make",
})

Plug("franespeche/strawberry", {
  branch = "main",
})

-- Development
Plug "folke/neodev.nvim" -- lua types (?)
vim.call("plug#end")
