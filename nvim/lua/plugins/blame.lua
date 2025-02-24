local config = require("config")

-- minimal-line-blame.nvim
local M = {}
local api = vim.api

local blame_ns = api.nvim_create_namespace("minimal_line_blame")
local blame_cache = {}

local function compute_blame_for_buffer(bufnr)
  local filepath = api.nvim_buf_get_name(bufnr)
  local cmd = string.format("git -C %s blame --porcelain -- %s",
    vim.fn.fnamemodify(filepath, ":h"), filepath)
  local result = vim.fn.systemlist(cmd)

  if vim.v.shell_error ~= 0 or vim.tbl_isempty(result) then return end

  blame_cache[bufnr] = {}
  local line_number = 0

  for _, line in ipairs(result) do
    if line:match("^author ") then
      line_number = line_number + 1
      local author = line:match("^author (.+)$") or "Unknown"
      local date = result[_ + 1]:match("^author%-time (.+)$")
      local summary
      for i = _ + 2, #result do
        summary = result[i]:match("^summary (.+)$")
        if summary then break end
      end
      summary = summary or ""
      blame_cache[bufnr][line_number] = string.format("%s • %s • %s",
        author, os.date(
          "%Y-%m-%d",
          tonumber(date)),
        summary)
    end
  end
end

function M.show_blame()
  if not config.get("line_blame") then return end

  local bufnr = api.nvim_get_current_buf()
  local line_nr = api.nvim_win_get_cursor(0)[1]

  api.nvim_buf_clear_namespace(bufnr, blame_ns, 0, -1)

  -- Use cached blame information
  local blame = blame_cache[bufnr] and blame_cache[bufnr][line_nr]

  if blame then
    api.nvim_buf_set_extmark(bufnr, blame_ns, line_nr - 1, -1, {
      virt_text = {
        {
          blame,
          "Comment",
        },
      },
      virt_text_pos = "eol",
      hl_mode = "combine",
    })
  end
end

function M.toggle()
  local enabled = not config.get("line_blame")
  P(enabled)
  config.set("line_blame", enabled)

  if not enabled then
    for _, bufnr in ipairs(api.nvim_list_bufs()) do
      api.nvim_buf_clear_namespace(bufnr, blame_ns, 0, -1)
      blame_cache[bufnr] = nil -- Clear cache when disabled
    end
  else
    M.show_blame()
  end
end

function M.setup()
  vim.g.line_blame = config.get("line_blame")
  api.nvim_create_autocmd("BufReadPost", {
    callback = function ()
      local bufnr = api.nvim_get_current_buf()
      compute_blame_for_buffer(bufnr)
    end,
  })

  api.nvim_create_autocmd({
    "CursorHold",
    "CursorMoved",
  }, {
    callback = M.show_blame,
  })

  api.nvim_create_autocmd("BufWritePost", {
    callback = function ()
      local bufnr = api.nvim_get_current_buf()
      compute_blame_for_buffer(bufnr) -- Recompute blame on buffer write
    end,
  })

  vim.api.nvim_create_user_command("LineBlameToggle", M.toggle, {})
end

M.is_enabled = function () return config.get("line_blame") end

return M
