require("teleport").setup()
vim.keymap.set("n", "t", ":Teleport forwards<cr>", { noremap = true })
vim.keymap.set("n", "T", ":Teleport backwards<cr>", { noremap = true })
vim.keymap.set("n", "qq", ":TeleportExit<cr>", { noremap = true })
