require("harpoon").setup({
  global_settings = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,

    -- enable tabline with harpoon marks
    tabline = false,
    tabline_prefix = "   ",
    tabline_suffix = "   ",
  },
})
require("telescope").load_extension("harpoon")

Keymap("n", "<leader>hx", ":lua require(\"harpoon.mark\").add_file()<CR>", Opts)
Keymap("n", "<leader>hm", ":lua require(\"harpoon.mark\").add_file()<CR>", Opts)
Keymap("n", "<leader>ho", ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>", Opts)
Keymap("n", "<leader>hh", ":Telescope harpoon marks<CR>", Opts)
Keymap("n", "<leader>hn", ":lua require(\"harpoon.ui\").nav_next()<CR>", Opts)
Keymap("n", "<leader>hp", ":lua require(\"harpoon.ui\").nav_prev()<CR>", Opts)
Keymap("n", "<leader>ht", ":lua require(\"harpoon.term\").gotoTerminal(1)<CR>", Opts)
