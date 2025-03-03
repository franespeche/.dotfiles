vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 10 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local ftMap = {
  vim = "indent",
  python = {
    "indent",
   },
  git = "",
 }

local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (" 󰁂 %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, {
        chunkText,
        hlGroup,
       })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, {
    suffix,
    "MoreMsg",
   })
  return newVirtText
end

return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
   },
  --[[
  keys = {
    -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
    {
      "zM",
      require("ufo").closeAllFolds,
    },
    {
      "zR",
      require("ufo").openAllFolds,
    },
  },
  ]] --
  opts = function(_, opts)
    opts.fold_virt_text_handler = handler
    opts.open_fold_hl_timeout = 150
    opts.close_fold_kinds_for_ft = {
      default = {
        "imports",
        "comment",
       },
      json = {
        "array",
       },
      c = {
        "comment",
        "region",
       },
     }
    opts.preview = {
      win_config = {
        border = {
          "",
          "─",
          "",
          "",
          "",
          "─",
          "",
          "",
         },
        winhighlight = "Normal:Folded",
        winblend = 0,
       },
      mappings = {
        scrollU = "<C-u>",
        scrollD = "<C-d>",
        jumpTop = "[",
        jumpBot = "]",
       },
     }
    opts.provider_selector = function(bufnr, filetype, buftype)
      -- if you prefer treesitter provider rather than lsp,
      return ftMap[filetype] or {
        "treesitter",
        "indent",
       }
      -- return ftMap[filetype]
      -- refer to ./doc/example.lua for detail
    end
  end,
 }
