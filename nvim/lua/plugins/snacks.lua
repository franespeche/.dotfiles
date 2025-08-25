vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  keys = {
    -- explorer
    {
      "<space>ef",
      function()
        -- get current buffer's cwd
        local current_file = vim.fn.expand("%:p")
        local cwd = vim.fn.fnamemodify(current_file, ":h")

        local git_dir = vim.fs.find(".git", {
          upward = true,
          path = cwd,
        })[1]
        local dir = git_dir and vim.fs.dirname(git_dir) or cwd
        Snacks.explorer.open({
          cwd = dir,
          auto_close = true,
        })
      end,
      desc = "Explorer Snacks (cwd)",
    },
    --     {
    --       "<space>e",
    --       function()
    --         Snacks.explorer.open({
    --           cwd = LazyVim.root(),
    --          })
    --       end,
    --       desc = "Explorer Snacks (root dir)",
    --      },
    --     {
    --       "<space>ef",
    --       function()
    --         local current_file = vim.fn.expand("%:p")
    --         Snacks.explorer.open({
    --           cwd = vim.fn.fnamemodify(current_file, ":h"),
    --          })
    --       end,
    --       desc = "Explorer Snacks (cwd)",
    --      },
    --     {
    --       "<space>en",
    --       function()
    --         Snacks.explorer.open({
    --           cwd = "~/.dotfiles/nvim",
    --          })
    --       end,
    --       desc = "Explorer Snacks (cwd)",
    --      },
    --
    --     -- lazygit
    {
      "<leader>gg",
      function() Snacks.lazygit.open() end,
      desc = "Open Lazygit",
    },
    --     {
    --       "<leader>gf",
    --       function() Snacks.lazygit.log_file() end,
    --       desc = "Open Lazygit",
    --      },
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
    -- Lazygit
    lazygit = {
      enabled = true,
      theme = {
        [241] = {
          fg = "Special",
        },
        activeBorderColor = {
          fg = "MatchParen",
          bold = true,
        },
        cherryPickedCommitBgColor = {
          fg = "Identifier",
        },
        cherryPickedCommitFgColor = {
          fg = "Function",
        },
        defaultFgColor = {
          fg = "Normal",
        },
        inactiveBorderColor = {
          fg = "FloatBorder",
        },
        optionsTextColor = {
          fg = "Function",
        },
        searchingActiveBorderColor = {
          fg = "MatchParen",
          bold = true,
        },
        selectedLineBgColor = {
          fg = "Search",
          bg = "Visual",
        }, -- set to `default` to have no background colour
        unstagedChangesColor = {
          fg = "DiagnosticError",
        },
      },
    },
    -- Pretty vim.notify
    notifier = {
      enabled = true,
      timeout = 30000,
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
    -- explor
    explorer = {
      -- open the first .git parent dir (fallbacks to cwd)
      cwd = function()
        print("Snacks cwd")
        local cwd = vim.loop.cwd()
        local git_dir = vim.fs.find(".git", {
          upward = true,
          path = cwd,
        })[1]
        return
      end,
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
