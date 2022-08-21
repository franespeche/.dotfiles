lua << EOF
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["<C-j>"] = "preview_scrolling_down",
        ["<C-k>"] = "preview_scrolling_up"
      }
    }
  }
}
EOF
