-- print current path
-- Imports --
-- vim.keymap.sets --
return {
  "franespeche/strawberry",
  branch = "dev",
  -- cmd = "Strawberry", -- lazyload on Strawberry event
  keys = {
    {
      "<leader>rf",
      ":Strawberry git_worktree_recent_files<cr>",
     },
    {
      "<leader>rm",
      ":Strawberry custom_menu<cr>",
     },
    {
      "<leader>rg",
      ":Strawberry git_modified<cr>",
     },
    {
      "<leader>rb",
      ":Strawberry active_buffers<cr>",
     },
   },
  opts = function(_, opts)
    local components = require("plugins.strawberry.components")
    return {
      config = {
        window_height = 15, -- strawberry's window height
        close_on_leave = true, -- close when leaving the picker
        close_on_select = true, -- close on item selection
        keymaps = {
          close = {
            "<esc>",
            "q",
           }, -- close the picker
          select_item = {
            "<cr>",
           },
          delete_item = nil,
         },
       },
      pickers = {
        git_worktree_recent_files = components.git_worktree_recent_files,
        recent_files = components.recent_files,
        active_buffers = components.active_buffers,
        custom_menu = components.custom_menu,
        git_modified = components.git_modified,
       },
     }
  end,
 }
