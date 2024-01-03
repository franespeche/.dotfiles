local apply_config = require('plugins.strawberry.utils').apply_config
local RecentFilesSource = require('plugins.strawberry.types').RecentFilesSource

local SECTIONS = {
  recent_files = function() return require('plugins.strawberry.recent_files') end,
}

-- Utils
local U = {}

-- filter enabled sections
U.get_enabled_sections = function(sections)
    local items = {}
    for section_name, section in pairs(sections) do
      if (section.enabled) then
        items[section_name] = section
      end
    end
    return items
  end

-- Strawberry Content
local C = {}
C._content = {}

C.add_content = function(content)
  local lines_amount = #C._content
  if (type(content) == "string") then
    C._content[lines_amount + 1] = content
  else
    for i, line in ipairs(content) do
      C._content[lines_amount + i] = line
    end
  end
end

C.add_v_spacer = function (spacing_amount)
  local current_content_lines_amount = #C._content
  for i=1, spacing_amount do
    C._content[current_content_lines_amount + i] = ''
  end
end

C.get_content = function()
  return C._content
end

-- Strawberry App
local M = { }

-- default config
M.config = {
    sections = {
      recent_files= {
        title = "Recent Files",
        config = {},
        action = "",
        enabled = true,
      }
    },
    auto_start = true
  }

-- states
M._sections = {}
M._content = {}
M._content_in_lines = {}

-- methods
--
-- gets amount of lines in the content
M.get_content_length = function()
  return #M._content
end

-- merges a given config with the given Module's config and applies it to the Module
-- @param: opt, config override
-- @returns: Module
M.apply_config = function (opts) return apply_config(opts, M) end

M.apply_sections = function(sections, opts)
  for section_name, section in pairs(sections) do
    section = SECTIONS[section_name]().setup(opts)
    table.insert(M._sections, section)
  end
  return M._sections
end

M.add_content = function (content)
  M._content = content
end

M.insert_v_spacer = function (spacing_amount)
  local current_content_lines_amount = #M.content_in_lines
  for i=1, spacing_amount do
    M.content_in_lines[current_content_lines_amount + i] = ''
  end
end

M.get_content = function()
  return M._content
end

M.open = function (opts)
  -- add content to buffer
  local buf_id = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf_id, 'modifiable', true)
  vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, M.get_content())
  vim.api.nvim_buf_set_option(buf_id, 'modifiable', false)

  -- display buffer
  vim.api.nvim_set_current_buf(buf_id)
end

M.setup = function (opts)
  opts = opts or {}

  -- apply config
  local config = M.apply_config(opts)

  -- apply enabled sections
  local sections = M.apply_sections(U.get_enabled_sections(config.sections), opts)

  -- update Strawberry Content with for section
  for i, section in pairs(sections) do
    -- add section's title
    C.add_content(section.title)
    C.add_v_spacer(1)

    -- add section's content
    C.add_content(section.get_content())
    if (i ~= #sections) then
      C.add_v_spacer(2)
    end
  end

  M.add_content(C.get_content())

  M.open()

end

M.setup({ config = { sections = { recent_files = { config = { source = RecentFilesSource.GIT_MODIFIED }}}} })


