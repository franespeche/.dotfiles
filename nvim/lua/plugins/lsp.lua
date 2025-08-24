return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    enabled = false,
    dependencies = {
      "tjdevries/coc-zsh",
      "antoinemadec/coc-fzf",
     },
    init = function()
      -- helpers
      local function show_documentation()
        local filetype = vim.bo.filetype
        local cword = vim.fn.expand("<cword>")

        if vim.fn.index({
          "help",
         }, filetype) >= 0 then
          vim.cmd("h " .. cword)
        else
          if vim.fn.index({
            "lua",
           }, filetype) >= 0 then
            vim.lsp.buf.hover()
          else
            vim.fn.CocAction("doHover")
          end
        end
      end

      vim.g.coc_global_extensions = {
        "coc-tsserver",
        "coc-json",
        "coc-lua",
        "coc-yaml",
        "coc-pyright",
       }
      vim.g.jsx_ext_required = 0 -- enable JSX syntax highlighing in javascript files

      vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
      vim.opt.updatetime = 300

      vim.cmd([[ command! -nargs=0 Prettier :CocCommand prettier.formatFile ]])
      vim.cmd([[ highlight link CocHighlightText Visual ]])
      vim.cmd(
          [[ inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" ]])

      -- definitions
      vim.keymap.set("n", "gd", "<Plug>(coc-definition)zz", Opts)
      vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", Opts)
      vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", Opts)
      vim.keymap.set("n", "gr", "<Plug>(coc-references)", Opts)

      -- restart
      vim.keymap.set("n", "<leader>cr", ":CocRestart<cr> ", Opts)
      vim.keymap
          .set("n", "<leader>tr", ":CocCommand tsserver.restart<cr>", Opts)

      -- either doHover or show documentation in preview window
      vim.keymap.set("n", "<leader>ck", function() show_documentation() end,
                     Opts)
      vim.keymap.set("n", "<leader>ch", "<Plug>(coc-codeaction)", Opts)

      -- diagnostics
      vim.keymap.set("n", "<leader>cc", ":CocFzfList diagnostics<cr>", Opts)
      vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", Opts)
      vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", Opts)

      -- actions
      vim.keymap.set("n", "<leader>cl",
                     ":<C-u>call CocActionAsync('codeLensAction')<CR>", Opts)

      local au = vim.api.nvim_create_autocmd
      local aug = vim.api.nvim_create_augroup
      -- autocommands
      -- coc
      aug("coc-custom", {
        clear = true,
       })
      au("FileType", {
        pattern = "typescript,json",
        group = "coc-custom",
        command = "setl formatexpr=CocAction('formatSelected')",
        desc = "setup formatexpr specified filetype(s)",
       })
      au("User", {
        pattern = "CocJumpPlaceholder",
        group = "coc-custom",
        command = "CocActionAsync('showSignatureHelp')",
        desc = "update signature help on jump placeholder",
       })
      au("BufEnter", {
        desc = "disables autocommenting",
        command = "set fp-=c fo-=r fo-=o",
       })
    end,
   },

  -- lspconfig: NOT NEEDED SINCE USING MASON-LSPCONFIG
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    event = {
      "BufReadPre",
      "BufNewFile",
     },
    --[[
    config = function()
      local lspconfig = require("lspconfig")

      -- example: Lua (Neovim config)
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = {
                "vim",
               },
             },
            workspace = {
              checkThirdParty = false,
             },
           },
         },
       })

      -- add more servers as you install them
      -- lspconfig.pyright.setup({})
      -- lspconfig.tsserver.setup({})
    end,
    --[[
    opts = function()
      local out = {
        servers = {
          lua_ls = {
            settings = {
              Lua = {
                diagnostics = {
                  globals = {
                    "vim",
                    "Snacks",
                   }, -- Make 'vim' a known global
                 },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false, -- (Optional) Disable third-party checks
                 },
                telemetry = {
                  enable = false, -- (Optional) Disable telemetry
                 },
               },
             },
           },
         },
        setup = {},
       }
      return out
    end,
        ]] --
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
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      local map = function(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs) end
      map("n", "gd", vim.lsp.buf.definition)
      map("n", "<leader>ck", vim.lsp.buf.hover)
      map("n", "<leader>rn", vim.lsp.buf.rename)
      map("n", "<leader>ca", vim.lsp.buf.code_action)
      -- shared setup
      local on_attach = function(client, bufnr)
        print("Attached to " .. client.name)
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- tell Mason which servers to auto-install and set up handlers
      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "pyright",
         },
        handlers = {
          -- default handler for all servers
          function(server)
            print("Setting up " .. server)
            lspconfig[server].setup({
              on_attach = on_attach,
              capabilities = capabilities,
             })
          end,

         },
       })
    end,
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
