require("plugins._load")

local M = {}

M.setup = function()
  -- require("plugins.blame").setup()
  require("plugins.neodev")
  require("plugins.harpoon")
  require("plugins.prettier")
  require("plugins.copilot")
  require("plugins.extmarks")
  require("plugins.neoscroll")
  require("plugins.vimwiki")
  require("plugins.mini")
  require("plugins.copilot")
  require("plugins.gitsigns")
end

return M
