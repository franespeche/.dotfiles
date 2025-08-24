return {
  -- lazygit
  {
    "kdheepak/lazygit.nvim",
    enabled = false,
   },

  -- fugitive
  {
    "tpope/vim-fugitive",
    dependencies = {
      "tpope/vim-rhubarb", -- fugitive's hub
     },
   },
 }
