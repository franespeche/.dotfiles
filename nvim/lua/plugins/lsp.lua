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

return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    enabled = true,
    dependencies = {
      "tjdevries/coc-zsh",
      "antoinemadec/coc-fzf",
     },
    init = function()
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

      vim.cmd([[ command! -nargs=0 Prettier :CocCommand prettier.formatFile ]])
      vim.cmd([[ highlight link CocHighlightText Visual ]])
      vim.cmd(
          [[ inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" ]])

      -- definitions
      vim.keymap.set("n", "gd", "<Plug>(coc-definition)zz", Opts)
      vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", Opts)
      vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", Opts)
      vim.keymap.set("n", "gr", "<Plug>(coc-references)", Opts)

      -- restart
      vim.keymap.set("n", "<leader>cr", ":CocRestart<cr> ", Opts)
      vim.keymap
          .set("n", "<leader>tr", ":CocCommand tsserver.restart<cr>", Opts)

      -- either doHover or show documentation in preview window
      vim.keymap.set("n", "<leader>ck", function() show_documentation() end,
                     Opts)
      vim.keymap.set("n", "<leader>ch", "<Plug>(coc-codeaction)", Opts)

      -- diagnostics
      vim.keymap.set("n", "<leader>cc", ":CocFzfList diagnostics<cr>", Opts)
      vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", Opts)
      vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", Opts)

      -- actions
      vim.keymap.set("n", "<leader>cl",
                     ":<C-u>call CocActionAsync('codeLensAction')<CR>", Opts)

      local au = vim.api.nvim_create_autocmd
      local aug = vim.api.nvim_create_augroup
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
      au("BufEnter", {
        desc = "disables autocommenting",
        command = "set fp-=c fo-=r fo-=o",
       })
    end,
   },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    enabled = false,
    opts = function()
      local out = {
        servers = {
          lua_ls = {
            settings = {
              Lua = {
                diagnostics = {
                  globals = {
                    "vim",
                    "Snacks",
                   }, -- Make 'vim' a known global
                 },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false, -- (Optional) Disable third-party checks
                 },
                telemetry = {
                  enable = false, -- (Optional) Disable telemetry
                 },
               },
             },
           },
         },
        setup = {},
       }
      return out
    end,
   },
 }
