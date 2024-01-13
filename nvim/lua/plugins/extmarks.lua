-- Highlights lines with <space><space>
-- Wipes highlights with <space>d<space>


-- Defaults
vim.api.nvim_command("hi def link ExtMark DiffChange")
local namespace = vim.api.nvim_create_namespace('ExtMarks')
local buf = 0

local opts = {
  hl_group = "ExtMark",
  line_hl_group = "ExtMark",
  -- virt_text = { {'This is a text', 'TestExtMark'} },
  -- virt_text_pos = 'overlay',
  priority= 10000
}

-- Helpers
local function add_extmark(ns, line_num)
  vim.api.nvim_buf_set_extmark(0, ns, line_num - 1, 0, opts)
end

local function wipe_extmarks(ns)
  for _, mark in pairs(vim.api.nvim_buf_get_extmarks(buf, ns, 0, -1, {})) do
   vim.api.nvim_buf_del_extmark(buf, ns, mark[1])
  end
end

-- Keymaps
-- toggle extmark
vim.keymap.set('n', '<space><space>', function()
  local pos = vim.api.nvim_win_get_cursor(0)
  local extmarks = vim.api.nvim_buf_get_extmarks(buf, namespace, {pos[1] - 1, 0 }, {pos[1] - 1, -1}, {})
  if(#extmarks > 0) then
    for _, extmark in pairs(extmarks) do
     vim.api.nvim_buf_del_extmark(buf, namespace, extmark[1])
    end
  else
    add_extmark(namespace, pos[1])
  end
end, { silent = true })

-- wipe extmarks
vim.keymap.set('n', '<space>d<space>', function()
  wipe_extmarks(namespace)
end, { silent = true })
