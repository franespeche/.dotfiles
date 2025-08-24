return {
  -- prompt-debug
  {
    dir = "~/nvim-plugins/prompt-debug/",
    name = "prompt-debug",
    config = function() require("prompt-debug") end,
   },
  -- quickfix-lint
  {
    dir = "~/nvim-plugins/quickfix-lint/",
    name = "quickfix-lint",
    config = function() require("quickfix-lint") end,
   },
  -- lua
  {
    "folke/lua-dev.nvim",
   },
  {
    enabled = false,
    "rafcamlet/nvim-luapad",
   },
  {
    "milisims/nvim-luaref",
   },

  -- vim
  {
    enabled = false,
    -- debugging tools
    "tpope/vim-scriptease",
   },

  -- scope context
  {
    enabled = true,
    "nvim-treesitter/nvim-treesitter-context",
   },

 }
