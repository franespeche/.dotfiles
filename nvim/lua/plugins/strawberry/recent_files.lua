-- Utils
local U = {
  parse_config = function(config)
    -- update default values with given ones
    return config
  end,

  is_file_readable = function(f)
    return vim.fn.filereadable(f) == 1
  end,

  is_git_worktree = function()
    return vim.api.nvim_exec("!git rev-parse --is-inside-work-tree", true)
  end,

  is_file_in_git_workspace = function(f)
    local git_root_dir = vim.fn.system('git rev-parse --show-toplevel')
    local trim = vim.trim
    if vim.startswith(trim(f), trim(git_root_dir)) then
      return true
    end
  end,

  get_recent_files = function(source)
    local oldfiles = vim.tbl_filter(function(f) return H.is_file_readable(f) end, vim.v.oldfiles)
    if (source == "all") then
      return oldfiles
    end
    if (source == '') then
      return vim.tbl_filter(H.is_file_in_git_workspace, oldfiles)
    end
  end
}

-- Module
local M = {
  items = {},
  config = {
    items_amount = 5,
    source = "all",
    enabled = true
  }
}

M.apply_config = function(config)
  M.config = config
end

M.setup = function (opts)
  -- apply config
  local config = U.parse_config(opts)
  M.apply_config(config)

  -- get recent items
  local items = U.get_recent_files(M.config.source)
  M.items = vim.list_slice(items, 0, M.config.items_amount)

end

return M
