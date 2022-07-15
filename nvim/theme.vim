set termguicolors
syntax on
let g:one_allow_italics = 1
colorscheme one

let iterm_profile = $ITERM_PROFILE
if iterm_profile == "dark"
	set background=dark
else
	set background=light
endif

call one#highlight('Normal', '', '#252525', 'none')

" let g:terminal_color_0 = '#4E4E4E'
" let g:terminal_color_8 = '#626262'

" let g:terminal_color_1 = '#D68787'
" let g:terminal_color_9 = '#D75F87'

" let g:terminal_color_2 = '#5F865F'
" let g:terminal_color_10 = '#87AF87'

" let g:terminal_color_3 = '#D8AF5F'
" let g:terminal_color_11 = '#FFD787'

" let g:terminal_color_4 = '#85ADD4'
" let g:terminal_color_12 = '#ADD4FB'

" let g:terminal_color_5 = '#D7AFAF'
" let g:terminal_color_13 = '#FFAFAF'

" let g:terminal_color_6 = '#87AFAF'
" let g:terminal_color_14 = '#87D7D7'

" let g:terminal_color_7 = '#D0D0D0'
" let g:terminal_color_15 = '#E4E4E4'

let g:terminal_color_0 = '#F2E0DE'
let g:terminal_color_8 = '#110F18'

let g:terminal_color_1 = '#B4637A'
let g:terminal_color_9 = '#FF6767'

let g:terminal_color_2 = '#56949f'
let g:terminal_color_10 = '#61FFCA'

let g:terminal_color_3 = '#EA9D34'
let g:terminal_color_11 = '#FFCA85'

let g:terminal_color_4 = '#286983'
let g:terminal_color_12 = '#A277FF'

let g:terminal_color_5 = '#907AA9'
let g:terminal_color_13 = '#ADD4FB'

let g:terminal_color_6 = '#D7827E'
let g:terminal_color_14 = '#CEFF61'

let g:terminal_color_7 = '#575279'
let g:terminal_color_15 = '#EDECEE'
