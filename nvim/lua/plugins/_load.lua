local Plug = vim.fn["plug#"]
local dataPath = vim.fn["stdpath"]("data") .. "/plugged"

vim.call("plug#begin", dataPath)
Plug("neoclide/coc.nvim", {
  ["branch"] = "release",
 }) -- completion, lsp, ...
Plug "tjdevries/coc-zsh" -- coc zsh support
Plug "antoinemadec/coc-fzf" -- coc fzf support
Plug "mxw/vim-jsx" -- jsx support
Plug "maxmellon/vim-jsx-pretty" -- jsx support
Plug "pangloss/vim-javascript" -- javascript support
Plug "leafgarland/typescript-vim" -- typescript support
Plug "HerringtonDarkholme/yats.vim" -- typescript highlighting (for better folding)
Plug "vim-scripts/indentpython.vim" -- python
Plug "jremmen/vim-ripgrep" -- ripgrep	(dependency)
Plug "junegunn/fzf" -- fuzzy finder (dependency)
Plug "junegunn/fzf.vim" -- fuzzy finder
Plug "wellle/targets.vim" -- change words between delimiters
Plug "machakann/vim-sandwich" -- wrap words with a given character
Plug "kdheepak/lazygit.nvim" -- [git] lazygit
Plug "tpope/vim-fugitive" -- [git] fugitive
Plug "tpope/vim-rhubarb" -- [git] fugitive's hub
Plug "tpope/vim-scriptease" -- vim debugging tools
Plug "tpope/vim-commentary" -- comment text
Plug "lukas-reineke/indent-blankline.nvim" -- indent lines
Plug "neovim/nvim-lspconfig" -- lsp (also navic dependency)
Plug "vim-syntastic/syntastic" -- check !
Plug "echasnovski/mini.jump" -- used for the "f" repeated functionality
Plug "ThePrimeagen/harpoon" -- anchor files for quick access
Plug "karb94/neoscroll.nvim" -- scroll smoothly
Plug "vimwiki/vimwiki/" -- vim wiki
Plug "christoomey/vim-tmux-navigator" -- support tmux
Plug "milisims/nvim-luaref"
Plug "folke/lua-dev.nvim"
Plug "rafcamlet/nvim-luapad"

-- Development
Plug "folke/neodev.nvim" -- lua types (?)
vim.call("plug#end")
