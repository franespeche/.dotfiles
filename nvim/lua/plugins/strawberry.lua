local create_seed = require('strawberry').create_seed

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
        local seed = create_seed( #seeds + 1, file, nil, true)
        table.insert(seeds, seed)
      end
      i = i + 1
    end
    return seeds
end
}

require('strawberry'):setup({
  actions = { get_recent_files },
  config = {
    window_height = 5
  }
})

Keymap('n', '<leader>rf', ":Strawberry get_recent_files<cr>", Opts)
