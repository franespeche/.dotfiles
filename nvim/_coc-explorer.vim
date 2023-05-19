let g:coc_explorer_global_presets = {}
" extending here just to remember that extend() exists 
let g:coc_explorer_global_presets = extend(g:coc_explorer_global_presets, {
\   'nvim': {
\     'root-uri': '~/.dotfiles/nvim/',
\     'position': 'left',
\			'floating-width': 120,
\			'open-action-strategy': 'sourceWindow',
\   },
\   'floating': {
\     'position': 'left',
\			'floating-width': 120,
\     'open-action-strategy': 'sourceWindow',
\     'quit-on-open': v:false,
\   },
\   'buffer': {
\     'position': 'left',
\			'floating-width': 120,
\     'open-action-strategy': 'sourceWindow',
\     'quit-on-open': v:false,
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ })
