local create_seed = require('strawberry').create_seed

-- helpers
local function get_filename(path)
  local pattern = "/([^/]+)$"
  return path:match(pattern) or "-"
end

local function is_file_in_git_workspace(f)
  local git_root_dir = vim.fn.system('git rev-parse --show-toplevel')
  local trim = vim.trim
  if vim.startswith(trim(f), trim(git_root_dir)) then
    return true
  end
end

local function is_git_directory() 
  return vim.api.nvim_exec("!git rev-parse --is-inside-work-tree", true) 
end

-- actions
local show_git_worktree_recent_files = {
  name = "show_git_worktree_recent_files",
  callback = function(limit)
    if(not is_git_directory()) then
      error("Not inside a git working tree")
    end

    limit = limit or 15

    local oldfiles = vim.v.oldfiles
    local seeds = {}

    local i = 1
    while(i <= #oldfiles and (#seeds < limit or i < 10)) do
      local file = oldfiles[i]
      if(vim.fn.filereadable(file) == 1 and is_file_in_git_workspace(file)) then
        local seed = create_seed( #seeds + 1, file, get_filename(file), true)
        table.insert(seeds, seed)
      end
      i = i + 1
    end
    return seeds
end
}

local show_recent_files = {
  name = "show_recent_files",
  callback = function(limit)
    limit = limit or 15

    local oldfiles = vim.v.oldfiles
    local seeds = {}

    local i = 1
    while(i <= #oldfiles and (#seeds < limit or i < 10)) do
      local file = oldfiles[i]
      if(vim.fn.filereadable(file) == 1) then
        local seed = create_seed( #seeds + 1, file, get_filename(file), true)
        table.insert(seeds, seed)
      end
      i = i + 1
    end
    return seeds
end
}

local show_active_buffers = {
  name = "show_active_buffers",
  callback = function()
    local limit = 15

    local bufs = vim.fn.buffers('ah')
    local seeds = {}

    local i = 1
    while(i <= #bufs and (#seeds < limit or i < 10)) do
      local buf = bufs[i]
      if(vim.api.nvim_buf_is_loaded(buf)) then
        local name = vim.api.nvim_buf_get_name(buf)
        local seed = create_seed(#seeds + 1, name, name, false)
        P(buf)
        P(name)
        table.insert(seeds, seed)
      end
      i = i + 1
    end
  end
}

-- setup
require('strawberry'):setup({
  actions = { show_git_worktree_recent_files, show_recent_files, show_active_buffers },
  config = {
    window_height = 5
  }
})

-- keymaps
Keymap('n', '<leader>rf', ":Strawberry show_git_worktree_recent_files<cr>", Opts)
