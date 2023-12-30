Opts = { noremap = true, silent = true }
Keymap = vim.keymap.set

require('config.settings')
require('config.theme')
require('config.autocommands')
require('config.coc')
require('config.neodev')
require('config.lspconfig')
require('config.telescope')
require('config.git')
