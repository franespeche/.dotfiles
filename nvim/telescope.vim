lua << EOF
require('telescope').setup{
  defaults = {
    layout_strategy = 'horizontal',
    file_ignore_patterns = {
      "node_modules", "dist", "yarn.lock"
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
        --["<C-m>"] = "send_selected_to_qflist",
        ["<Cr>"] = "select_default",
      },
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        --["<C-m>"] = "send_selected_to_qflist",
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
    help_tags = {
      path_display = { "truncate" },
      results_title = false,
      -- theme = "dropdown", 
      -- wrap_results = true
      },
    }
}

EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fn <cmd>lua require('telescope.builtin').find_files{ cwd = '~/.dotfiles/nvim/' }<cr>
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fz :lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>
" autocommands"
nnoremap <Leader>fa :lua require'telescope.builtin'.autocommands{}<cr>
nnoremap <Leader>fy :lua require'telescope.builtin'.highlights{}<cr>


