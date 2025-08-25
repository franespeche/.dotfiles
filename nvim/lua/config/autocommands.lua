local config = require("config")

local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup

-- helpers
-- autocommands
aug("VimFiles", {
  clear = true,
})

-- disable autocommenting
au("BufEnter", {
  desc = "disables autocommenting",
  command = "set fp-=c fo-=r fo-=o",
})

-- brieflye highlight yanked text
au("TextYankPost", {
  callback = function() vim.highlight.on_yank() end,
  desc = "briefly highlight yanked text",
})

-- mimic github's tabulation
aug("TabulationConfig", {
  clear = true,
})
au("FileType", {
  pattern = "vim",
  group = "TabulationConfig",
  desc = "match github's tabulation's width",
  command = "setlocal shiftwidth=4 softtabstop=4",
})

au("FileType", {
  pattern = "md",
  group = "TabulationConfig",
  desc = "match github's tabulation's width",
  command = "setlocal shiftwidth=4 softtabstop=4",
})

-- syntax json comments
au("FileType", {
  pattern = "json",
  command = "syntax match Comment +\\/\\/.\\+$+",
})

-- python settings
au({
  "BufNewFile",
  "BufRead",
}, {
  pattern = {
    "*.py",
  },
  desc = "python settings",
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.textwidth = 79
    vim.opt.expandtab = true
    vim.opt.autoindent = true
    vim.opt.fileformat = "unix"
  end,
})

-- persist folds
aug("persistent_folds", {
  clear = true,
})

-- TODO: Centralize this
vim.api.nvim_create_user_command("PromptDebug", function() require("prompt-debug").open() end, {
  desc = "Open floating prompt and exec cmd",
})

au("BufWinLeave", {
  pattern = "*.*",
  callback = function() vim.cmd.mkview() end,
  group = "persistent_folds",
  desc = "",
})
au("BufWinEnter", {
  pattern = "*.*",
  callback = function()
    vim.cmd.loadview({
      mods = {
        emsg_silent = true,
      },
    })
  end,
  group = "persistent_folds",
})

-- persist cursor position
au("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
})

-- cursor line on each window
au({
  "InsertLeave",
  "WinEnter",
}, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
au({
  "InsertEnter",
  "WinLeave",
}, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})

-- au({
-- "ColorScheme",
-- }, {
-- callback = function()
-- local theme_name = vim.fn.expand("<amatch>")
-- local runtimepath = vim.api.nvim_list_runtime_paths()[1]
-- vim.schedule(function()
-- if (vim.g.dark_theme == nil) then return end
-- vim.g.dark_theme = theme_name
-- vim.g.light_theme = theme_name
-- -- vim.cmd("source " .. runtimepath .. "/lua/theme.lua")
-- vim.cmd("source " .. runtimepath .. "/lua/plugins/ui.lua")
-- end)
-- end,
-- })

-- Formatter
au("BufWritePre", {
  pattern = "*",
  callback = function(args) require("conform").format({ bufnr = args.buf }) end,
})

local function set_theme(mode)
  local theme = mode == "light" and vim.g.light_theme or vim.g.dark_theme
  vim.o.background = mode
  vim.cmd("colorscheme " .. theme)

  local ok, lualine = pcall(require, "lualine")
  if not ok then return end

  lualine.setup({
    options = {
      theme = theme,
    },
  })
end

vim.api.nvim_create_autocmd("User", {
  pattern = "SetLightMode",
  callback = function() set_theme("light") end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "SetDarkMode",
  callback = function() set_theme("dark") end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "DebugModeDisable",
  callback = function() config.set("debug_mode", true) end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "DebugModeEnable",
  callback = function()
    print("Initializing debug mode")
    require("development").enable()
    config.set("debug_mode", true)
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "DebugModeToggle",
  callback = function()
    local is_enabled = config.get("debug_mode")
    vim.api.nvim_exec_autocmds("User", {
      pattern = is_enabled and "DebugModeDisable" or "DebugModeEnable",
    })
  end,
})
