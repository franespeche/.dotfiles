local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup

aug('VimFiles', { clear = true })

-- disable autocommenting
au('BufEnter', {
  desc = "disables autocommenting",
  command = 'set fp-=c fo-=r fo-=o'
})

local vim = vim
local opt = vim.opt
opt.autoread = true                      -- read files upon being changed from outside vim

vim.wo.wrap = false                          -- no line wrapping

-- Commands
vim.cmd [[
  syntax enable
]]
