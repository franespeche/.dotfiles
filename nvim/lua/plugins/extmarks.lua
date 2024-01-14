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

-- Toggles selected range in Visual mode or single line in Normal mode
local toggle_highlights = function()
  local mode = vim.api.nvim_get_mode().mode
  if (mode:lower() == "v" or mode == "\22") then
    local edge1 = vim.fn.getpos("v")[2]
    local edge2 = vim.fn.getcurpos(0)[2]
    local start_line = math.min(edge1, edge2)
    local end_line = math.max(edge1, edge2)
    local lines_range = end_line - start_line
    for i = start_line, start_line + lines_range, 1 do
      vim.api.nvim_buf_set_extmark(0, namespace, i - 1, 0, DEFAULT_OPTS)
    end
    -- exit Visual mode
    vim.api.nvim_input("<esc>")
  else
    local pos = vim.api.nvim_win_get_cursor(0)
    local extmarks = vim.api.nvim_buf_get_extmarks(buf, namespace, { pos[1] - 1, 0 }, { pos[1] - 1, -1 }, {})
    if (#extmarks > 0) then
      for _, extmark in pairs(extmarks) do vim.api.nvim_buf_del_extmark(buf, namespace, extmark[1]) end
    else
      vim.api.nvim_buf_set_extmark(0, namespace, pos[1] - 1, 0, DEFAULT_OPTS)
    end
  end
end

-- Create autocommands
vim.api.nvim_create_user_command("HighlightToggle", function() return toggle_highlights() end, { nargs = "?" })

-- Keymaps
vim.keymap.set({ "n", "v" }, "<leader>hs", function() vim.cmd(":HighlightToggle") end, { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>hd", function() wipe_extmarks(namespace) end, { silent = true })
