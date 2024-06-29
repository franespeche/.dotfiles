local create_menu_item = require("strawberry").create_menu_item

-- helpers
local function get_home_path() return os.getenv("HOME") end

local function remove_home_path(file)
  local home = get_home_path()
  return string.gsub(file, home .. "/", "")
end

local function get_filename(path)
  local pattern = "/([^/]+)$"
  return path:match(pattern) or "-"
end

local function is_git_directory() return vim.api.nvim_exec("!git rev-parse --is-inside-work-tree", true) end

-- actions
local show_git_worktree_recent_files = {
  name = "show_git_worktree_recent_files",
  format_value = function(v) return (remove_home_path(v)) end,
  callback = function(limit)
    if (not is_git_directory()) then error("Not inside a git working tree") end

    limit = limit or 15

    local oldfiles = vim.v.oldfiles
    local menu_items = {}
    local git_root_dir = vim.fn.system("git rev-parse --show-toplevel")

    local i = 1
    while (i <= #oldfiles and (#menu_items < limit or i < 10)) do
      local file = oldfiles[i]
      if (vim.fn.filereadable(file) == 1 and vim.startswith(vim.trim(file), vim.trim(git_root_dir))) then
        local menu_item = create_menu_item(#menu_items + 1, file, get_filename(file))
        table.insert(menu_items, menu_item)
      end
      i = i + 1
    end
    return menu_items
  end,
}

local function is_copilot_enabled()
  local status_output = vim.api.nvim_exec(":Copilot status", true)
  local is_enabled = nil

  -- this seems a little bit hacky <(-_-<)
  if status_output:match("Copilot: Disabled globally by :Copilot disable") then
    is_enabled = false
  elseif status_output:match("Copilot: Ready") then
    is_enabled = true
  end

  return is_enabled
end

local function toggle_copilot()
  local is_enabled = is_copilot_enabled()
  -- TODO: store this variable in a global variable and use it in lualine
  if is_enabled == true then
    print("Copilot enabled")
    vim.api.nvim_command("Copilot disable")
  else
    print("Copilot disabled")
    vim.api.nvim_command("Copilot enable")
    return
  end
end

local show_custom_menu = {
  name = "show_custom_menu",
  format_value = function(v) return v end,
  callback = function()
    local menu_items = {}
    -- TODO: pass in a function for the title which can dynamically change by reading a global variable, for example
    local menuItem = create_menu_item(1, "", "copilot", toggle_copilot)
    table.insert(menu_items, menuItem)
    return menu_items
  end,
}

local show_recent_files = {
  name = "show_recent_files",
  format_value = function(v) return (remove_home_path(v)) end,
  callback = function(limit)
    limit = limit or 15

    local oldfiles = vim.v.oldfiles
    local menu_items = {}

    local i = 1
    while (i <= #oldfiles and (#menu_items < limit or i < 10)) do
      local file = oldfiles[i]
      if (vim.fn.filereadable(file) == 1) then
        local menu_item = create_menu_item(#menu_items + 1, file, get_filename(file))
        table.insert(menu_items, menu_item)
      end
      i = i + 1
    end
    return menu_items
  end,
}

local show_active_buffers = {
  name = "show_active_buffers",
  callback = function()
    P("asdad")
    return ""

    -- local limit = 15

    -- local bufs = vim.fn.buffers("ah")
    -- local menu_items = {}

    -- local i = 1
    -- while (i <= #bufs and (#menu_items < limit or i < 10)) do
    -- local buf = bufs[i]
    -- if (vim.api.nvim_buf_is_loaded(buf)) then
    -- local name = vim.api.nvim_buf_get_name(buf)
    -- local menu_item = create_menu_item(#menu_items + 1, name, name, false)
    -- table.insert(menu_items, menu_item)
    -- end
    -- i = i + 1
    -- end
  end,
}

-- setup
require("strawberry"):setup({
  actions = { show_git_worktree_recent_files, show_recent_files, show_active_buffers, show_custom_menu },
  config = { window_height = 5 },
})

-- keymaps
Keymap("n", "<leader>rf", ":Strawberry show_git_worktree_recent_files<cr>", Opts)
Keymap("n", "<leader>rm", ":Strawberry show_custom_menu<cr>", Opts)
Keymap("n", "<leader>rb", ":Strawberry show_active_buffers<cr>", Opts)
