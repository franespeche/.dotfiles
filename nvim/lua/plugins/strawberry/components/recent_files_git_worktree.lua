local create_item = require("strawberry").create_item

local remove_home_path = require("strawberry").utils.remove_home_path
local is_git_directory = require("strawberry").utils.is_git_directory
local get_filename = require("strawberry").utils.get_filename

local show_git_worktree_recent_files = {
  name = "show_git_worktree_recent_files",
  format_value = function(v) return (remove_home_path(v)) end,
  callback = function(limit)
    if (not is_git_directory()) then error("Not inside a git working tree") end

    limit = limit or 15

    local oldfiles = vim.v.oldfiles
    local menu_items = {}
    local git_root_dir = vim.fn.system("git rev-parse --show-toplevel")

    local i = 1
    while (i <= #oldfiles and (#menu_items < limit or i < 10)) do
      local file = oldfiles[i]
      if (vim.fn.filereadable(file) == 1 and
          vim.startswith(vim.trim(file), vim.trim(git_root_dir))) then

        local menu_item = create_item({
          num = #menu_items + 1,
          value = file,
          title = get_filename(file),
        })
        table.insert(menu_items, menu_item)
      end
      i = i + 1
    end
    return menu_items
  end,
}

return show_git_worktree_recent_files
