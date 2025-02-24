local create_item = require("strawberry").create_item

-- Helpers
local get_enabled_label = function (is_enabled)
  local ENABLE = " "
  local DISABLE = " "
  return is_enabled and DISABLE or ENABLE
end

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
  vim.api.nvim_command("Copilot " .. value)
end

local function get_debug_mode_label()
  local is_enabled = vim.g.debug_mode or false
  return get_enabled_label(is_enabled)
end

local function get_copilot_label()
  local is_enabled = is_copilot_enabled()
  return get_enabled_label(is_enabled)
end

local function toggle_gitblame()
  vim.api.nvim_command("Gitsigns toggle_current_line_blame")
end

local function toggle_debug_mode()
  local is_enabled = vim.g.debug_mode or false
  vim.api.nvim_exec_autocmds("User", {
    pattern = "DebugModeToggle",
  })
  vim.g.debug_mode = not is_enabled
end

-- Custom menu items
local function get_menu_items()
  return {
    {
      title = "Copilot",
      label = get_copilot_label(),
      on_select = toggle_copilot,
    },
    {
      title = "GitBlame",
      label = "Toggle",
      on_select = toggle_gitblame,
    },
    {
      title = "Debug Mode",
      label = get_debug_mode_label(),
      on_select = toggle_debug_mode,
    },
  }
end

local picker = {
  name = "custom_menu",
  config = {
    close_on_leave = true,
    close_on_select = false,
  },
  get_items = function ()
    local items = {}
    for _, menu_item in ipairs(get_menu_items()) do
      local item = create_item(menu_item)
      table.insert(items, item)
    end
    return items
  end,
}

return picker
