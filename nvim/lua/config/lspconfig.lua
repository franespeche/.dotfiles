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

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, Opts)
vim.keymap.set('n', '<leader>ch', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>cc', vim.diagnostic.setloclist)
Keymap("n", "<leader>cr", ":LspRestart<cr> ", Opts)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, Opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, Opts)
    vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, Opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, Opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, Opts)
    vim.keymap.set('n', '<leader>ck', vim.lsp.buf.hover, Opts)
    vim.keymap.set('n', '<leader>ch', vim.lsp.buf.signature_help, Opts)
    vim.keymap.set('n', '<space>wl', function()

      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, Opts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, Opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, Opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, Opts)
    -- vim.keymap.set('n', '<space>f', function()
      -- vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})
