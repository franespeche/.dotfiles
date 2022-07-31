syntax on
let g:one_allow_italics = 1
" colorscheme one
"
let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha

lua << EOF
require("catppuccin").setup()
vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "background",
	callback = function()
		vim.cmd("Catppuccin " .. (vim.v.option_new == "light" and "latte" or "mocha"))
	end,
})
EOF

colorscheme catppuccin

" function! ToggleDarkMode()
"
	" let iterm_profile = $ITERM_PROFILE
	" if iterm_profile == "dark"
	" 	set background=dark
	" else
	" 	set background=light
	" endif
  "
" endfunction

" command! ToggleDarkMode call ToggleDarkMode()
" noremap <silent> <leader>dm :call ToggleDarkMode()<cr>

" call one#highlight('Normal', '', '#252525', 'none')


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
