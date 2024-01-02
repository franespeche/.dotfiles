- create a switch in telescope that toggles btw find_files and file_grep

- for each git root dir, display the last modified files at startup
    - get data from oldfiles
    - filter those ones that matches the git_root_path
        - if no git_root_path, default to oldfiles


- when working with splits, need to remember last vertical/horizontal state, eg:

```
     | a |   |
     |---| c |
     | b |   |
     
     1. position cursor in b
     2. press <C-l> (go to c)
     3. press <C-h> (goes to a, when it should have went to b)

```

    
