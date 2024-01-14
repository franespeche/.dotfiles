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
        ["<S-j>"] = "preview_scrolling_down",
        ["<S-k>"] = "preview_scrolling_up",
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
      theme = "dropdown",
      path_display = function(opts, path)
        local filename = require("telescope.utils").path_tail(path)
        local filepath = string.gsub(path, "/" .. filename, "")
        return string.format("%s (%s)", filename, filepath)
      end,
      results_title = false,
      -- theme = "dropdown", 
      -- wrap_results = true
      },
    quickfix = {
      path_display = function(opts, path)
        local tail = require("telescope.utils").path_tail(path)
        return string.format("%s (%s)", tail, path)
      end,
      results_title = false,
      -- theme = "dropdown", 
      -- wrap_results = true
      },
    help_tags = {
      path_display = { "truncate" },
      results_title = false,
      -- theme = "dropdown",
      layout_strategy = "vertical",
      layout_config = { height = 0.99, width = 0.99, preview_height = 0.68 }
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
Keymap("n", "<leader>fng", "<cmd>lua require('telescope.builtin').live_grep{ cwd = '~/.dotfiles/nvim/' }<cr>", Opts)
Keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", Opts)
Keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", Opts)
Keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", Opts)
Keymap("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", Opts)
Keymap("n", "<leader>fp", ":lua require 'telescope.builtin'.current_buffer_fuzzy_find {}<CR>", Opts)
Keymap("n", "<leader>fz", ":lua require 'telescope.builtin'.live_grep({ grep_open_fies=true })<CR>", Opts)
Keymap("n", "<leader>fc", ":lua require 'telescope.builtin'.colorscheme {}<CR>", Opts)
Keymap("n", "<Leader>fa", ":lua require 'telescope.builtin'.autocommands{}<cr>", Opts)
Keymap("n", "<Leader>fi", ":lua require 'telescope.builtin'.highlights{}<cr>", Opts)
