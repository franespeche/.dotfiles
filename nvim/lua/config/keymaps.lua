-- source vim
vim.keymap.set("n", "<leader>rr", ":so ~/.dotfiles/nvim/init.lua<cr>", Opts)

-- cd cwd
-- see :help expand
vim.keymap.set("n", "<leader>cd", ":cd %:h<cr> :pwd<cr>")

-- motion
vim.keymap.set({ "v", "n" }, "<S-h>", "^")
vim.keymap.set({ "v", "n" }, "<S-l>", "$")

-- open new tab
vim.keymap.set("n", "<leader>tn", ":tabnew<cr>", Opts)
vim.keymap.set("n", "<leader>tq", ":tabclose<cr>", Opts)

-- splits create
vim.keymap.set("n", "<leader>l", ":vsp<cr>", Opts)
vim.keymap.set("n", "<leader>j", ":sp<cr>", Opts)

-- splits navigatekeymaps
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", Opts)
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", Opts)
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", Opts)
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", Opts)
vim.keymap.set("i", "<C-l>", "<Esc>:wincmd l<cr>", Opts)
vim.keymap.set("i", "<C-h>", "<Esc>:wincmd h<cr>", Opts)
vim.keymap.set("i", "<C-j>", "<Esc>:wincmd j<cr>", Opts)
vim.keymap.set("i", "<C-k>", "<Esc>:wincmd k<cr>", Opts)

--	splits resize
vim.keymap.set("n", "+", ":vertical resize +3<cr>")
vim.keymap.set("n", "-", ":vertical resize -3<cr>")

--	splits fullscreen
vim.keymap.set("n", "<leader>zo", ":ZoomToggle<CR>", Opts)

vim.keymap.set("n", "J", "2j")
vim.keymap.set("n", "K", "2k")

-- faster selection
vim.keymap.set("v", "J", "2j")
vim.keymap.set("v", "K", "2k")

vim.keymap.set("n", "<space>j", "J")

vim.keymap.set("n", "<space>o", "o<C-u>")

vim.keymap.set("n", "<leader>C", ":Copilot disable<cr>")

--INSERT mode
-- insert line
vim.keymap.set("i", "<C-o>", "<Esc>o")
-- paste from system clipboard
vim.keymap.set("i", "<C-p>", '<Esc>"+pa')

-- start a substitute
vim.keymap.set("n", "<leader>ss", ":%s#\\v")
-- start a substitute inside the selected range only
vim.keymap.set("v", "<leader>ss", ":<C-u>%s#\\%V\\v")
-- subsitute word under " register
vim.keymap.set("n", "<lmmmmm><space>s", ":<C-u>%s#<C-r>\"#")
-- subsitute word under " register inside the selected range
vim.keymap.set("v", "<leader><space>s", ":<C-u>%s#\\%V\\v<C-r>\"#")
-- substitute cword
-- (note that boundaries are being added "\\<" "\\>")
vim.keymap.set("n", "<leader>sw", ":%s#\\<<C-r><C-w>\\>#")
vim.keymap.set("v", "<leader>sw", ":<C-u>%s#\\%V\\<<C-r><C-w>\\>#") -- nnoremap <leader>iw :'<,'>s#<C-r>=expand("<cword>")<cr>#

-- search within selection
vim.keymap.set("v", "/", "<ESC>/\\%V")
-- search selected text
vim.keymap.set("v", "//", "y/<C-R>=escape(@\",'/\')<CR>")
-- substitute selected text
-- vim.keymap.set("v", "<leader>sw", "\"hy:%s#\\V<C-r>h##g<left><left>")

-- unhighlight find results
vim.keymap.set("n", "<esc><esc>", ":noh<cr>", Opts)

-- yank line-block
vim.keymap.set("n", "Y", "yy")

-- comment line
vim.keymap.set("", ",,", ":norm gcc<cr>")

-- toggle wrap
vim.keymap.set("n", "<leader>zz", "<cmd>set wrap!<cr>")

-- vim-plug
vim.keymap.set("n", "<leader>pi", "<cmd>PlugInstall<cr>")
vim.keymap.set("n", "<leader>pc", "<cmd>PlugClean<cr>")
vim.keymap.set("n", "<leader>pu", "<cmd>PlugUpdate<cr>")

-- fold everything but selection
-- got from https://stackoverflow.com/questions/674613/vim-folds-for-everything-except-something
vim.keymap.set("v", "<Leader>za", "<Esc>`<kzfgg`>jzfG`<")

-- save, quit
vim.keymap.set("n", "<leader>q", ":qa!<cr>")
vim.keymap.set("n", ";q", ":q!<cr>")
vim.keymap.set("n", ";w", ":w<cr>")

-- unbind space
vim.keymap.set("", "<space>", "<Nop>")

-- move to first WORD before current opening bracket
-- backwards
vim.keymap.set("n", "<space><S-b>", "F(B")
vim.keymap.set("n", "<space>b", "F(b")
-- forwards
vim.keymap.set("n", "<space>F", "f(B")
vim.keymap.set("n", "<space>f", "f(b")

-- indenting behavior
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- do not insert comment after pressing 'o'
vim.keymap.set("n", "<space>o", "o<C-u>")
vim.keymap.set("n", "<space>O", "O<C-u>")

-- exec current line (helpful for debugging)
-- nnoremap <leader>e :exe getline(line('.'))<cr>
vim.keymap.set("n", "<leader>e", function () return vim.cmd([[luafile %]]) end)

-- repeat last substitution
vim.keymap.set("n", "<leader>.", ":&&<cr>")

-- expand current dir
vim.keymap.set("c", "%%", "<C-R>=expand('%:h').'/'<cr>")

-- toggle line numbers
vim.keymap.set("n", "<leader>sn", ":set relativenumber!<cr>")

-- toggle auto-pairs
-- inoremap <C-a> <Esc>:call AutoPairsToggle()<cr>
-- noremap <leader>ap <Esc>:call AutoPairsToggle()<cr>

-- go to first function in main column
-- see :h [[
vim.keymap.set("n", "[[", "?{<CR>w99[{")
vim.keymap.set("n", "][", "/}<CR>b99]}")
vim.keymap.set("n", "]]", "j0[[%/{<CR>")
vim.keymap.set("n", "[]", "k$][%?}<CR>")

-- cycle through methods or keys within an object
vim.keymap.set("n", "[m", "[mzt")
vim.keymap.set("n", "]m", "]mzt")

-- Bufstop
vim.keymap.set("n", "<leader>b", ":BufstopFast<cr>")
vim.keymap.set("n", "<leader><C-o>", ":BufstopBack<cr>")
vim.keymap.set("n", "<leader><C-i>", ":BufstopForward<cr>")

-- buffers
vim.keymap.set("n", "<space>{", ":bp<cr>")
vim.keymap.set("n", "<space>}", ":bn<cr>")

vim.keymap.set("i", "<C-h>", "<Esc>ha")
vim.keymap.set("i", "<C-l>", "<Esc>la")
vim.keymap.set("i", "<C-j>", "<Esc>ja")
vim.keymap.set("i", "<C-k>", "<Esc>ka")

-- copy current buffer's file path to clipboard
vim.keymap.set("n", "<leader>cp", ":let @* = expand(\"%\")<cr>", Opts)

-- console log snippet
vim.keymap.set("n", "<space>cl",
  "viw\"adiconsole.log()<ESC>F(\"apviwyea, <ESC>pbbbi\"<ESC>ea\"<ESC>")
vim.keymap.set("v", "<space>cl",
  "\"adiconsole.log()<ESC>F(\"apviwyea, <ESC>pbbbi\"<ESC>ea\"<ESC>")

-- Git
--
-- open tooltip with commit info
vim.keymap.set("n", "<leader>gm", ":GitMessenger<cr>", Opts)
-- get link with the selected range (in visual mode) or to the file (in normal mode)
vim.keymap.set("x", "<leader>gl", ":GBrowse<cr>", Opts)
-- git blame [vim fuvitive]
vim.keymap.set("n", "<leader>gb", ":Git blame<cr>", Opts)
-- open lazygit
-- vim.keymap.set("n", "<leader>gg", ":cd %:h<cr> :LazyGit<cr>", Opts)
vim.keymap.set("n", "<leader>gg", ":LazyGitCurrentFile<cr>", Opts)

-- go to the last cursor position before going into Visual mode
vim.keymap.set("n", "go", "gvogvo<ESC>")

-- goto prev/next occurrence and center buffer
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "*", "*zz")

-- Delete Boundaries (first and last line) of selected range
vim.keymap.set("v", ",db", "<Esc>:'>d<Cr>:'<d<Cr>")

vim.keymap.set("n", "[q", ":cp<cr>")
vim.keymap.set("n", "]q", ":cn<cr>")

vim.keymap.set("n", "p", "P")
vim.keymap.set("n", "P", "p")
