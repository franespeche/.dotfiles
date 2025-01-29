-- lazygit
vim.g.lazygit_floating_window_scaling_factor = 1

-- get link with the selected range (in visual mode) or to the file (in normal mode)
vim.keymap.set("n", "<leader>gl", ":GBrowse<cr>", Opts)
vim.keymap.set("v", "<leader>gl", ":GBrowse<cr>", Opts)
-- git blame [vim fuvitive]
vim.keymap.set("n", "<cmd>Git", "blame<cr>", Opts)
-- open lazygit
vim.keymap.set("n", "<leader>gg", ":cd %:h<cr> :LazyGit<cr>", Opts)
