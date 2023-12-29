local function isDarkMode()
    local os_name = vim.fn.system("uname")
    if vim.fn.match(os_name, 'Darwin') >= 0 then
        local result = vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null | tr -d '\n'")
        return result == 'Dark'
    else
        -- Unsupported platform
        return 0
    end
end

local vim = vim
local opt = vim.opt

-- Globals
vim.g.mapleader = ","
vim.g.typescript_ignore_typescriptdoc = 1
vim.g["t_Co"]=256                          -- set colors
vim.g.is_dark_mode = isDarkMode()

-- Commands
vim.cmd [[
  syntax enable
]]

-- Settings
opt.autoread = true                      -- read files upon being changed from outside vim
opt.clipboard="unnamedplus"              -- use all clipboards
opt.cmdheight = 2                        -- cmd height
opt.cursorline = true
opt.encoding="UTF-8"                     -- encoding
opt.expandtab = true
opt.fillchars={ fold="/", diff="-" }
opt.foldenable = true
opt.foldlevel = 99                       -- don't fold by default when first opening a file
opt.foldmethod="syntax"
opt.gdefault = true                      -- s///g default
opt.hidden = true                        -- don't prompt for save when leaving an unsaved buffer
opt.ignorecase = true                    -- smartcase
opt.smartcase = true                     -- smartcase
opt.mouse="a"                            -- enable mouse scroll
opt.relativenumber = true
opt.number = true
opt.ruler = true                         -- show cursor position
opt.scrolloff = 11                       -- Show 11 lines of context around the cursor.
opt.shiftwidth = 2
opt.shortmess:append("c")                -- dont pass messages to |ins-completion-menu|
opt.showmatch = true                     -- show matching char (like {})
opt.sidescrolloff = 11
opt.smartcase = true                     -- case = sensitive if expression contains a capital letter
opt.softtabstop = 2
opt.splitbelow = true                    -- open split lanes to right and bottom
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2                          -- indentation
opt.undofile = true                      -- persist undo
opt.undolevels = 2000                    -- numbers of undo
opt.wildignore=".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
opt.wildmode={ list='full' }             -- autocomplete first occurrence
opt.wrapscan = true                      -- cycle search
opt.showcmd = false
vim.wo.wrap = false                      -- no line wrapping


