local create_seed = require('strawberry').create_seed

-- helpers
local function get_filename(path)
  local pattern = "/-(%w+%.%w+)$"
  return path:match(pattern) or "-"
end

local get_recent_files = {
  name = "get_recent_files",
  callback = function(limit)
    limit = limit or 5

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

local get_buffers = {
  name = "get_buffers",
  callback = function()
    local limit = 5

    local bufs = vim.api.nvim_list_bufs()
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

require('strawberry'):setup({
  actions = { get_recent_files, get_buffers },
  config = {
    window_height = 5
  }
})

Keymap('n', '<leader>rf', ":Strawberry get_recent_files<cr>", Opts)
