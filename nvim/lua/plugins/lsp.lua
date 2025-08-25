return {
  -- lspconfig: NOT NEEDED SINCE USING MASON-LSPCONFIG
  {
    "neovim/nvim-lspconfig",
    enabled = true,
  },

  -- mason
  {
    "williamboman/mason.nvim",
    opts = {},
  },

  -- Mason <-> LSPConfig bridge
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = true,
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    keys = {
      {
        "<leader>M",
        "<cmd>Mason<cr>",
        desc = "Mason",
      },
      {
        "gd",
        vim.lsp.buf.definition,
        desc = "Go to Definition",
      },
      {
        "<leader>ck",
        vim.lsp.buf.hover,
        desc = "Hover Documentation",
      },
      {
        "<leader>rn",
        vim.lsp.buf.rename,
        desc = "Rename Symbol",
      },
      {
        "<leader>ca",
        vim.lsp.buf.code_action,
        desc = "Code Action",
      },
    },
    opts = {
      lua_ls = {
        on_attach = function(client, bufnr)
          -- Disable formatting for lua_ls to avoid conflicts with other formatters
          print("holas")
        end,
        settings = {
          Lua = {
            diagnostics = {
              globals = {
                "vim",
              },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      },

      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "pyright",
        "jsonls",
      },
    },
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip", -- for LuaSnip
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({
            select = true,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        }),
        sources = {
          {
            name = "nvim_lsp",
          },
          {
            name = "luasnip",
          },
          {
            name = "buffer",
          },
          {
            name = "path",
          },
        },
      })
    end,
  },
}
