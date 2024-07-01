-- Actions
local custom_menu = require("plugins.strawberry.components.custom_menu")
local git_worktree_recent_files = require(
                                      "plugins.strawberry.components.recent_files_git_worktree")
local recent_files = require("plugins.strawberry.components.recent_files")
local active_buffers = require("plugins.strawberry.components.active_buffers")
-- Setup
require("strawberry"):setup({
  pickers = {
    git_worktree_recent_files,
    recent_files,
    active_buffers,
    custom_menu,
  },
  config = {
    window_height = 15, -- strawberry's window height
    auto_close_on_leave = true, -- close on BufLeave
    auto_close_on_select = true, -- close on item selection
    keymaps = { close = { "<esc>" }, select_item = { "<cr>" } }, -- Not yet supported
  },
})

-- Keymaps
Keymap("n", "<leader>rf", ":Strawberry git_worktree_recent_files<cr>", Opts)
Keymap("n", "<leader>rm", ":Strawberry custom_menu<cr>", Opts)
Keymap("n", "<leader>rb", ":Strawberry active_buffers<cr>", Opts)
