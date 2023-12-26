local set = vim.opt

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

-- python
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"*.py"},
  command = "set tabstop=4 set softtabstop=4 set shiftwidth=4 set textwidth=79 set expandtab=true set autoindent=true set fileformat='unixiletype plugin indent on'" 
})

-- jump to the last position when reopening a file
if vim.fn.has('--autocmd--') == 1 then
  print('has --append-- (settings.lua)')
  vim.api.nvim_create_autocmd({"BufReadPost" }, {
    callback = function()
      if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
        print('found line (settings.lua)')
        vim.cmd [[
          norm! g'\""
        ]]
      end
    end
  })
end

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


