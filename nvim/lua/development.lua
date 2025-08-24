local Plug = vim.fn["plug#"]
local dataPath = vim.fn["stdpath"]("data") .. "/plugged"

vim.api.nvim_create_user_command("RunTS", function()
  local file = vim.fn.expand("%")
  vim.cmd("split term://yarn start " .. file)
end, {})
vim.keymap.set("n", "<leader>yr", ":RunTS<CR>", {
  silent = true,
})

return {
  enable = function()
    vim.call("plug#begin", dataPath)
    Plug("folke/neodev.nvim")
    Plug("hrsh7th/cmp-nvim-lsp")
    Plug("hrsh7th/cmp-buffer")
    Plug("hrsh7th/cmp-path")
    Plug("hrsh7th/cmp-cmdline")
    Plug("hrsh7th/cmp-vsnip")
    Plug("hrsh7th/vim-vsnip")
    Plug("L3MON4D3/LuaSnip", {
      ["tag"] = "v2.*",
      ["do"] = "make install_jsregexp",
    })
    Plug("saadparwaiz1/cmp_luasnip")
    Plug("puremourning/vimspector")
    vim.call("plug#end")
  end,
}
