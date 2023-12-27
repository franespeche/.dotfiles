-- Globals
vim.g.mapleader=","
vim.g.typescript_ignore_typescriptdoc=1
vim.g["t_Co"]=256                          -- set colors

-- Autocommands
local VimFiles = vim.api.nvim_create_augroup('VimFiles', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern="vim",
  group = VimFiles,
  -- match github's tabulation's width
  command = 'setlocal shiftwidth=4 softtabstop=4'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = "json",
  command = "syntax match Comment +\\/\\/.\\+$+"
})

-- Python
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"*.py"},
  command = "set tabstop=4 set softtabstop=4 set shiftwidth=4 set textwidth=79 set expandtab=true set autoindent=true set fileformat='unixiletype plugin indent on'" 
})

-- Jump to the last position when reopening a file
-- Autocmd commands
-- -- Persistent Folds
local augroup = vim.api.nvim_create_augroup
local save_fold = augroup("Persistent Folds", { clear = true })
vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "*.*",
	callback = function()
		vim.cmd.mkview()
	end,
	group = save_fold,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.*",
	callback = function()
		vim.cmd.loadview({ mods = { emsg_silent = true } })
	end,
	group = save_fold,
})
-- Persistent Cursor
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Cursor Line on each window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})

-- Commands
vim.cmd [[
  syntax enable
]]

-- Settings
vim.opt.autoread=true                      -- read files upon being changed from outside vim
vim.opt.clipboard="unnamedplus"            -- use all clipboards
vim.opt.cmdheight=2                        -- cmd height
vim.opt.cursorline=true
vim.opt.encoding="UTF-8"                   -- encoding
vim.opt.expandtab=true
vim.opt.fillchars={ fold="/", diff="-" }
vim.opt.foldenable=true
vim.opt.foldlevel=99                       -- don't fold by default when first opening a file
vim.opt.foldmethod="syntax"
vim.opt.gdefault=true                      -- s///g default
vim.opt.hidden=true                        -- don't prompt for save when leaving an unsaved buffer
vim.opt.ignorecase=true                    -- case-insensitive search
vim.opt.mouse="a"                          -- enable mouse scroll
vim.opt.relativenumber=true
vim.opt.number=true
vim.opt.ruler=true                         -- show cursor position
vim.opt.scrolloff=11                       -- Show 11 lines of context around the cursor.
vim.opt.shiftwidth=2
vim.opt.shortmess:append("c")              -- dont pass messages to |ins-completion-menu|
vim.opt.showmatch=true                     -- show matching char (like {})
vim.opt.sidescrolloff=11
vim.opt.smartcase=true                     -- case=sensitive if expression contains a capital letter
vim.opt.softtabstop=2
vim.opt.splitbelow=true                    -- open split lanes to right and bottom
vim.opt.splitright=true
vim.opt.swapfile=false
vim.opt.tabstop=2                          -- indentation
vim.opt.undofile=true                      -- persist undo
vim.opt.undolevels=2000                    -- numbers of undo
vim.opt.wildignore=".git,.hg,*.o,*.a,*.class,*.jar,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,**/cache/*,**/logs/*,**/target/*,*.hi,tags,**/dist/*,**/public/**/vendor/**,**/public/vendor/**,**/node_modules/**"
vim.opt.wildmode={ list='full' }            -- autocomplete first occurrence
vim.opt.wrapscan=true                      -- cycle search
vim.wo.wrap=false                          -- no line wrapping
