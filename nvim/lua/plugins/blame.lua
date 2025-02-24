local config = require("config")

-- File: lua/current_blame.lua
local M = {}
local ns = vim.api.nvim_create_namespace("current_blame")

local function clear_blame(buf) vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1) end

function M.update_blame()
  local buf = vim.api.nvim_get_current_buf()
  local filepath = vim.api.nvim_buf_get_name(buf)
  if filepath == "" then return end

  local cursor = vim.api.nvim_win_get_cursor(0)
  local line_num = cursor[1]
  clear_blame(buf)

  -- Build git blame command for the current line.
  local cmd = {
    "git",
    "blame",
    "-L",
    line_num .. "," .. line_num,
    "--",
    filepath,
  }
  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    on_stdout = function (_, data)
      if not data or #data == 0 then return end
      local blame_line = table.concat(data, " ")
      -- Simple parse: extract author and commit info similar to gitsigns.nvim.
      local author = blame_line:match("%((.-)%s+%d%d%d%d")
      if author then
        local virt_text = " " .. vim.trim(author)
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
    on_stderr = function (_, data)
      -- Optional: handle errors or fallback silently.
    end,
  })
end

function M.setup(opts)
  opts = opts or {}
  return vim.cmd([[
    augroup CurrentBlame
      autocmd!
      autocmd CursorHold * lua require("plugins.blame").update_blame()
      autocmd CursorMoved * lua vim.api.nvim_buf_clear_namespace(0, vim.api.nvim_create_namespace("plugins.blame"), 0, -1)
    augroup END
  ]])
end

return M
