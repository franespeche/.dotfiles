-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
local lspconfig = require("lspconfig")
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then navic.attach(client, bufnr) end
end

local POETRY_VENV_PATH = os.getenv("POETRY_VENV_PATH")

-- lua
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim",
          "describe",
          "Snacks",
          "P",
        },
      },
      completion = {
        callSnippet = "Replace",
      },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.stdpath("data") .. "/lazy", -- plugin install dir (Lazy.nvim)
          vim.fn.stdpath("config") .. "/lua",
        },
        maxPreload = 2000,
        preloadFileSize = 50000,
      },
      -- Optionally configure module path mapping
      runtime = {
        -- LuaJIT in the case of Neovim
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ";"),
      },
      -- Telemetry settings (optional)
      telemetry = {
        enable = false,
      },
    },
  },
})

lspconfig.pyright.setup({
  root_dir = POETRY_VENV_PATH or lspconfig.pyright.root_dir,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
      },
    },
  },
})
