local config = require('config')

--  local status_icon = navic.is_available() and "  "  or "  "
-- imports
local navic = require("nvim-navic")
local copilot = require("plugins.copilot")

-- system locals
local MINIMALISTIC_WIDTH = 100

-- helpers
local progress = function ()
  local current_line = vim.fn.line(".")
  local totalLines = vim.fn.line("$")
  if current_line == 1 then
    return "Top"
  elseif current_line == totalLines then
    return "Bot"
  else
    return "%p%%"
  end
end

local conditions = {
  buffer_not_empty = function () return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 end,
  hide_in_width = function (width)
    local w = width or 80
    return vim.fn.winwidth(0) > w
  end,
  check_git_workspace = function ()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
  width_percent_below = function (n, thresh)
    local winwidth = vim.api.nvim_win_get_width(0)
    return n / winwidth <= thresh
  end,
}

local function DynamicPath()
  return vim.fn.winwidth(0) > 100 and vim.fn.expand("%:h") or ""
end

local colors = {
  bg = "#262626",
  darker_grey = "#2f2f2f",
  dark_grey = "#6a6a6a",
  bg_light = "#404040",
  red = "#b66467",
  green = "#",
  orange = "#d9bc8c",
  blue = "#8da3b9",
  magenta = "#a988b0",
  cyan = "#8ca3af",
  white = "#e8e3e3",
  gruvbox_aqua = "#abb66f",
  search_bg_color = vim.fn.synIDattr(vim.fn.hlID("Search"), "bg") or "#000000",
  search_fg_color = vim.fn.synIDattr(vim.fn.hlID("Search"), "fg") or "#ffffff",
}

-- safe check
local status_ok = pcall(require, "lualine")
if not status_ok then return end

-- components
local searchcount = {
  "searchcount",
  maxcount = 999,
  colored = true,
  timeout = 500,
  -- color = {
  -- fg = colors.search_fg_color,
  -- bg = colors.search_bg_color,
  -- },
}

local diff = {
  "diff",
  padding = {
    left = 0,
    right = 0,
  },
  cond = function () return conditions.hide_in_width(MINIMALISTIC_WIDTH) end,
}

local diagnostics = {
  "diagnostics",
  sources = {
    "nvim_diagnostic",
    "coc",
  },
  sections = {
    "error",
    "hint",
    "warn",
  },
  symbols = {
    error = " ",
    warn = " ",
    info = "",
    hint = " ",
  },
  colored = false,
  update_in_insert = true,
  always_visible = false,
  padding = {
    left = 2,
    right = 0,
  },
  cond = function () return conditions.hide_in_width(MINIMALISTIC_WIDTH) end,
}

local mode = {
  "mode",
  fmt = function (str) return str:sub(1, 1) end,
  align = "right",
  color = {
    gui = "bold",
  },
}

local filetype = {
  "filetype",
  colored = false,
  icon_only = true,
  padding = {
    left = 1,
    right = 0,
  },
}

local filename = {
  "filename",
  padding = {
    left = 1,
    right = 0,
  },
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
  padding = {
    left = 2,
    right = 1,
  },
  cond = function () return conditions.hide_in_width(65) end,
}

local navic_status = {
  function ()
    local status_icon = navic.is_available() and "󰗠 " or " "
    return status_icon .. "navic"
  end,
}

local quickfix_amount_items = {
  function () return "  " .. vim.fn.len(vim.fn.getqflist()) end,
  cond = function () return config.get('debug_mode') end,
}

local is_debug_mode = {
  function () return config.get('debug_mode') and " " or "" end,
  color = {
    fg = colors.orange,
  },
}

local window_id = {
  function () return " " .. vim.fn.win_getid() end,
  cond = function () return config.get('debug_mode') end,
}
local buf_id = {
  function () return " " .. vim.fn.bufnr() end,
  cond = function () return config.get('debug_mode') end,
}

-- setup
require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = config.get('dark_mode') and vim.g.dark_theme or vim.g.light_theme,
    -- section_separators = {
    -- left = "",
    -- right = "",
    -- },
    section_separators = {
      left = "",
      right = "",
    },
    component_separators = {
      left = "",
      right = "",
    },
    disabled_filetypes = {
      "Trouble",
      "neo-tree",
      "quickfix",
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = {
      mode,
    },
    lualine_b = {
      branch,
      diff,
    },
    lualine_c = {
      filetype,
      filename,
      -- diagnostics
    },
    lualine_x = {
      DynamicPath,
    },
    lualine_y = {
      progress,
    },
    lualine_z = {
      "location",
      searchcount,
      "selectioncount",
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      filename,
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {
    lualine_c = {
      {
        function () return navic.get_location() end,
        cond = function () return navic.is_available() end,
      },
    },
    lualine_y = {
      window_id,
      buf_id,
      quickfix_amount_items,
      is_debug_mode,
      navic_status,

    },
  },

  inactive_winbar = {},
  extensions = {},
}
