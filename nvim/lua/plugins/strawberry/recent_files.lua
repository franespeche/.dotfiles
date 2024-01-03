local apply_config = require('plugins.strawberry.utils').apply_config
local RecentFilesSource = require('plugins.strawberry.types').RecentFilesSource

-- Utils
local U = {}

U.is_file_readable = function(f)
    return vim.fn.filereadable(f) == 1
  end

U.is_git_worktree = function()
    return vim.api.nvim_exec("!git rev-parse --is-inside-work-tree", true)
  end

U.is_file_in_git_workspace = function(f)
    local git_root_dir = vim.fn.system('git rev-parse --show-toplevel')
    local trim = vim.trim
    if vim.startswith(trim(f), trim(git_root_dir)) then
      return true
    end
  end

U.get_recent_files = function(source)
    local oldfiles = vim.tbl_filter(function(f) return U.is_file_readable(f) end, vim.v.oldfiles)
    if (source == RecentFilesSource.ALL) then
      return oldfiles
    end
    if (source == RecentFilesSource.GIT_WORKING_TREE) then
      return vim.tbl_filter(U.is_file_in_git_workspace, oldfiles)
    end
    if (source == RecentFilesSource.GIT_MODIFIED) then
      return error('Implement Git_Modified recent_files')
    end
  end

-- Module
local M = {
  name = "recent_files",
  title = "Recent Files",
  items = {},
  config = {
    items_amount = 5,
    source = RecentFilesSource.ALL,
  },
}

--
-- merges a given config with the given Module's config and applies it to the Module
-- @param: opt, config override
-- @returns: Module
M.apply_config = function (opts) return apply_config(opts, M) end

M.setup = function (opts)
  P(opts)
  -- apply config
  local config = M.apply_config(opts)

  -- get recent items
  local items = U.get_recent_files(config.source)
  M.items = vim.list_slice(items, 0, M.config.items_amount)

  -- publish
  return M.publish()
end

M.publish = function()
  return {
    get_content = M.get_content,
    name = M.name,
    title = M.title,
    setup = M.setup
  }

end

-- returns array of lines
M.get_content = function(opts)
  local lines = {}
  table.foreach(M.items, function(i, v)
    lines[i] = v
  end)
  return lines
end


return M
