local function isDarkMode()
  local os_name = vim.fn.system("uname")
  if vim.fn.match(os_name, "Darwin") >= 0 then
    local result = vim.fn.system(
      "defaults read -g AppleInterfaceStyle 2>/dev/null | tr -d '\n'")
    return result == "Dark"
  else
    -- Unsupported platform
    return 0
  end
end

-- Globals
vim.g.mapleader = ","
vim.g.typescript_ignore_typescriptdoc = 1
vim.g["t_Co"] = 256 -- set colors
vim.g.is_dark_mode = isDarkMode()

-- Commands
vim.cmd [[
  syntax enable
]]

-- LuaFormatter on

-- see :bisect for debugigng
