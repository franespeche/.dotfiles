-- source vim
Keymap("n", "<leader>rr", ":so ~/.dotfiles/nvim/init.lua<cr>", Opts)

-- cd cwd
-- see :help expand
Keymap("n", "<leader>cd", ":cd %:h<cr> :pwd<cr>")

-- motion
Keymap({ "v", "n" }, "<S-h>", "^")
Keymap({ "v", "n" }, "<S-l>", "$")

-- open new tab
Keymap("n", "<leader>tn", ":tabnew<cr>", Opts)
Keymap("n", "<leader>tq", ":tabclose<cr>", Opts)

-- splits create
Keymap("n", "<leader>l", ":vsp<cr>", Opts)
Keymap("n", "<leader>j", ":sp<cr>", Opts)

-- splits navigatekeymaps
Keymap("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", Opts)
Keymap("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", Opts)
Keymap("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", Opts)
Keymap("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", Opts)
Keymap("i", "<C-l>", "<Esc>:wincmd l<cr>", Opts)
Keymap("i", "<C-h>", "<Esc>:wincmd h<cr>", Opts)
Keymap("i", "<C-j>", "<Esc>:wincmd j<cr>", Opts)
Keymap("i", "<C-k>", "<Esc>:wincmd k<cr>", Opts)
-- Keymap("n",  "<C-l>", ":wincmd l<cr>", Opts)
-- Keymap("n",  "<C-h>", ":wincmd h<cr>", Opts)
-- Keymap("n",  "<C-j>", ":wincmd j<cr>", Opts)
-- Keymap("n",  "<C-k>", ":wincmd k<cr>", Opts)

--	splits resize
Keymap("n", "+", ":vertical resize +3<cr>")
Keymap("n", "-", ":vertical resize -3<cr>")

--	splits fullscreen
Keymap("n", "<leader>zo", ":ZoomToggle<CR>", Opts)

Keymap("n", "J", "2j")
Keymap("n", "K", "2k")

-- faster selection
Keymap("v", "J", "2j")
Keymap("v", "K", "2k")

Keymap("n", "<space>j", "J")

Keymap("n", "<space>o", "o<C-u>")

Keymap("n", "<leader>C", ":Copilot disable<cr>")

-- insert line in INSERT mode
Keymap("i", "<C-o>", "<Esc>o")

-- start a substitute
Keymap("n", "<leader>ss", ":%s#\\v")
-- start a substitute inside the selected range only
Keymap("v", "<leader>ss", ":<C-u>%s#\\%V\\v")
-- subsitute word under " register
Keymap("n", "<lmmmmm><space>s", ":<C-u>%s#<C-r>\"#")
-- subsitute word under " register inside the selected range
Keymap("v", "<leader><space>s", ":<C-u>%s#\\%V\\v<C-r>\"#")
-- substitute cword
-- (note that boundaries are being added "\\<" "\\>")
Keymap("n", "<leader>sw", ":%s#\\<<C-r><C-w>\\>#")
Keymap("v", "<leader>sw", ":<C-u>%s#\\%V\\<<C-r><C-w>\\>#") -- nnoremap <leader>iw :'<,'>s#<C-r>=expand("<cword>")<cr>#

-- search within selection
Keymap("v", "/", "<ESC>/\\%V")
-- search selected text
Keymap("v", "//", "y/<C-R>=escape(@\",'/\')<CR>")
-- substitute selected text
-- Keymap("v", "<leader>sw", "\"hy:%s#\\V<C-r>h##g<left><left>")

-- unhighlight find results
Keymap("n", "<esc><esc>", ":noh<cr>", Opts)

-- yank line-block
Keymap("n", "Y", "yy")

-- comment line
Keymap("", ",,", ":norm gcc<cr>")

-- toggle wrap
Keymap("n", "<leader>zz", "<cmd>set wrap!<cr>")

-- vim-plug
Keymap("n", "<leader>pi", "<cmd>PlugInstall<cr>")
Keymap("n", "<leader>pc", "<cmd>PlugClean<cr>")
Keymap("n", "<leader>pu", "<cmd>PlugUpdate<cr>")

-- fold everything but selection
-- got from https://stackoverflow.com/questions/674613/vim-folds-for-everything-except-something
Keymap("v", "<Leader>za", "<Esc>`<kzfgg`>jzfG`<")

-- save, quit
Keymap("n", "<leader>q", ":qa!<cr>")
Keymap("n", ";q", ":q!<cr>")
Keymap("n", ";w", ":w<cr>")

-- unbind space
Keymap("", "<space>", "<Nop>")

-- move to first WORD before current opening bracket
-- backwards
Keymap("n", "<space><S-b>", "F(B")
Keymap("n", "<space>b", "F(b")
-- forwards
Keymap("n", "<space>F", "f(B")
Keymap("n", "<space>f", "f(b")

-- indenting behavior
Keymap("v", "<Tab>", ">gv")
Keymap("v", "<S-Tab>", "<gv")

-- do not insert comment after pressing 'o'
Keymap("n", "<space>o", "o<C-u>")
Keymap("n", "<space>O", "O<C-u>")

-- exec current line (helpful for debugging)
-- nnoremap <leader>e :exe getline(line('.'))<cr>
Keymap("n", "<leader>e", function() return vim.cmd([[luafile %]]) end)

-- repeat last substitution
Keymap("n", "<leader>.", ":&&<cr>")

-- expand current dir
Keymap("c", "%%", "<C-R>=expand('%:h').'/'<cr>")

-- toggle line numbers
Keymap("n", "<leader>sn", ":set relativenumber!<cr>")

-- toggle auto-pairs
-- inoremap <C-a> <Esc>:call AutoPairsToggle()<cr>
-- noremap <leader>ap <Esc>:call AutoPairsToggle()<cr>

-- go to first function in main column
-- see :h [[
Keymap("n", "[[", "?{<CR>w99[{")
Keymap("n", "][", "/}<CR>b99]}")
Keymap("n", "]]", "j0[[%/{<CR>")
Keymap("n", "[]", "k$][%?}<CR>")

-- cycle through methods or keys within an object
Keymap("n", "[m", "[mzt")
Keymap("n", "]m", "]mzt")

-- Bufstop
Keymap("n", "<leader>b", ":BufstopFast<cr>")
Keymap("n", "<leader><C-o>", ":BufstopBack<cr>")
Keymap("n", "<leader><C-i>", ":BufstopForward<cr>")

-- buffers
Keymap("n", "<space>{", ":bp<cr>")
Keymap("n", "<space>}", ":bn<cr>")

Keymap("i", "<C-h>", "<Esc>ha")
Keymap("i", "<C-l>", "<Esc>la")
Keymap("i", "<C-j>", "<Esc>ja")
Keymap("i", "<C-k>", "<Esc>ka")

-- copy current buffer's file path to clipboard
Keymap("n", "<leader>cp", ":let @* = expand(\"%\")<cr>", Opts)

-- console log snippet
Keymap("n", "<space>cl",
       "viw\"adiconsole.log()<ESC>F(\"apviwyea, <ESC>pbbbi\"<ESC>ea\"<ESC>")
Keymap("v", "<space>cl",
       "\"adiconsole.log()<ESC>F(\"apviwyea, <ESC>pbbbi\"<ESC>ea\"<ESC>")

-- Git
--
-- open tooltip with commit info
Keymap("n", "<leader>gm", ":GitMessenger<cr>", Opts)
-- get link with the selected range (in visual mode) or to the file (in normal mode)
Keymap("x", "<leader>gl", ":GBrowse<cr>", Opts)
-- git blame [vim fuvitive]
Keymap("n", "<leader>gb", ":Git blame<cr>", Opts)
-- open lazygit
-- Keymap("n", "<leader>gg", ":cd %:h<cr> :LazyGit<cr>", Opts)
Keymap("n", "<leader>gg", ":LazyGitCurrentFile<cr>", Opts)

-- go to the last cursor position before going into Visual mode
Keymap("n", "go", "gvogvo<ESC>")

-- goto prev/next occurrence and center buffer
Keymap("n", "#", "#zz")
Keymap("n", "*", "*zz")

-- Delete Boundaries (first and last line) of selected range
Keymap("v", ",db", "<Esc>:'>d<Cr>:'<d<Cr>")

Keymap("n", "[q", ":cp<cr>")
Keymap("n", "]q", ":cn<cr>")
