local function isDarkMode()
  local os_name = vim.fn.system("uname")
  if vim.fn.match(os_name, "Darwin") >= 0 then
    local result = vim.fn.system(
      "defaults read -g AppleInterfaceStyle 2>/dev/null | tr -d '\n'")
    return result == "Dark"
  else
    -- Unsupported platform
    return 0
  end
end

-- Globals
vim.g.mapleader = ","
vim.g.typescript_ignore_typescriptdoc = 1
vim.g["t_Co"] = 256 -- set colors
vim.g.is_dark_mode = isDarkMode()

-- Commands
vim.cmd [[
  syntax enable
]]

-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = { fold = "/", diff = "-" }
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = { list = 'full' } -- autocomplete first occurrence
vim.opt.wrapscan = true              -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false                  -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping-- LuaFormatter on

-- see :bisect for debugigng

-- LuaFormatter off
-- Settings
vim.opt.autoread = true           -- read files upon being changed from outside vim
vim.opt.clipboard = "unnamedplus" -- use all clipboards
vim.opt.cmdheight = 2             -- cmd height
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"        -- encoding
vim.opt.expandtab = true
vim.opt.fillchars = {
  fold = "/",
  diff = "-",
}
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- don't fold by default when first opening a file
vim.opt.foldmethod = "syntax"
vim.opt.gdefault = true   -- s///g default
vim.opt.hidden = true     -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase = true -- smartcase
vim.opt.smartcase = true  -- smartcase
vim.opt.mouse = "a"       -- enable mouse scroll
vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.ruler = true          -- show cursor position
vim.opt.scrolloff = 11        -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c") -- dont pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I") -- dont display introductory msg (:intro)
vim.opt.showmatch = true      -- show matching char (like {})
vim.opt.sidescrolloff = 11
vim.opt.smartcase = true      -- case = sensitive if expression contains a capital letter
vim.opt.softtabstop = 2
vim.opt.splitbelow = true     -- open split lanes to right and bottom
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2       -- indentation
vim.opt.undofile = true   -- persist undo
vim.opt.undolevels = 2000 -- numbers of undo
vim.opt.wildignore =
".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode = {
  list = "full",
}                       -- autocomplete first occurrence
vim.opt.wrapscan = true -- cycle search
vim.opt.showcmd = true
vim.wo.wrap = false     -- no line wrapping
