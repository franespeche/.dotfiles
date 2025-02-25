local config = require("config")

-- LuaFormatter off
local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup

-- helpers
-- autocommands
aug('VimFiles', { clear = true })

-- disable autocommenting
au('BufEnter', {
  desc = "disables autocommenting",
  command = 'set fp-=c fo-=r fo-=o'
})

-- brieflye highlight yanked text
au('TextYankPost', {
  callback = function () vim.highlight.on_yank() end,
  desc = "briefly highlight yanked text"
})

-- mimic github's tabulation
aug('TabulationConfig', { clear = true })
au('FileType', {
  pattern = "vim",
  group = "TabulationConfig",
  desc = "match github's tabulation's width",
  command = 'setlocal shiftwidth=4 softtabstop=4'
})

au('FileType', {
  pattern = "md",
  group = "TabulationConfig",
  desc = "match github's tabulation's width",
  command = 'setlocal shiftwidth=4 softtabstop=4'
})

-- syntax json comments
au('FileType', {
  pattern = "json",
  command = "syntax match Comment +\\/\\/.\\+$+"
})

-- python settings
au({ "BufNewFile", "BufRead" }, {
  pattern = { "*.py" },
  desc = "python settings",
  callback = function ()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.textwidth = 79
    vim.opt.expandtab = true
    vim.opt.autoindent = true
    vim.opt.fileformat = 'unix'
  end
})

-- persist folds
aug("persistent_folds", { clear = true })

au("BufWinLeave", {
  pattern = "*.*",
  callback = function ()
    vim.cmd.mkview()
  end,
  group = "persistent_folds",
  desc = ""
})
au("BufWinEnter", {
  pattern = "*.*",
  callback = function ()
    vim.cmd.loadview({ mods = { emsg_silent = true } })
  end,
  group = "persistent_folds",
})

-- persist cursor position
au("BufReadPost", {
  callback = function ()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- cursor line on each window
au({ "InsertLeave", "WinEnter" }, {
  callback = function ()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
au({ "InsertEnter", "WinLeave" }, {
  callback = function ()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})

au({ "ColorScheme" }, {
  callback = function ()
    local theme_name = vim.fn.expand("<amatch>")
    local runtimepath = vim.api.nvim_list_runtime_paths()[1]
    vim.schedule(function ()
      if (vim.g.dark_theme == nil) then return end
      vim.g.dark_theme = theme_name
      vim.g.light_theme = theme_name
      vim.cmd('source ' .. runtimepath .. '/lua/config/theme.lua')
      -- vim.cmd('source ' .. runtimepath .. '/lua/plugins/lualine.lua')
    end)
  end
})

au('BufEnter', {
  pattern = ".lua-format",
  callback = function ()
    vim.cmd("syntax match LuaFormatConfig /^[^:]*:/")
    vim.cmd("highlight link LuaFormatConfig String")
  end
})

au({ "BufWrite" }, {
  pattern = "*.lua",
  callback = function ()
    vim.cmd(":call LuaFormat()")
  end
})

vim.api.nvim_create_autocmd("User", {
  pattern = "DebugModeDisable",
  callback = function ()
    config.set('debug_mode', false)
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "DebugModeEnable",
  callback = function ()
    print("Initializing debug mode")
    require("development").enable()
    config.set('debug_mode', true)
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "DebugModeToggle",
  callback = function ()
    local is_enabled = config.get('debug_mode')
    vim.api.nvim_exec_autocmds("User", { pattern = is_enabled and "DebugModeDisable" or "DebugModeEnable" })
  end,
})
-- LuaFormatter on
