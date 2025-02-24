local config = require("config")
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
  local is_enabled = config.get("debug_mode") or false
  return get_enabled_label(is_enabled)
end

local function get_copilot_label()
  local is_enabled = is_copilot_enabled()
  return get_enabled_label(is_enabled)
end

local function get_line_blame_label()
  local is_enabled = require("plugins.blame").is_enabled()
  return get_enabled_label(is_enabled)
end

local function toggle_line_blame() vim.cmd(":LineBlameToggle") end
local function format_json()
  vim.api.nvim_command("set filetype=json")
  vim.api.nvim_command("Prettier")
end

local function toggle_debug_mode()
  vim.api.nvim_exec_autocmds("User", {
    pattern = "DebugModeToggle",
  })
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
      title = "Git Blame",
      label = get_line_blame_label(),
      on_select = toggle_line_blame,
    },
    {
      title = "Debug Mode",
      label = get_debug_mode_label(),
      on_select = toggle_debug_mode,
    },
    { title = "Format Json", label = "", on_select = format_json },
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
