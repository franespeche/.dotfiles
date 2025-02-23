local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup

-- settings
vim.g.coc_global_extensions = {
  "coc-tsserver",
  "coc-json",
  "coc-lua",
  "coc-yaml",
  "coc-pyright",
}
vim.g.jsx_ext_required = 0 -- enable JSX syntax highlighing in javascript files

vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.updatetime = 300

-- helpers
local function show_documentation()
  local filetype = vim.bo.filetype
  local cword = vim.fn.expand("<cword>")

  if vim.fn.index({
      "help",
    }, filetype) >= 0 then
    vim.cmd("h " .. cword)
  else
    if vim.fn.index({
        "lua",
      }, filetype) >= 0 then
      vim.lsp.buf.hover()
    else
      vim.fn.CocAction("doHover")
    end
  end
end

-- autocommands
-- coc
aug("coc-custom", {
  clear = true,
})
au("FileType", {
  pattern = "typescript,json",
  group = "coc-custom",
  command = "setl formatexpr=CocAction('formatSelected')",
  desc = "setup formatexpr specified filetype(s)",
})
au("User", {
  pattern = "CocJumpPlaceholder",
  group = "coc-custom",
  command = "CocActionAsync('showSignatureHelp')",
  desc = "update signature help on jump placeholder",
})

-- highlight symbol under cursor on CursorHold
-- au("CursorHold", {
-- pattern = "*",
-- group = "coc-custom",
-- command = "call CocActionAsync('highlight')",
-- desc = "highlight symbol under cursor on CursorHold",
-- })
-- disable autocommenting
au("BufEnter", {
  desc = "disables autocommenting",
  command = "set fp-=c fo-=r fo-=o",
})

-- restart
vim.keymap.set("n", "<leader>cr", ":CocRestart<cr> ", Opts)
vim.keymap.set("n", "<leader>tr", ":CocCommand tsserver.restart<cr>", Opts)

-- either doHover or show documentation in preview window
vim.keymap.set("n", "<leader>ck", function () show_documentation() end, Opts)
vim.keymap.set("n", "<leader>ch", "<Plug>(coc-codeaction)", Opts)

-- diagnostics
vim.keymap.set("n", "<leader>cc", ":CocFzfList diagnostics<cr>", Opts)
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", Opts)
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", Opts)

-- actions
vim.keymap.set("n", "<leader>cl",
  ":<C-u>call CocActionAsync('codeLensAction')<CR>", Opts)

-- definitions
vim.keymap.set("n", "gd", "<Plug>(coc-definition)zz", Opts)
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", Opts)
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", Opts)
vim.keymap.set("n", "gr", "<Plug>(coc-references)", Opts)

-- Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
-- Coc only does snippet and additional edit on confirm.
-- vim.keymap.set("i", "gr",  "<Plug>(coc-references)", Opts)
-- inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

vim.cmd([[ command! -nargs=0 Prettier :CocCommand prettier.formatFile ]])
vim.cmd([[ highlight link CocHighlightText Visual ]])
vim.cmd([[ inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" ]])
