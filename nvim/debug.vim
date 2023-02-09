function! IsLeftMostWindow()
    let curNr = winnr()
    wincmd h
    if winnr() == curNr
        return 1
    endif
    wincmd p " Move back.
    return 0
endfunction

function! IsWindowPosition(pos)
    let curNr = winnr()

    if a:pos == "right"
      wincmd l
    elseif a:pos == "left"
      wincmd h
    endif

    if winnr() == curNr
        return 1
    endif
    wincmd p " Move back.
    return 0
endfunction

function! Check()
  let flag = IsWindowPosition("right")
  echo "flag"
  echo flag
endfunction

nmap ,db :call Check()<cr>
