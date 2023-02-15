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
        ["<C-m>"] = send_selected_to_qflist,
      },
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-m>"] = "send_selected_to_qflist",
        ["<Cr>"] = "select_default",
      }
    }
  },
  pickers = {
    find_files = { 
      theme = "dropdown",
      results_title = false
      },
    live_grep = { 
      theme = "dropdown"
      },
    buffers = { 
      theme = "dropdown",
      results_title = false
      },
    help_tags = { 
      theme = "dropdown",
      results_title = false
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

" autocommands"
nnoremap <Leader>fa :lua require'telescope.builtin'.autocommands{}<cr>
nnoremap <Leader>fy :lua require'telescope.builtin'.highlights{}<cr>


