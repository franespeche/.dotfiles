local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup

aug('VimFiles', { clear = true })

-- disable autocommenting
au('BufEnter', {
  desc = "disables autocommenting",
  command = 'set fp-=c fo-=r fo-=o'
})

-- brieflye highlight yanked text
au('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  desc = "briefly highlight yanked text"
})

-- mimic github's tabulation
au('FileType', {
  pattern="vim",
  group = "VimFiles",
  desc = "match github's tabulation's width",
  command = 'setlocal shiftwidth=4 softtabstop=4'
})

-- syntax json comments
au('FileType', {
  pattern = "json",
  command = "syntax match Comment +\\/\\/.\\+$+"
})

-- python settings (not-checked)
au({"BufNewFile", "BufRead"}, {
  pattern = {"*.py"},
  desc = "some python settings",
  command = "set tabstop=4 set softtabstop=4 set shiftwidth=4 set textwidth=79 set expandtab=true set autoindent=true set fileformat='unixiletype plugin indent on'"
})

-- persist folds
aug("persistent_folds", { clear = true })

au("BufWinLeave", {
	pattern = "*.*",
	callback = function()
		vim.cmd.mkview()
	end,
	group = "persistent_folds",
  desc = ""
})
au("BufWinEnter", {
	pattern = "*.*",
	callback = function()
		vim.cmd.loadview({ mods = { emsg_silent = true } })
	end,
	group = "persistent_folds",
})

-- persist cursor position
au("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- cursor line on each window
au({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
au({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})

aug("git_repo_check", {})

au({ "VimEnter", "DirChanged" }, {
	group = "git_repo_check",
	callback = function()
		local is_git = vim.api.nvim_exec("!git rev-parse --is-inside-work-tree", true)
		if is_git:match("true") then
			vim.cmd("doautocmd User IsGit")
			return true
		else
			return false
		end
	end,
})

au({ "ColorScheme" }, {
  callback = function()
    local theme_name = vim.fn.expand("<amatch>")
    local runtimepath = vim.api.nvim_list_runtime_paths()[1]
    vim.schedule(function()
      if (vim.g.dark_theme == nil) then
        print('ssss')
        return
      end
      vim.g.dark_theme = theme_name
      vim.g.light_theme = theme_name
      vim.cmd( 'source ' .. runtimepath .. '/lua/config/theme.lua')
      vim.cmd( 'source ' .. runtimepath .. '/lua/plugins/lualine.lua')
    end)
  end
})

