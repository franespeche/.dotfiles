vim.g.mapleader = ","
vim.g.debug_mode = false

require 'plugins'.setup()
require 'config'.setup()

-- Source any private configs
local config_dir = vim.fn.stdpath("config")
local filenames = { "private.lua", "private.vim", "local.lua" }

for _, name in ipairs(filenames) do
  local path = config_dir .. "/" .. name
  if vim.fn.filereadable(path) == 1 then vim.cmd("source " .. path) end
end
