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
  if (type(content) == "string") then
    C._content[#C._content + 1] = content
  else
    for i, line in ipairs(content) do
      C._content[#C._content + i] = line
    end
  end
end

C.add_v_space = function (spacing_amount)
  for i=1, spacing_amount do
    C._content[#C._content + i] = ''
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

-- methods

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
    C.add_v_space(1)

    -- add section's content
    C.add_content(section.get_content())
    if (i ~= #sections) then
      C.add_v_space(2)
    end
  end

  M.add_content(C.get_content())

  M.open()

end

M.setup({ config = { sections = { recent_files = { config = { source = RecentFilesSource.GIT_MODIFIED }}}} })


