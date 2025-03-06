-- get link with the selected range (in visual mode) or to the file (in normal mode)
vim.keymap.set("n", "<leader>gl", ":GBrowse<cr>", Opts)
-- git blame [vim fuvitive]
vim.keymap.set("n", "<cmd>Git", "blame<cr>", Opts)
