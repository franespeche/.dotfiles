" 'gitbranch'
let g:lightline = {
      \   'colorscheme': 'gruvbox',
			\   'subseparator': {
			\			'left': '|',
			\		},
      \   'active': {
      \     'left': [
      \       [ 'mode', 'paste'],
      \       [ 'coc_errors', 'coc_warnings', 'coc_ok' ],
      \       [ 'readonly', 'filename', 'modified' ],
      \     ],
      \     'right': [
      \       [ 'lineinfo' ],
      \       [ 'percent'  ],
      \       [ 'dynamicpath', 'ho' ],
      \     ],
      \   },
      \   'component': {
      \     'ho': '%3l:%-2v%<',
      \   },
      \   'component_function': {
      \     'gitbranch': 'FugitiveHead',
      \     'dynamicpath': 'FilePath'
      \   },
      \   'mode_map': {
      \     'n' : 'N',
      \     'i' : 'I',
      \     'R' : 'R',
      \     'v' : 'v',
      \     'V' : 'V',
      \     "\<C-v>": 'V',
      \     'c' : 'C',
      \     's' : 'S',
      \     'S' : 'SL',
      \     "\<C-s>": 'SB',
      \     't': 'T',
      \   }
      \ }
set noshowmode										" -- MODE -- displays as M
                                  " eg: INSERT -> I

function! FilePath()
  return winwidth(0) > 80 ? expand('%h') : ''
endfunction

" register compoments:
call lightline#coc#register()

" this was commented out when migrating from catppuccin to gruvbox
" augroup LightlineColorscheme
"   autocmd!
"   " autocmd ColorScheme * echo 'holis'
" augroup END
" function! s:lightline_update()
"   if !exists('g:loaded_lightline')
"     return
"   endif
"   try
"     if g:colors_name =~# 'wombat\|solarized\|landscape\|jellybeans\|seoul256\|Tomorrow|catppuccin'
"       let g:lightline.colorscheme =
"             \ substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '')
"       call lightline#init()
"       call lightline#colorscheme()
"       call lightline#update()
"     endif
"   catch
"   endtry
" endfunction
