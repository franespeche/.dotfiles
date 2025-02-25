local create_item = require("strawberry").create_item
local utils = require("strawberry").utils
local actions = require("strawberry").actions

-- Get the default branch name
local function get_default_branch_name()
  local result = vim.fn.system("git symbolic-ref refs/remotes/origin/HEAD")
  if vim.v.shell_error == 0 then
    return result:match("^refs/remotes/origin/(.+)%s*$"):gsub("%s+$", "") -- Extract the branch name and remove trailing whitespace
  else
    -- TODO: find a better way to get the default branch name
    return "main"
  end
end

local picker = {
  name = "git_modified",
  config = {
    close_on_leave = true,
    close_on_select = true,
  },
  get_items = function (branch)
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
