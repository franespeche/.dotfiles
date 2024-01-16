-- Defaults
vim.api.nvim_command("hi def link ExtMark DiffChange")

local namespace = vim.api.nvim_create_namespace("ExtMarks")
local buf = 0

local DEFAULT_OPTS = { hl_group = "ExtMark", line_hl_group = "ExtMark", priority = 200 }

-- Helpers
local function wipe_extmarks(ns)
  for _, mark in pairs(vim.api.nvim_buf_get_extmarks(buf, ns, 0, -1, {})) do
    vim.api.nvim_buf_del_extmark(buf, ns, mark[1])
  end
end

local function get_extmark_id_if_exists(line, extmarks)
  if (#extmarks == 0) then
    return false
  else
    for _, extmark in pairs(extmarks) do
      local id = extmark[1]
      local row = extmark[2]
      if (line == row) then return id end
    end
  end
end

-- Toggles selected range or single line
local toggle_highlights = function()
  local edge1 = vim.fn.getpos("v")[2]
  local edge2 = vim.fn.getcurpos(0)[2]
  local start_line = math.min(edge1, edge2) - 1
  local end_line = math.max(edge1, edge2) - 1

  local existing_extmarks = vim.api.nvim_buf_get_extmarks(buf, namespace, { start_line, 0 }, { end_line, -1 }, {})
  local lines_range = end_line - start_line
  for line = start_line, start_line + lines_range, 1 do
    local existing_extmark_id = get_extmark_id_if_exists(line, existing_extmarks)
    if (existing_extmark_id) then
      vim.api.nvim_buf_del_extmark(buf, namespace, existing_extmark_id)
    else
      vim.api.nvim_buf_set_extmark(0, namespace, line, 0, DEFAULT_OPTS)
    end
  end
  -- exit visual mode
  vim.api.nvim_input("<esc>")
end

-- Create autocommands
vim.api.nvim_create_user_command("HighlightToggle", function() return toggle_highlights() end, { nargs = "?" })

-- Keymaps
vim.keymap.set({ "n", "v" }, "<leader>hs", function() vim.cmd(":HighlightToggle") end, { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>hd", function() wipe_extmarks(namespace) end, { silent = true })
