vim.opt.shell = "/bin/zsh"

vim.g.dark_theme = "gruvbox-material"
vim.g.light_theme = "catppuccin"
vim.g.mapleader = ","
vim.g.debug_mode = falsea
vim.g.config_path = "/config.yaml"

vim.g["prettier#autoformat"] = 1 -- enable auto formatting of files that have "@format" or "@prettier" tag
vim.g["prettier#autoformat_require_pragma"] = 1 -- allow auto formatting for files without "@format" or "@prettier" tag
vim.g["prettier#autoformat_config_present"] = 1 -- toggle the g:prettier#autoformat setting based on whether a config file can be found in the current directory or any parent directory. Note that this will override the g:prettier#autoformat setting!

require("config.lazy")
require("config").setup()
require("helpers")
require("theme")

-- Source any private configs
local config_dir = vim.fn.stdpath("config")

local private_files = { "private.lua", "private.vim", "local.lua" }
for _, name in ipairs(private_files) do
  local path = config_dir .. "/" .. name
  if vim.fn.filereadable(path) == 1 then vim.cmd("source " .. path) end
end

function HighlightSelection()
  local ns = vim.api.nvim_create_namespace("PersistentHighlight")
  local _, srow, scol, _ = unpack(vim.fn.getpos("'<"))
  local _, erow, ecol, _ = unpack(vim.fn.getpos("'>"))

  vim.api.nvim_buf_add_highlight(0, ns, "PastelGreen", srow - 1, scol - 1, ecol)
end

vim.api.nvim_set_hl(0, "PastelGreen", { bg = "#77dd77", bold = true })
vim.api.nvim_create_user_command("Highlight", HighlightSelection, {})

-- fire DebugModeEnable event
-- if vim.g.debug_mode then vim.api.nvim_exec_autocmds("User", {
-- pattern = "DebugModeEnable",
-- }) end
