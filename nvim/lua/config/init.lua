local utils = require("config.utils")

-- Just in case config file doesn't exist
local BASE_CONFIG = {
  dark_mode = "system",
  line_blame_enabled = true,
  debug_mode = true,
}
-- TODO: get/set this from somewhere else
local yaml_path = vim.fn.expand("~/.config/nvim/lua/config/.config.yaml")

local base_config = utils.read_yaml(yaml_path) or BASE_CONFIG

local M = {}

M.setup = function ()
  -- store default config in vim global dynamically
  for k, v in pairs(base_config) do vim.g[k] = v end

  require "config.copilot"
  require "config.utils"
  require "config.settings"
  require "config.autocommands"
  require "config.theme"
  require "config.coc"
  require "config.lspconfig"
  require "config.git"
  require "config.keymaps"
end

M.get = function (key)
  local config = utils.read_yaml(yaml_path) or BASE_CONFIG
  return config[key]
end

M.set = function (key, value) utils.set_yaml_key(yaml_path, key, value) end

return M
