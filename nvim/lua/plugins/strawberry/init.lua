-- Imports --
local components = require("plugins.strawberry.components")

-- Setup --
require("strawberry"):setup({
  pickers = {
    git_worktree_recent_files = components.git_worktree_recent_files,
    recent_files = components.recent_files,
    active_buffers = components.active_buffers,
    custom_menu = components.custom_menu,
    git_modified = components.git_modified,
  },
  config = {
    window_height = 15,     -- strawberry's window height
    close_on_leave = true,  -- close when leaving the picker
    close_on_select = true, -- close on item selection
    keymaps = {
      close = {
        "<esc>",
        "q",
      },  -- close the picker
      select_item = {
        "<cr>",
      },
      delete_item = nil,
    },
  },
})

-- vim.keymap.sets --
vim.keymap.set("n", "<leader>rf", ":Strawberry git_worktree_recent_files<cr>",
  Opts)
vim.keymap.set("n", "<leader>rm", ":Strawberry custom_menu<cr>", Opts)
vim.keymap.set("n", "<leader>rg", ":Strawberry git_modified<cr>", Opts)
vim.keymap.set("n", "<leader>rb", ":Strawberry active_buffers<cr>", Opts)
