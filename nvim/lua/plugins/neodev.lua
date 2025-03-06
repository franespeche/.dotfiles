return {
  -- lua types?
  "folke/neodev.nvim",
  cond = function()
    local should_disable = pcall(require, "lazydev.nvim")
    return should_disable
  end,
}
