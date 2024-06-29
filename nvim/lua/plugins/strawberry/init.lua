-- actions
local show_custom_menu = require("plugins.strawberry.components.custom_menu")
local show_git_worktree_recent_files = require(
                                           "plugins.strawberry.components.recent_files_git_worktree")
local show_recent_files = require("plugins.strawberry.components.recent_files")
local show_active_buffers = require(
                                "plugins.strawberry.components.active_buffers")

-- setup
require("strawberry"):setup({
  actions = {
    show_git_worktree_recent_files,
    show_recent_files,
    show_active_buffers,
    show_custom_menu,
  },
  config = { window_height = 5, auto_close = false },
})

-- keymaps
Keymap("n", "<leader>rf", ":Strawberry show_git_worktree_recent_files<cr>", Opts)
Keymap("n", "<leader>rm", ":Strawberry show_custom_menu<cr>", Opts)
Keymap("n", "<leader>rb", ":Strawberry show_active_buffers<cr>", Opts)
