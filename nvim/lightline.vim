let g:lightline = {
      \   'colorscheme': IsDarkMode() ? 'gruvbox' : 'dayfox',
			\   'subseparator': {
			\			'left': '',
			\		},
      \   'active': {
      \     'left': [
      \       [ 'mode', 'paste'],
      \       [ 'coc_errors', 'coc_warnings', 'coc_ok' ],
      \       [ 'git_branch', 'git_staged_files', 'spacer', 'filename', 'modified' ],
      \     ],
      \     'right': [
      \       [ 'lineinfo' ],
      \       [ 'percent'  ],
      \       [ 'dynamicpath' ],
      \     ],
      \   },
      \   'component': {
      \     'lineinfo': '%3l:%-2v%<',
      \     'spacer': '|'
      \   },
      \   'component_function': {
      \     'git_branch': 'FugitiveHead',
      \     'dynamicpath': 'FilePath',
      \     'git_staged_files': 'GitStagedFiles',
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

set noshowmode                  " -- MODE -- displays as M
                                " eg: INSERT -> I
" Git
function Gitbranch()
    return trim(system("git -C " . expand("%:p:h") . " branch --show-current 2>/dev/null"))
endfunction

augroup Gitget
    autocmd!
    autocmd BufEnter * let b:git_branch = Gitbranch()
augroup END

function GitStagedFiles()
    let staged_symbol= '✓'
    let staged_files_count = trim(system("git -C " . expand("%:p:h") . " diff --cached --numstat | wc -l"))
    let are_staged_files = staged_files_count > 0
    if are_staged_files
        return staged_files_count . staged_symbol
    else 
        return ''
    endif
endfunction


" function GitStagedFiles()
    " return trim(system("git -C " . expand("%:p:h") . " diff --cached --numstat | wc -l"))
" endfunction

" Sys
function! FilePath()
  return winwidth(0) > 80 ? expand('%h') : ''
endfunction

" register compoments:
call lightline#coc#register()
