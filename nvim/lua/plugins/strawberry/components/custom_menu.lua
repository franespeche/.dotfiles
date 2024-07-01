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

-- Enable/disable copilot
local function toggle_copilot()
  local is_enabled = is_copilot_enabled()
  local value = is_enabled and "disable" or "enable"
  local cmd = "Copilot " .. value
  vim.api.nvim_command(cmd)

  print("Copilot " .. (is_enabled and "Disabled" or "Enabled"))
end

local function get_copilot_label()
  local is_enabled = is_copilot_enabled()
  return is_enabled and "Disable" or "Enable"
end

-- Custom menu items
local function get_menu_items()
  return {
    { title = "Copilot", label = get_copilot_label(),
      on_select = toggle_copilot },
  }
end

local picker = {
  name = "custom_menu",
  config = { close_on_leave = true, close_on_select = false },
  get_items = function()
    local items = {}
    for _, menu_item in ipairs(get_menu_items()) do
      local item = create_item(menu_item)
      table.insert(items, item)
    end
    return items
  end,
}

return picker
