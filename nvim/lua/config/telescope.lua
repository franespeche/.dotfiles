require('telescope').setup{
  defaults = {
    layout_strategy = 'horizontal',
    file_ignore_patterns = {
      "node_modules", "dist", "yarn.lock", "mongo_exports"
      },
    layout_config = {
      scroll_speed = 3,
       horizontal = {
         preview_width = 0.4
       },
    },
    mappings = {
      n = {
        ["<C-j>"] = "preview_scrolling_down",
        ["<C-k>"] = "preview_scrolling_up",
        ["<C-c>"] = require('telescope.actions').close,
        ["<C-q>"] = "send_selected_to_qflist",
        ["<Cr>"] = "select_default",
      },
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-q>"] = "send_selected_to_qflist",
        ["<Cr>"] = "select_default",
      }
    }
  },
  pickers = {
    find_files = {
      path_display = { "truncate" },
      -- wrap_results = true
      },
    live_grep = {
      results_title = false,
      path_display = { "truncate" },
      -- theme = "dropdown", 
      -- wrap_results = true
      },
    buffers = {
      path_display = { "truncate" },
      results_title = false,
      -- theme = "dropdown", 
      -- wrap_results = true
      },
    quickfix = {
      path_display = { "truncate" },
      results_title = false,
      -- theme = "dropdown", 
      -- wrap_results = true
      },
    help_tags = {
      path_display = { "truncate" },
      results_title = false,
      -- theme = "dropdown", 
      -- wrap_results = true
      },
    -- highlights = {
    --   path_display = { "truncate" },
    --   results_title = false,
    --   -- theme = "dropdown", 
    --   -- wrap_results = true
    --   },
    }
}

Keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", Opts)
Keymap("n", "<leader>fn", "<cmd>lua require('telescope.builtin').find_files{ cwd = '~/.dotfiles/nvim/' }<cr>", Opts)
Keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", Opts)
Keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", Opts)
Keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", Opts)
Keymap("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", Opts)
Keymap("n", "<leader>fz", ":lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>", Opts)
Keymap("n", "<Leader>fa", ":lua require'telescope.builtin'.autocommands{}<cr>", Opts)
Keymap("n", "<Leader>fi", ":lua require'telescope.builtin'.highlights{}<cr>", Opts)
