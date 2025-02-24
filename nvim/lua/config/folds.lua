require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript" },
  highlight = { enable = true },
  indent = { enable = true },
  fold = { enable = true },
}
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false -- Start with folds open
vim.opt.foldlevel = 99     -- Prevent auto-folding everything
