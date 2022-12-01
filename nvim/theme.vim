syntax on

let g:one_allow_italics = 1

" let g:catppuccin_flavour = "macchiato"
" let g:catppuccin_flavour = "latte"
" let g:catppuccin_flavour = "frappe"
" let g:catppuccin_flavour = "mocha"

" lua << EOF
" require("catppuccin").setup()
" vim.api.nvim_create_autocmd("OptionSet", {
" 	pattern = "background",
" 	callback = function()
" 		vim.cmd("Catppuccin " .. (vim.v.option_new == "light" and "latte" or "macchiato"))
" 	end,
" })
" EOF
" colorscheme catppuccin

" catppuccin
" dark mode
" highlight CocHighlightText guifg=#CAD3F5 guibg=#455C6D
" light mode
" highlight CocHighlightText guifg=#4C4F69 guibg=#A8DAF0


" highlight CursorColumn guibg=#1E2030

colorscheme gruvbox
" dark mode
highlight CocHighlightText guibg=Grey40
" light mode
" set background=light
" highlight CocHighlightText ctermbg=7 guibg=Grey90

" Italics
highlight Comment cterm=italic  	" italic comments


" format "check!" comments
:hi jsCommentCheck guifg=white guibg=red
:syntax match jsCommentCheck /^\s*[\/\/|"]\s*check!.*/

" check! holas
