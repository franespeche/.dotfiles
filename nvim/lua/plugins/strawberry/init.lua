-- Imports --
local components = require("plugins.strawberry.components")
local git_worktree_recent_files = components.git_worktree_recent_files
local recent_files = components.recent_files
local active_buffers = components.active_buffers
local custom_menu = components.custom_menu

-- Setup --
require("strawberry"):setup({
  pickers = {
    git_worktree_recent_files,
    recent_files,
    active_buffers,
    custom_menu,
  },
  config = {
    window_height = 15, -- strawberry's window height
    close_on_leave = true, -- close when leaving the picker
    close_on_select = true, -- close on item selection
    keymaps = {
      close = { "<esc>", "q" }, -- close the picker
      select_item = { "<cr>" },
      delete_item = nil,
    },
  },
})

-- Keymaps --
Keymap("n", "<leader>rf", ":Strawberry git_worktree_recent_files<cr>", Opts)
Keymap("n", "<leader>rm", ":Strawberry custom_menu<cr>", Opts)
Keymap("n", "<leader>rb", ":Strawberry active_buffers<cr>", Opts)
