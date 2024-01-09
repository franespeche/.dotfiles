-- system locals
local vim = vim
local g = vim.g
local o = vim.o
local cmd = vim.cmd

-- globals
local color_scheme = "gruvbox"

if g.dark_theme == nil then
  g.dark_theme = color_scheme
end
if g.light_theme == nil then
  g.light_theme = color_scheme
end

-- avoid syntax inconsistencies
if g.syntax_on == nil then
  vim.cmd("syntax on")
  g.syntax_on = 1
end

-- dark/light themes
if g.colors_name == nil then
    if g.is_dark_mode then
      cmd("silent! colorscheme " .. g.dark_theme)
      -- cmd("silent! set background=dark")
      if(color_scheme == "gruvbox") then
        local yellow = "#fabd2f"
        cmd("highlight Search cterm=None ctermfg=214 ctermbg=235 gui=None guifg=#1d2021 guibg=" .. yellow)
      end
    else
      cmd("silent! colorscheme " .. g.light_theme)
      g.gruvbox_contrast_light="soft"
      cmd("silent! set background=light")
    end
end

if not o.termguicolors then
    o.termguicolors = true
end

-- italic comments
g.one_allow_italics = 1
cmd("highlight Comment cterm=italic")

-- used in nerd-tree
vim.cmd("highlight Directory guifg=#549699")
vim.cmd("syntax match fbCollections /collection/")
vim.cmd("highlight fbCollections guifg=#E9BD15")
vim.cmd("syntax match fbSubCollections /sub-collection/")
vim.cmd("highlight fbSubCollections guifg=#E9BD15")
vim.cmd("syntax match fbDocuments /document/")
vim.cmd("highlight fbDocuments guifg=#FA8072")
