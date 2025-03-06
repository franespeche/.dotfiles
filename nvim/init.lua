vim.g.mapleader = ","
vim.g.debug_mode = false
vim.g.config_path = "/config.yaml"

-- TODO: move this somewhere else (is this needed btw?)
vim.g["prettier#autoformat"] = 1 -- enable auto formatting of files that have "@format" or "@prettier" tag
vim.g["prettier#autoformat_require_pragma"] = 1 -- allow auto formatting for files without "@format" or "@prettier" tag
vim.g["prettier#autoformat_config_present"] = 1 -- toggle the g:prettier#autoformat setting based on whether a config file can be found in the current directory or any parent directory. Note that this will override the g:prettier#autoformat setting!

require("config.lazy")
require("config").setup()
require("helpers")

-- Source any private configs
local config_dir = vim.fn.stdpath("config")

local private_files = { "private.lua", "private.vim", "local.lua" }
for _, name in ipairs(private_files) do
  local path = config_dir .. "/" .. name
  if vim.fn.filereadable(path) == 1 then
    vim.cmd("source " .. path)
  end
end
