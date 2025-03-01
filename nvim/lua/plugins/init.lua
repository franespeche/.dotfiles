require("plugins._load")

local M = {}

M.setup = function ()
  -- require("plugins.blame").setup()
  require("plugins.neodev")
  require("plugins.telescope")
  require("plugins.harpoon")
  require("plugins.rainbow_csv")
  require("plugins.neotree")
  require("plugins.navic")
  require("plugins.lualine")
  require("plugins.nvim-highlight-colors")
  require("plugins.prettier")
  require("plugins.copilot")
  require("plugins.strawberry")
  require("plugins.extmarks")
  require("plugins.hlchunk")
  require("plugins.neoscroll")
  require("plugins.vimwiki")
  require("plugins.mini")
  require("plugins.copilot")
  require("plugins.outline")
  require("plugins.avante")
  require("plugins.gitsigns")
end

return M
