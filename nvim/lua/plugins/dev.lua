return {
  -- prompt-debug
  {
    dir = "~/nvim-plugins/prompt-debug/",
    enabled = false,
    name = "prompt-debug",
    config = function() require("prompt-debug") end,
  },

  -- quickfix-lint
  {
    dir = "~/nvim-plugins/quickfix-lint/",
    name = "quickfix-lint",
    enabled = false,
    config = function() require("quickfix-lint") end,
  },

  -- lua
  { "folke/neodev.nvim", enabled = true, event = "DebugModeEnable" }, -- note: this might not be needed since we are already adding $RUNTIME paths to lua_ls
  { "milisims/nvim-luaref", ft = { "lua" } },

  -- vim
  { "tpope/vim-scriptease", enabled = true },
  -- scope context
  {
    enabled = false, -- TODO: enabling this causes pain with mini.jump
    "nvim-treesitter/nvim-treesitter-context",
  },
}
