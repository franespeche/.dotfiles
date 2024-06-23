-- system locals
local vim = vim
local g = vim.g
local o = vim.o
local cmd = vim.cmd

-- globals
local color_scheme = "gruvbox-material"

if g.dark_theme == nil then g.dark_theme = color_scheme end
if g.light_theme == nil then g.light_theme = "dawnfox" end

-- avoid syntax inconsistencies
if g.syntax_on == nil then
  cmd("syntax on")
  g.syntax_on = 1
end

-- dark/light themes
if g.colors_name == nil then
  if g.is_dark_mode then
    cmd("silent! colorscheme " .. g.dark_theme)
    -- cmd("silent! set background=dark")
    if (color_scheme == "gruvbox") then
      local yellow = "#fabd2f"
      cmd("highlight Search cterm=None ctermfg=214 ctermbg=235 gui=None guifg=#1d2021 guibg=" .. yellow)
    end
  else
    cmd("silent! colorscheme " .. g.light_theme)
    g.gruvbox_contrast_light = "soft"
    cmd("silent! set background=light")
  end
end

if not o.termguicolors then o.termguicolors = true end

-- force italic comments
g.one_allow_italics = 1
local hl_comment = vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Comment") })
vim.api.nvim_set_hl(0, "Comment", { italic = true, ctermfg = hl_comment.ctermfg, fg = hl_comment.fg })

-- used in nerd-tree
cmd("highlight Directory guifg=#549699")
cmd("syntax match fbCollections /collection/")
cmd("highlight fbCollections guifg=#E9BD15")
cmd("syntax match fbSubCollections /sub-collection/")
cmd("highlight fbSubCollections guifg=#E9BD15")
cmd("syntax match fbDocuments /document/")
cmd("highlight fbDocuments guifg=#FA8072")
