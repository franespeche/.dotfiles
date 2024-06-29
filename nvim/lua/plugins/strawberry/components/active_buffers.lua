local create_item = require("strawberry").create_item

local show_active_buffers = {
  name = "show_active_buffers",
  callback = function()
    local limit = 15

    local bufs = vim.api.nvim_list_bufs()
    local menu_items = {}

    local i = 1
    while (i <= #bufs and (#menu_items < limit or i < 10)) do
      local buf = bufs[i]
      if (vim.api.nvim_buf_is_loaded(buf)) then
        local name = vim.api.nvim_buf_get_name(buf)
        local item = create_item({
          num = #menu_items + 1,
          value = "asd",
          title = "qwe",
        })
        table.insert(menu_items, item)
      end
      i = i + 1
    end
    return menu_items
  end,
}

return show_active_buffers
