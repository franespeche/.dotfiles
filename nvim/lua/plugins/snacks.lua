return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  keys = {
    -- explorer
    {
      "<space>e",
      function()
        Snacks.explorer.open({
          cwd = LazyVim.root(),
         })
      end,
      desc = "Explorer Snacks (root dir)",
     },
    {
      "<space>E",
      function() Snacks.explorer() end,
      desc = "Explorer Snacks (cwd)",
     },

    -- lazygit
    {
      "<leader>gg",
      function() Snacks.lazygit.open() end,
      desc = "Open Lazygit",
     },
    {
      "<leader>lgf",
      function() Snacks.lazygit.log_file() end,
      desc = "Open Lazygit",
     },
    {
      "<leader>lzl",
      function() Snacks.lazygit.log() end,
      desc = "Open Lazygit",
     },
   },
  opts = {
    -- Efficient animations including over 45 easing functions (library)	
    animate = {
      enabled = false,
     },
    -- Deal with big files	
    bigfile = {
      enabled = false,
     },
    -- Delete buffers without disrupting window layout	
    bufdelete = {
      enabled = false,
     },
    -- Beautiful declarative dashboards	
    dashboard = {
      enabled = false,
     },
    -- Pretty inspect & backtraces for debugging	
    debug = {
      enabled = false,
     },
    -- Focus on the active scope by dimming the rest	
    dim = {
      enabled = true,
     },
    -- A file explorer (picker in disguise)	
    explorer = {
      enabled = true,
      replace_netrw = true,
     },
    -- Git utilities	
    git = {
      enabled = false,
     },
    -- Open the current file, branch, commit, or repo in a browser (e.g. GitHub, GitLab, Bitbucket)	
    gitbrowse = {
      enabled = false,
     },
    -- Image viewer using Kitty Graphics Protocol, supported by kitty, wezterm and ghostty	
    image = {
      enabled = false,
     },
    -- Indent guides and scopes	
    indent = {
      enabled = true,
     },
    -- Better vim.ui.input
    input = {
      enabled = true,
     },
    -- Window layouts	
    layout = {
      enabled = false,
     },
    -- Open LazyGit in a float, auto-configure colorscheme and integration with Neovim	
    lazygit = {
      enabled = true,
     },
    -- Pretty vim.notify	
    notifier = {
      enabled = true,
      timeout = 3000,
      width = {
        min = 40,
        max = 0.4,
       },
      height = {
        min = 1,
        max = 0.6,
       },
      -- editor margin to keep free. tabline and statusline are taken into account automatically
      margin = {
        top = 0,
        right = 1,
        bottom = 0,
       },
      padding = true, -- add 1 cell of left/right padding to the notification window
      sort = {
        "level",
        "added",
       }, -- sort by level and time
      -- minimum log level to display. TRACE is the lowest
      -- all notifications are stored in history
      level = vim.log.levels.TRACE,
      icons = {
        error = " ",
        warn = " ",
        info = " ",
        debug = " ",
        trace = " ",
       },
      keep = function(notif) return vim.fn.getcmdpos() > 0 end,
      ---@type snacks.notifier.style
      style = "minimal", -- 'compact' | 'minimal' | 'fancy'
      top_down = true, -- place notifications from top to bottom
      date_format = "%R", -- time format for notifications
      -- format for footer when more lines are available
      -- `%d` is replaced with the number of lines.
      -- only works for styles with a border
      ---@type string|boolean
      more_format = " ↓ %d lines ",
      refresh = 50, -- refresh at most every 50ms
     },
    -- Utility functions to work with Neovim's vim.notify	
    notify = {
      enabled = false,
     },
    -- Picker for selecting items	
    picker = {
      enabled = true,
     },
    -- Neovim lua profiler	
    profiler = {
      enabled = false,
     },
    -- When doing nvim somefile.txt, it will render the file as quickly as possible, before loading your plugins.	
    quickfile = {
      enabled = false,
     },
    -- LSP-integrated file renaming with support for plugins like neo-tree.nvim and mini.files.	
    rename = {
      enabled = false,
     },
    -- Scope detection, text objects and jumping based on treesitter or indent	
    scope = {
      enabled = true,
     },
    -- Scratch buffers with a persistent file	
    scratch = {
      enabled = false,
     },
    -- Smooth scrolling	
    scroll = {
      enabled = true,
     },
    -- Pretty status column	
    statuscolumn = {
      enabled = false,
     },
    -- Create and toggle floating/split terminals	
    terminal = {
      enabled = false,
     },
    -- Toggle keymaps integrated with which-key icons / colors	
    toggle = {
      enabled = false,
     },
    -- Utility functions for Snacks (library)	
    util = {
      enabled = false,
     },
    -- Create and manage floating windows or splits	
    win = {
      enabled = false,
     },
    -- Auto-show LSP references and quickly navigate between them	
    words = {
      enabled = false,
     },
    -- Zen mode • distraction-free coding	
    zen = {
      enabled = false,
     },
   },
 }
