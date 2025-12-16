return {
  "github/copilot.vim",
  enabled = true,
  init = function()
    vim.g.copilot_filetypes = {
      vimwiki = false,
      json = false,
     }
    vim.keymap.set("i", "<C-j>", "copilot#Accept(\"\\<CR>\")", {
      expr = true,
      replace_keycodes = false,
     })
    vim.g.copilot_no_tab_map = true
  end,
 }
