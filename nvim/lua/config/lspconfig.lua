-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require"neodev".setup {}

local lspconfig = require "lspconfig"
local navic = require "nvim-navic"

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then navic.attach(client, bufnr) end
end

-- lua
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  -- capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = { Lua = { diagnostics = { globals = { "describe" } }, completion = { callSnippet = "Replace" } } },
}

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
}
