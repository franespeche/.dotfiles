-- helpers
local create_item = require("strawberry").create_item
local utils = require("strawberry").utils
local actions = require("strawberry").actions

local picker = {
  name = "git_worktree_recent_files",
  config = {
    close_on_leave = true, -- auto close the picker when an item is selected
    close_on_select = true, -- auto close the picker when an item is selected
  },
  get_items = function(limit)
    if (not utils.is_git_directory()) then
      error("Not inside a git working tree")
    end
    limit = limit or 15

    local menu_items = {}
    local oldfiles = vim.v.oldfiles
    local git_root_dir = vim.fn.system("git rev-parse --show-toplevel")

    local i = 1
    while (i <= #oldfiles and (#menu_items < limit or i < 10)) do
      local file = oldfiles[i]
      if (vim.fn.filereadable(file) == 1 and
          vim.startswith(vim.trim(file), vim.trim(git_root_dir))) then
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
