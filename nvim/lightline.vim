let g:lightline = {
      \   'colorscheme': 'one',
			\   'subseparator': {
			\			'left': '|',
			\		},
      \   'active': {
      \     'left': [
      \       [ 'mode', 'paste'],
      \       [ 'coc_errors', 'coc_warnings', 'coc_ok' ],
      \       [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \     ],
      \     'right': [
      \       [ 'lineinfo' ],
      \       [ 'percent'  ],
      \       [ 'absolutepath' ],
      \     ],
      \   },
      \   'component_function': {
      \     'gitbranch': 'FugitiveHead'
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

set noshowmode										" do not show -- INSERT -- when on insert mode

" register compoments:
call lightline#coc#register()
