-- File: lua/current_blame.lua
local M = {}
local ns = vim.api.nvim_create_namespace("current_blame")

local function clear_blame(buf) vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1) end

local function parse_blame(data)
  local author, author_time, summary
  for _, line in ipairs(data) do
    if line:match("^author ") then
      author = line:sub(8)
    elseif line:match("^author%-time ") then
      local timestamp = tonumber(line:sub(13))
      if timestamp then author_time = os.date("%Y-%m-%d", timestamp) end
    elseif line:match("^summary ") then
      summary = line:sub(9)
    end
  end
  return author, author_time, summary
end

local function run_blame(buf, line_num, filepath)
  -- Using porcelain format for easier parsing.
  local cmd = {
    "git",
    "blame",
    "--line-porcelain",
    "-L",
    line_num .. "," .. line_num,
    "--",
    filepath,
  }
  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    on_stdout = function (_, data)
      if not data or #data == 0 then return end
      local author, author_time, summary = parse_blame(data)
      if author and author_time and summary then
        local virt_text = string.format(" %s • %s • %s",
          vim.trim(author), author_time,
          vim.trim(summary))
        vim.schedule(function ()
          vim.api.nvim_buf_set_extmark(buf, ns, line_num - 1, 0, {
            virt_text = {
              {
                virt_text,
                "Comment",
              },
            },
            virt_text_pos = "eol",
          })
        end)
      end
    end,
    on_stderr = function (_, _)
      -- Optional: handle errors if needed.
    end,
  })
end

function M.update_blame()
  local buf = vim.api.nvim_get_current_buf()
  local filepath = vim.api.nvim_buf_get_name(buf)
  if filepath == "" then return end

  local cursor = vim.api.nvim_win_get_cursor(0)
  local line_num = cursor[1]
  clear_blame(buf)
  run_blame(buf, line_num, filepath)
end

function M.setup(opts)
  opts = opts or {}
  vim.cmd([[
    augroup CurrentBlame
      autocmd!
      autocmd CursorHold * lua require("plugins.blame").update_blame()
      autocmd CursorMoved * lua vim.api.nvim_buf_clear_namespace(0, vim.api.nvim_create_namespace("current_blame"), 0, -1)
    augroup END
  ]])
end

return M
