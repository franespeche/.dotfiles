local create_item = require("strawberry").create_item

-- Helpers
local function is_copilot_enabled()
  local status_output = vim.api.nvim_exec(":Copilot status", true)
  local is_enabled = nil

  -- this seems a little bit hacky <(-_-<)
  if status_output:match("Copilot: Disabled globally by :Copilot disable") then
    is_enabled = false
  elseif status_output:match("Copilot: Ready") then
    is_enabled = true
  end

  return is_enabled
end

local function toggle_copilot(v) return vim.api.nvim_command("Copilot " .. v()) end

local show_custom_menu = {
  name = "show_custom_menu",
  format_value = function(v) return v end,
  callback = function()
    local menu_items = {}
    local menuItem = create_item({
      num = 1,
      value = function()
        return is_copilot_enabled() and "disable" or "enable"
      end,
      title = "Copilot",
      action = toggle_copilot,
    })
    table.insert(menu_items, menuItem)
    return menu_items
  end,
}

return show_custom_menu
