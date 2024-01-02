local recent_files = require('strawberry.recent_files')

-- TODO: make this better
local all_sections = { recent_files }

local U = {
  get_enabled_sections = function(sections)
    local items = {}
    for section_name, config in pairs(sections) do
      if (config.enabled) then
        table.insert(items, { [section_name] = config })
      end
    end
    return items
  end
}

local M = {
  config = {
    sections = {
      recent_files= {
        enabled = true,
        config = {}
      }
    },
    auto_start = true
  },
  sections = {}
}

M.apply_sections = function(sections)
  M.sections = sections
end

M.setup = function (opts)
  local opts = opts or {}
  -- get parsed config
  -- apply config
  -- get enabled sections
  local sections = U.get_enabled_sections(opts.config.sections)
  M.apply_sections(sections)
  -- cycle through sections and setup them
  for section_name, section in pairs(M.sections) do
    -- TODO: implement this

  end
  -- create autocommand VimEnter
    -- get list of oldfiles items
      -- filter them by git-is-in-working-tree if specified
    -- store list in a variable
      -- create Strawberry.addList(list: Table<string>, { name: string })
-- run module

end

--[[
--
-- Types
--
enum SectionName {
  RECENT_FILES = 'recent-files'
}

enum RecentFilesSource {
  ALL = 'all'
  GIT_WORKING_TREE = 'git-working-tree'
  GIT_MODIFIED = 'git-modified'
}

type RecentFilesConfig = {
    items_amount: number -- 5
    source: RecentFilesSource -- all
    enabled: boolean -- true
  }

-- Strawberry
--
-- U
-- M
  - config = {
    sections: { 
      recent_files: {
        enabled: boolean
        config: RecentFilesConfig
      }
    }
    auto_start: boolean = true
  }
  - setup()
    - get config
    - apply config
    - set autocommand
      - VimEnter
  - show()
    - create_buffer(): bufn
    - display_buffer(): buf
    - render_sections(): Table<Section>
  - hide()
    - remove_buffer(): nil

  -- Recent Files
  --
  -- U.RecentFiles
    - is_git_repo(): boolean
    - is_git_working_tree(): boolean
    - if_file_readable(): boolean
    - get_recent_files(source: RecentFilesSource): string[]
    - parse_config(config: RecentFilesConfig): RecentFilesConfig
    - apply_config(config: RecentFilesConfig): RecentFilesConfig
  --
  -- M.RecentFiles
    - config = {
      items_amount = 5
      source = "all"
      private enabled = true,
    }


  ]]--
M.open = function (opts)

end

