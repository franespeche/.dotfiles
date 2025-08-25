-- Note: this isn't used at the moment
return {
  enable = function()
    vim.api.nvim_create_user_command("RunTS", function()
      local file = vim.fn.expand("%")
      vim.cmd("split term://yarn start " .. file)
    end, {})
    vim.keymap.set("n", "<leader>yr", ":RunTS<CR>", {
      silent = true,
    })
  end,
}
