local config = require("config")
local utils = require("config.utils")

local color_scheme = "gruvbox-material"

-- avoid syntax inconsistencies
if vim.g.syntax_on == nil then
  vim.cmd("syntax on")
  vim.g.syntax_on = 1
end

-- dark/light themes
if vim.g.colors_name == nil then
  local dark_mode = config.get("dark_mode")
  if dark_mode == "system" then dark_mode = utils.is_dark_mode() end

  if dark_mode then
    vim.cmd("silent! colorscheme " .. vim.g.dark_theme)
    vim.cmd("silent! set background=dark")
    if (color_scheme == "gruvbox") then
      local yellow = "#fabd2f"
      vim.cmd(
          "highlight Search cterm=None ctermfg=214 ctermbg=235 gui=None guifg=#1d2021 guibg="
              .. yellow)
    end
  else
    vim.cmd("silent! colorscheme " .. vim.g.light_theme)
    vim.g.gruvbox_contrast_light = "soft"
    vim.cmd("silent! set background=light")
  end
end

if not vim.o.termguicolors then vim.o.termguicolors = true end

-- italic comments
vim.g.one_allow_italics = 1
local hl_comment = vim.api.nvim_get_hl(0, {
  id = vim.api.nvim_get_hl_id_by_name("Comment"),
 })
vim.api.nvim_set_hl(0, "Comment", {
  italic = true,
  ctermfg = hl_comment.ctermfg,
  fg = hl_comment.fg,
 })

--[[
-- used in nerd-tree
vim.cmd("highlight Directory guifg=#549699")
vim.cmd("syntax match fbCollections /collection/")
vim.cmd("highlight fbCollections guifg=#E9BD15")
vim.cmd("syntax match fbSubCollections /sub-collection/")
vim.cmd("highlight fbSubCollections guifg=#E9BD15")
vim.cmd("syntax match fbDocuments /document/")
vim.cmd("highlight fbDocuments guifg=#FA8072")

vim.cmd("highlight CursorLineNr guifg=#FFFFFF")
]] -- 
