--[[
https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
https://github.com/nanotee/nvim-lua-guide#defining-mappings

:help nvim_create_user_command
:help command-attributes

:help nvim_create_autocmd
:help autocmd
]]

-- recursive prop
-- vim.keymap.set('n', '*', '*zz', { remap = true, desc = "Search and center screen" })

vim.keymap.set('n', 'Q', function()
  print('Hello')
end, {desc = 'Say hello'})

vim.keymap.set('n', '*', '*zz', { desc = "Search and center screen" })

vim.api.nvim_create_user_command(
  'ProjectFiles',
  function(input)
    vim.call('fzf#vim#files', '~/projects', input.bang)
  end,
  {bang = true, desc = 'Search projects folder'}
)
