vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", Opts)
vim.keymap.set("n", "<leader>fQ",
               "<cmd>lua require('telescope.builtin').quickfixhistory{}<cr>",
               Opts)
vim.keymap.set("n", "<leader>fl",
               "<cmd>lua require('telescope.builtin').loclist{}<cr>", Opts)
vim.keymap.set("n", "<leader>fn",
               "<cmd>lua require('telescope.builtin').find_files{ cwd = '~/.dotfiles/nvim/' }<cr>",
               Opts)
vim.keymap.set("n", "<leader>fng",
               "<cmd>lua require('telescope.builtin').live_grep{ cwd = '~/.dotfiles/nvim/' }<cr>",
               Opts)
-- vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", Opts) -- this is set in ./multigrep.lua
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", Opts)
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", Opts)
vim.keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", Opts)
vim.keymap.set("n", "<leader>fp",
               ":lua require 'telescope.builtin'.current_buffer_fuzzy_find {}<CR>",
               Opts)
vim.keymap.set("n", "<leader>fz",
               ":lua require 'telescope.builtin'.live_grep({ grep_open_fies=true })<CR>",
               Opts)
vim.keymap.set("n", "<leader>fc",
               ":lua require 'telescope.builtin'.colorscheme {}<CR>", Opts)
vim.keymap.set("n", "<Leader>fa",
               ":lua require 'telescope.builtin'.autocommands{}<cr>", Opts)
vim.keymap.set("n", "<Leader>fi",
               ":lua require 'telescope.builtin'.highlights{}<cr>", Opts)

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sharkdp/fd",
    "nvim-treesitter/nvim-treesitter",
   },
  opts = function(_, opts)
    local utils = require("telescope.utils")
    local actions = require("telescope.actions")

    -- TODO: find a better place to call this
    require"plugins.telescope.multigrep".setup()

    return {
      defaults = {
        layout_strategy = "horizontal",
        file_ignore_patterns = {
          "node_modules",
          "dist",
          "yarn.lock",
          "mongo_exports",
         },
        layout_config = {
          scroll_speed = 3,
          horizontal = {
            preview_width = 0.4,
           },
         },
        mappings = {
          n = {
            ["<S-j>"] = "preview_scrolling_down",
            ["<S-k>"] = "preview_scrolling_up",
            ["<S-l>"] = "preview_scrolling_right",
            ["<S-h>"] = "preview_scrolling_left",
            ["<C-c>"] = actions.close,
            ["<C-q>"] = "send_selected_to_qflist",
            ["<Cr>"] = "select_default",
           },
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<C-q>"] = "send_selected_to_qflist",
            ["<Cr>"] = "select_default",
           },
         },
       },
      pickers = {
        find_files = {
          path_display = {
            "truncate",
           },
          -- wrap_results = true
         },
        live_grep = {
          results_title = false,
          path_display = {
            "truncate",
           },
          -- theme = "dropdown",
          -- wrap_results = true
         },
        buffers = {
          theme = "dropdown",
          path_display = function(opts, path)
            local filename = utils.path_tail(path)
            local filepath = string.gsub(path, "/" .. filename, "")
            return string.format("%s (%s)", filename, filepath)
          end,
          results_title = false,
          -- theme = "dropdown",
          -- wrap_results = true
         },
        location_list = {
          path_display = function(opts, path)
            local tail = utils.path_tail(path)
            return string.format("%s (%s)", tail, path)
          end,
          results_title = false,
          -- theme = "dropdown",
          -- wrap_results = true
         },
        quickfix = {
          path_display = function(opts, path)
            local tail = utils.path_tail(path)
            return string.format("%s (%s)", tail, path)
          end,
          results_title = false,
          -- theme = "dropdown",
          -- wrap_results = true
         },
        help_tags = {
          path_display = {
            "truncate",
           },
          results_title = false,
          -- theme = "dropdown",
          layout_strategy = "vertical",
          layout_config = {
            height = 0.99,
            width = 0.99,
            preview_height = 0.68,
           },
          -- theme = "dropdown",
          -- wrap_results = true
         },
        -- highlights = {
        --   path_display = { "truncate" },
        --   results_title = false,
        --   -- theme = "dropdown",
        --   -- wrap_results = true
        --   },
       },
     }
  end,
 }
