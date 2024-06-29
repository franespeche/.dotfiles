local create_item = require("strawberry").create_item
local get_filename = require("strawberry").utils.get_filename
local remove_home_path = require("strawberry").utils.remove_home_path

local show_recent_files = {
  name = "show_recent_files",
  format_value = function(v) return (remove_home_path(v)) end,
  callback = function(limit)
    limit = limit or 15

    local oldfiles = vim.v.oldfiles
    local menu_items = {}

    local i = 1
    while (i <= #oldfiles and (#menu_items < limit or i < 10)) do
      local file = oldfiles[i]
      if (vim.fn.filereadable(file) == 1) then
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

return show_recent_files
