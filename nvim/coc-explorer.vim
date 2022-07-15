let g:coc_explorer_global_presets = {
\   'nvim': {
\     'root-uri': '~/.config/nvim/',
\     'position': 'floating',
\			'floating-width': 120,
\			'open-action-strategy': 'sourceWindow',
\   },
\   'floating': {
\     'position': 'floating',
\			'floating-width': 120,
\     'open-action-strategy': 'sourceWindow',
\     'quit-on-open': v:false,
\   },
\   'buffer': {
\     'position': 'floating',
\			'floating-width': 50,
\			'floating-height': 0,
\     'open-action-strategy': 'sourceWindow',
\     'quit-on-open': v:false,
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }
