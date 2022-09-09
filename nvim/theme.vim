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

" gruvbox
colorscheme gruvbox
" dark mode
highlight CocHighlightText guibg=Grey40
" light mode
" 
" set background=dark


" let g:terminal_color_0 = '#F2E0DE'
" let g:terminal_color_8 = '#110F18'

" let g:terminal_color_1 = '#B4637A'
" let g:terminal_color_9 = '#FF6767'

" let g:terminal_color_2 = '#56949f'
" let g:terminal_color_10 = '#61FFCA'

" let g:terminal_color_3 = '#EA9D34'
" let g:terminal_color_11 = '#FFCA85'

" let g:terminal_color_4 = '#286983'
" let g:terminal_color_12 = '#A277FF'

" let g:terminal_color_5 = '#907AA9'
" let g:terminal_color_13 = '#ADD4FB'

" let g:terminal_color_6 = '#D7827E'
" let g:terminal_color_14 = '#CEFF61'

" let g:terminal_color_7 = '#575279'
" let g:terminal_color_15 = '#EDECEE'

" Italics Comment 
highlight Comment cterm=italic  	" italic comments
