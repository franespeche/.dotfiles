return {
  "vimwiki/vimwiki",
  keys = {
    {
      "<leader>tl",
      ':VimwikiToggleListItem<cr>',
      mode = "x",
    },
    {
      "<leader>tl",
      ':VimwikiToggleListItem<cr>',
      mode = "x",
    },
  },
  init = function ()
    vim.g.vimwiki_list = {
      {
        path = "~/vimwiki/",
        syntax = "markdown",
        ext = ".md",
      },
    }
  end,
}
