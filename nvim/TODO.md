- consider cd'ing to buffer's location on BufEnter

- install vimspector

- :Isolate scopes

- remove $HOME path from lualine location

- cycle through not committed lines

- create a switch in telescope that toggles btw find_files and file_grep

- when working with splits, remember last vertical/horizontal state, eg:

- lualine: 
    - show file path relative to path and not to current working directory

```
     | a |   |
     |---| c |
     | b |   |
     
     1. position cursor in b
     2. press <C-l> (go to c)
     3. press <C-h> (goes to a, when it should have went to b)
```

