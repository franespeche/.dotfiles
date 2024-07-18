local create_item = require("strawberry").create_item
local get_filename = require("strawberry").utils.get_filename
local remove_home_path = require("strawberry").utils.remove_home_path
local open_file = require("strawberry").utils.open_file

-- Get the default branch name
function get_default_branch_name()
  local result = vim.fn.system("git symbolic-ref refs/remotes/origin/HEAD")
  if vim.v.shell_error == 0 then
    return result:match("^refs/remotes/origin/(.+)%s*$"):gsub("%s+$", "") -- Extract the branch name and remove trailing whitespace
  else
    print("Error executing command")
    return nil
  end
end

local picker = {
  name = "git_modified",
  config = { close_on_leave = true, close_on_select = true },
  get_items = function(branch)
    if (branch == nil) then branch = get_default_branch_name() end

    -- using systemlist here because system appends a newline character at the end :/
    local root_dir = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    local git_modified_files = vim.fn.systemlist(
                                   "git diff --name-only " .. branch)

    local menu_items = {}
    local i = 1
    while (i <= #git_modified_files) do
      local file = root_dir .. "/" .. git_modified_files[i]
      if (vim.fn.filereadable(file) == 1) then
        if i == 1 then P(file) end
        local menu_item = create_item({
          title = get_filename(file),
          label = remove_home_path(file),
          value = file,
          on_select = open_file,
        })
        table.insert(menu_items, menu_item)
      end
      i = i + 1
    end
    return menu_items
  end,
}

return picker
