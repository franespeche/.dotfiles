return {
  -- lua formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = {
          "stylua",
        },
        javascript = {
          "prettier",
        },
        typescript = {
          "prettier",
        },
        typescriptreact = {
          "prettier",
        },
        javascriptreact = {
          "prettier",
        },
        python = {
          "black",
        },
        terraform = {
          "terraform_fmt",
        },
        json = {
          "prettier",
        },
      },

      -- format on save
      format_on_save = function(bufnr)
        -- disable for very large files
        local max = 200 * 1024
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
        if ok and stats and stats.size > max then return nil end
        return {
          lsp_fallback = true,
          timeout_ms = 2000,
        }
      end,

      notify_on_error = true,
    },
  },
}
