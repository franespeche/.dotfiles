local lspconfig = require('lspconfig')
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
  end

-- lua
lspconfig.lua_ls.setup {
    on_attach = on_attach,
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
}

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
}
