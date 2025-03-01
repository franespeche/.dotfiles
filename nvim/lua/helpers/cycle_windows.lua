---Cycles through visible windows in the specified direction
---@param direction? string 'prev' to cycle backwards. default is 'next'
---@param sort_fn? fun(a: number, b: number): boolean Optional function to sort windows
local function cycle_visible_windows(direction, sort_fn)
  local wins = vim.api.nvim_list_wins()
  local curr_win = vim.api.nvim_get_current_win()

  -- sort windows
  if sort_fn then
    table.sort(wins, sort_fn)
  end

  for i, win in ipairs(wins) do
    if win == curr_win then
      local next_index
      if direction == 'prev' then
        next_index = i - 1
        if next_index < 1 then next_index = #wins end
      else
        next_index = i % #wins + 1
        if next_index > #wins then next_index = 1 end
      end
      vim.api.nvim_set_current_win(wins[next_index])
      return
    end
  end
end

-- Tells if a window is floating
---@param win number
local function is_floating_window(win)
  local cfg = vim.api.nvim_win_get_config(win)
  return cfg.relative ~= ""
end

-- Sorts windows by floating status
---@param a number -- window number
---@param b number -- other window number
local sort_by_floating = function (a, b)
  return is_floating_window(a) and not is_floating_window(b)
end

-- Register autocmds
vim.api.nvim_create_autocmd("User", {
  pattern = "CycleWindowsPrev",
  callback = function ()
    cycle_visible_windows('prev', sort_by_floating)
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "CycleWindowsNext",
  callback = function ()
    cycle_visible_windows('next', sort_by_floating)
  end,
})

-- Keymaps
vim.keymap.set('n', '[w', ':doautocmd User CycleWindowsPrev<CR>', Opts)
vim.keymap.set('n', ']w', ':doautocmd User CycleWindowsNext<CR>', Opts)
