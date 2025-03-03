vim.g.mapleader = ","
vim.g.debug_mode = false
vim.g.config_path = '/config.yaml'

require 'config.lazy'
require'plugins'.setup()
require'config'.setup()
require 'helpers'

-- Source any private configs
local config_dir = vim.fn.stdpath("config")
local filenames = {"private.lua", "private.vim", "local.lua"}

for _, name in ipairs(filenames) do
    local path = config_dir .. "/" .. name
    if vim.fn.filereadable(path) == 1 then vim.cmd("source " .. path) end
end
