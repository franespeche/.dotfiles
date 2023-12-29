Opts = { noremap = true, silent = true }
Keymap = vim.keymap.set

require('config.settings')
require('config.autocommands')
require('config.coc')
require('config.telescope')
require('config.git')
