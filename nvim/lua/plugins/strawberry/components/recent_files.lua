local create_item = require("strawberry").create_item
local utils = require("strawberry").utils
local actions = require("strawberry").actions

local picker = {
  name = "recent_files",
  config = {
    close_on_leave = true,
    close_on_select = true,
   },
  actions = {
    {
      -- this is super hacky
      name = "cycle",
      description = "Cycle through the recent files pickers",
      fn = function() vim.cmd("Strawberry git_worktree_recent_files") end,
      keymap = "<space>",
     },
   },
  get_items = function(limit)
    limit = limit or 25

    local oldfiles = vim.v.oldfiles
    local menu_items = {}

    local i = 1
    while (i <= #oldfiles and (#menu_items < limit or i < 10)) do
      local file = oldfiles[i]
      if (vim.fn.filereadable(file) == 1) then
        local menu_item = create_item({
          title = utils.get_filename(file),
          label = utils.remove_home_path(file),
          value = file,
          on_select = actions.open_file,
         })
        table.insert(menu_items, menu_item)
      end
      i = i + 1
    end
    return menu_items
  end,
 }

return picker
