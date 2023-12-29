-- lazygit
vim.g.lazygit_floating_window_scaling_factor = 1

-- get link with the selected range (in visual mode) or to the file (in normal mode)
Keymap("n", "<leader>gl", ":GBrowse<cr>", Opts)
Keymap("v", "<leader>gl", ":GBrowse<cr>", Opts)
-- git blame [vim fuvitive]
Keymap("n", "<cmd>Git", "blame<cr>", Opts)
-- open lazygit
Keymap("n", "<leader>gg", ":cd %:h<cr> :LazyGit<cr>", Opts)
