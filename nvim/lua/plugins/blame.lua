local config = require("config")

-- minimal-line-blame.nvim
local M = {}
local api = vim.api

local blame_ns = api.nvim_create_namespace("minimal_line_blame")

local function get_blame_info(bufnr, lnum)
  local filepath = api.nvim_buf_get_name(bufnr)
  local cmd = string.format("git -C %s blame -L%d,%d --porcelain -- %s",
    vim.fn.fnamemodify(filepath, ":h"), lnum, lnum,
    filepath)
  local result = vim.fn.systemlist(cmd)

  if vim.v.shell_error ~= 0 or vim.tbl_isempty(result) then return nil end

  local author = result[2]:match("^author (.+)$") or "Unknown"
  local date = result[3]:match("^author%-time (.+)$")
  local summary
  for _, line in ipairs(result) do
    summary = line:match("^summary (.+)$")
    if summary then break end
  end
  summary = summary or ""

  return string.format("%s • %s • %s", author,
    os.date("%Y-%m-%d", tonumber(date)), summary)
end

function M.show_blame()
  if not config.get("line_blame") then return end

  local bufnr = api.nvim_get_current_buf()
  local line_nr = api.nvim_win_get_cursor(0)[1]

  api.nvim_buf_clear_namespace(bufnr, blame_ns, 0, -1)
  local blame = get_blame_info(bufnr, line_nr)

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
    end
  else
    M.show_blame()
  end
end

function M.setup()
  vim.g.line_blame = config.get("line_blame")
  api.nvim_create_autocmd({
    "CursorHold",
    "CursorMoved",
  }, {
    callback = M.show_blame,
  })

  vim.api.nvim_create_user_command("LineBlameToggle", M.toggle, {})
end

M.is_enabled = function () return config.get("line_blame") end

return M
