local navic = require("nvim-navic")
local lspconfig = require('lspconfig')

lspconfig.tsserver.setup {
  icons = {
    File          = "󰈙 ",
    Module        = " ",
    Namespace     = "󰌗 ",
    Package       = " ",
    Class         = "󰌗 ",
    Method        = "󰆧 ",
    Property      = " ",
    Field         = " ",
    Constructor   = " ",
    Enum          = "󰕘",
    Interface     = "󰕘",
    Function      = "󰊕 ",
    Variable      = "󰆧 ",
    Constant      = "󰏿 ",
    String        = "󰀬 ",
    Number        = "󰎠 ",
    Boolean       = "◩ ",
    Array         = "󰅪 ",
    Object        = "󰅩 ",
    Key           = "󰌋 ",
    Null          = "󰟢 ",
    EnumMember    = " ",
    Struct        = "󰌗 ",
    Event         = " ",
    Operator      = "󰆕 ",
    TypeParameter = "󰊄 ",
  },
  lsp = {
    auto_attach = false,
    preference = nil,
  },
  highlight = true,
  separator = " > ",
  depth_limit = 0,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  depth_limit_indicator = "..",
  safe_output = true,
  lazy_update_context = false,
  click = false,
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
    print("navic attached")
  end
}
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"


