-- utils
local if_nil = vim.F.if_nil

-- module
local M = {}

M.if_nil = if_nil

-- got from lualine.git
-- https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/utils/utils.lua#L117-L134
function cycle_aware_copy(t, cache)
  if type(t) ~= 'table' then
    return t
  end
  if cache[t] then
    return cache[t]
  end
  local res = {}
  cache[t] = res
  local mt = getmetatable(t)
  for k, v in pairs(t) do
    k = cycle_aware_copy(k, cache)
    v = cycle_aware_copy(v, cache)
    res[k] = v
  end
  setmetatable(res, mt)
  return res
end

-- got from lualine.git
-- https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/utils/utils.lua#L142-L144
M.deepcopy = function (t)
  return cycle_aware_copy(t, {})
end

--
-- merges a given config with the given Module's config and applies it to the Module
-- @param: opt, config override
-- @param: Module
-- @returns: Module
M.apply_config = function(config, Module)
  M.config = vim.tbl_deep_extend("keep", if_nil(config, {}), if_nil(Module.config, {}))
  return M.config
end

return M
