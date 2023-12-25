local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
'neoclide/coc.nvim', { ['branch'] = 'release' },                                   -- coc nodejs host
 'tjdevries/coc-zsh',                                                                -- coc zsh support
 'antoinemadec/coc-fzf',                                                             -- coc fzf support
 'josa42/vim-lightline-coc',                                                         -- coc statusline support
 'itchyny/lightline.vim',                                                            -- statusline
 'tpope/vim-commentary',                                                             -- comment text
 'kdheepak/lazygit.nvim',                                                            -- [git] lazygit
 'tpope/vim-fugitive',                                                               -- [git] fugitive
 'tpope/vim-rhubarb',                                                                -- [git] fugitive's hub
 'rhysd/git-messenger.vim',                                                          -- [git] pop-up git blame
 'jremmen/vim-ripgrep',                                                              -- ripgrep	(dependency)
 'morhetz/gruvbox',                                                                  -- colorscheme
 'EdenEast/nightfox.nvim',                                                           -- colorscheme (used in light mode)
 'junegunn/fzf',                                                                     -- fuzzy finder (dependency)
 'junegunn/fzf.vim',                                                                 -- fuzzy finder
 'pangloss/vim-javascript',                                                          -- javascript support
 'leafgarland/typescript-vim',                                                       -- typescript support
 'HerringtonDarkholme/yats.vim',                                                     -- typescript highlighting (for better folding)
 'mxw/vim-jsx',                                                                      -- jsx support
 'maxmellon/vim-jsx-pretty',                                                         -- jsx support
'prettier/vim-prettier', { ['do']= 'yarn install --frozen-lockfile --production' },
 'wellle/targets.vim',                                                               -- change words between delimiters
 'machakann/vim-sandwich',                                                           -- wrap words with a given character
 'nvim-lua/plenary.nvim',                                                            -- [telescope] (dependenvy)
 'sharkdp/fd',                                                                       -- [telescope] (dependency)
'nvim-telescope/telescope.nvim', { ['tag']= '0.1.0' },  												  		-- [telescope] chore
 'nvim-telescope/telescope-file-browser.nvim',                                       -- [telescope] file browser
 'nvim-treesitter/nvim-treesitter',                                                  -- [telescope] finder/preview
 'lukas-reineke/indent-blankline.nvim',                                              -- indent lines
 'mfussenegger/nvim-dap',                                                            -- dap
 'mxsdev/nvim-dap-vscode-js',                                                        -- vscode js dap
 'nvim-tree/nvim-web-devicons',                                                      -- devicons
 'MunifTanjim/nui.nvim',                                                             -- [neotree] (dependency)
 'nvim-neo-tree/neo-tree.nvim',                                                      -- [neotree] file explorer
 'liuchengxu/vista.vim',                                                             -- show symbols
})

