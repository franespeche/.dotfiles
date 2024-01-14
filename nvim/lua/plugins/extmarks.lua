-- Highlights lines with <space><space>
-- Wipes highlights with <space>d<space>
-- Defaults
vim.api.nvim_command("hi def link ExtMark DiffChange")

local namespace = vim.api.nvim_create_namespace("ExtMarks")
local buf = 0

local DEFAULT_OPTS = {
  hl_group = "ExtMark",
  line_hl_group = "ExtMark",
  -- virt_text = { {'This is a text', 'TestExtMark'} },
  -- virt_text_pos = 'overlay',
  priority = 10000,
}

-- Helpers
local function wipe_extmarks(ns)
  for _, mark in pairs(vim.api.nvim_buf_get_extmarks(buf, ns, 0, -1, {})) do
    vim.api.nvim_buf_del_extmark(buf, ns, mark[1])
  end
end
-- Keymaps
-- toggle extmark
vim.keymap.set({ "n", "v" }, "ms", function()
  local mode = vim.api.nvim_get_mode().mode
  if (mode:lower() == "v" or mode == "\22") then
    -- local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    -- local opts = vim.tbl_extend('force', DEFAULT_OPTS, { end_row = end_line + 1 })
    P(end_line)
  else
    local pos = vim.api.nvim_win_get_cursor(0)
    local extmarks = vim.api.nvim_buf_get_extmarks(buf, namespace, { pos[1] - 1, 0 }, { pos[1] - 1, -1 }, {})
    if (#extmarks > 0) then
      for _, extmark in pairs(extmarks) do vim.api.nvim_buf_del_extmark(buf, namespace, extmark[1]) end
    else
      vim.api.nvim_buf_set_extmark(0, namespace, pos[1] - 1, 0, DEFAULT_OPTS)
    end
  end
end, { silent = true })

-- wipe extmarks
vim.keymap.set({ "n", "v" }, "md", function() wipe_extmarks(namespace) end, { silent = true })
