return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sharkdp/fd",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope-ui-select.nvim",
   },

  keys = function()
    local builtin = require("telescope.builtin")
    local dotfiles = vim.fn.expand("~/.dotfiles/nvim/")

    return {
      {
        "<leader>ff",
        builtin.find_files,
       },
      {
        "<leader>fQ",
        builtin.quickfixhistory,
       },
      {
        "<leader>fl",
        builtin.loclist,
       },
      {
        "<leader>fb",
        builtin.buffers,
       },
      {
        "<leader>fh",
        builtin.help_tags,
       },
      {
        "<leader>fq",
        builtin.quickfix,
       },
      {
        "<leader>fp",
        builtin.current_buffer_fuzzy_find,
       },
      {
        "<leader>fc",
        builtin.colorscheme,
       },
      {
        "<Leader>fa",
        builtin.autocommands,
       },
      {
        "<Leader>fi",
        builtin.highlights,
       },

      {
        "<leader>fn",
        function()
          builtin.find_files({
            cwd = dotfiles,
           })
        end,
       },
      {
        "<leader>fng",
        function()
          builtin.live_grep({
            cwd = dotfiles,
           })
        end,
       },

      -- grep only open files
      {
        "<leader>fz",
        function()
          builtin.live_grep({
            grep_open_files = true,
           })
        end,
       },
     }
  end,

  opts = function()
    local utils = require("telescope.utils")
    local actions = require("telescope.actions")
    local themes = require("telescope.themes")

    require("plugins.telescope.multigrep").setup()

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
            ["<CR>"] = "select_default",
           },
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<C-q>"] = "send_selected_to_qflist",
            ["<CR>"] = "select_default",
           },
         },
       },
      extensions = {
        ["ui-select"] = themes.get_dropdown({}),
       },
      pickers = {
        find_files = {
          path_display = {
            "truncate",
           },
         },
        live_grep = {
          results_title = false,
          path_display = {
            "truncate",
           },
         },
        buffers = {
          theme = "dropdown",
          results_title = false,
          path_display = function(_, path)
            local filename = utils.path_tail(path)
            local filepath = string.gsub(path, "/" .. filename, "")
            return string.format("%s (%s)", filename, filepath)
          end,
         },
        location_list = {
          results_title = false,
          path_display = function(_, path)
            local tail = utils.path_tail(path)
            return string.format("%s (%s)", tail, path)
          end,
         },
        quickfix = {
          results_title = false,
          path_display = function(_, path)
            local tail = utils.path_tail(path)
            return string.format("%s (%s)", tail, path)
          end,
         },
        help_tags = {
          results_title = false,
          path_display = {
            "truncate",
           },
          layout_strategy = "vertical",
          layout_config = {
            height = 0.99,
            width = 0.99,
            preview_height = 0.68,
           },
         },
       },
     }
  end,

  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("ui-select")
  end,
 }
