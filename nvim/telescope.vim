lua << EOF
require('telescope').setup{
  defaults = {
    layout_strategy = 'horizontal',
    prompt_title = "holis",
    file_ignore_patterns = {
      "node_modules", "build", "dist", "yarn.lock"
      },
    layout_config = {
      scroll_speed = 3,
       horizontal = {
         preview_width = 0.6
       },
    },
    mappings = {
      n = {
        ["<C-j>"] = "preview_scrolling_down",
        ["<C-k>"] = "preview_scrolling_up",
        ["<S-j>"] = "preview_scrolling_down",
        ["<S-k>"] = "preview_scrolling_up",
        ["<C-c>"] = require('telescope.actions').close
      },
      i = {
        ["<S-j>"] = "preview_scrolling_down",
        ["<S-k>"] = "preview_scrolling_up",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      }
    }
  }
}
EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" scroll.speed
