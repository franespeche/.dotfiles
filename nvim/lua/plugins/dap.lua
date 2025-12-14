return {
  {
    "mxsdev/nvim-dap-vscode-js",
    config = function()
      require("dap-vscode-js").setup {
        adapters = {
          "pwa-node",
          "pwa-chrome",
          "pwa-msedge",
          "node-terminal",
          "pwa-extensionHost",
         },
       }
      local dap = require "dap"
      for _, language in ipairs {
        "typescript",
        "javascript",
       } do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
           },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
           },
         }
      end
    end,
   },
  {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
   },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio", -- nvim-dap-ui dependency
      "theHamsta/nvim-dap-virtual-text", -- shows variable values inline as virtual text

     },
    keys = {
      {
        "<leader>Dc",
        function() require("dap").continue() end,
        desc = "Debug: Start/Continue",
       },
      {
        "<leader>Dsi",
        function() require("dap").step_into() end,
        desc = "Debug: Step Into",
       },
      {
        "<leader>DsO",
        function() require("dap").step_over() end,
        desc = "Debug: Step Over",
       },
      {
        "<leader>Dso",
        function() require("dap").step_out() end,
        desc = "Debug: Step Out",
       },
      {
        "<leader>Db",
        function() require("dap").toggle_breakpoint() end,
        desc = "Debug: Toggle Breakpoint",
       },
      {
        "<leader>DB",
        function()
          require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
        end,
        desc = "Debug: Set Conditional Breakpoint",
       },
      {
        "<leader>Dt",
        function() require("dapui").toggle() end,
        desc = "Debug: Toggle UI",
       },
      {
        "<leader>Dl",
        function() require("dap").run_last() end,
        desc = "Debug: Run Last Configuration",
       },
     },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      -- Dap UI setup
      dapui.setup {
        icons = {
          expanded = "▾",
          collapsed = "▸",
          current_frame = "*",
         },
        controls = {
          icons = {
            pause = "⏸",
            play = "▶",
            step_into = "⏎",
            step_over = "⏭",
            step_out = "⏮",
            step_back = "b",
            run_last = "▶▶",
            terminate = "⏹",
            disconnect = "⏏",
           },
         },
       }

      -- Automatically open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close

      -- Setup virtual text to show variable values inline
      require("nvim-dap-virtual-text").setup()
    end,
   },
 }
