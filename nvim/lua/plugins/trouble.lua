require("trouble").setup {}
Keymap("n", "<leader>xx", function() require("trouble").toggle() end, Opts)
