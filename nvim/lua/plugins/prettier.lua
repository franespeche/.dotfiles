vim.g['prettier#autoformat'] = 1                 -- enable auto formatting of files that have "@format" or "@prettier" tag
vim.g['prettier#autoformat_require_pragma'] = 0  -- allow auto formatting for files without "@format" or "@prettier" tag
vim.g['prettier#autoformat_config_present'] = 1  -- toggle the g:prettier#autoformat setting based on whether a config file can be found in the current directory or any parent directory. Note that this will override the g:prettier#autoformat setting!
