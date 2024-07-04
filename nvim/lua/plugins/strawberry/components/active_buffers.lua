local create_item = require("strawberry").create_item
local get_filename = require("strawberry").utils.get_filename
local remove_home_path = require("strawberry").utils.remove_home_path
local open_file = require("strawberry").utils.open_file

local picker = {
  name = "active_buffers",
  config = {
    close_on_leave = true,
    close_on_select = true,
    keymaps = { delete_item = { "d" } },
  },
  get_items = function()
    local limit = 15
    local bufs = vim.api.nvim_list_bufs()
    local menu_items = {}
    local i = 1
    while (i <= #bufs and (#menu_items < limit or i < 10)) do
      local buf = bufs[i]
      if (vim.api.nvim_buf_is_loaded(buf)) then
        local file = vim.api.nvim_buf_get_name(buf)
        if file == "" then goto continue end
        local item = create_item({
          title = get_filename(file),
          label = remove_home_path(file),
          value = file,
          on_select = open_file,
          on_delete = function()
            vim.api.nvim_buf_delete(buf, { force = true })
          end,
        })
        table.insert(menu_items, item)
      end
      ::continue::
      i = i + 1
    end
    return menu_items
  end,
}

return picker
