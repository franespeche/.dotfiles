require("rainbow_csv").setup({
  config = true,
  ft = { "csv", "tsv", "csv_semicolon", "csv_whitespace", "csv_pipe", "rfc_csv", "rfc_semicolon" },
  cmd = { "RainbowDelim", "RainbowDelimSimple", "RainbowDelimQuoted", "RainbowMultiDelim" },
})
