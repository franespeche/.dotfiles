function! CheckPwd()
    if expand('%:p:h') =~# 'crawler'
        return 1
    else 
        return 0
    endif
endfunction


nnoremap <silent> <space>ef :Neotree left toggle reveal_force_cwd<cr>
nnoremap <silent> <space>eg :Neotree left toggle git_status main reveal_force_cwd git_base=main<cr>
nnoremap <silent> <space>en :Neotree left toggle ~/.dotfiles/nvim reveal_force_cwd<cr>
nnoremap <silent> <space>ez :Neotree left toggle ~/.dotfiles/zsh reveal_force_cwd<cr>
nnoremap <silent> <leader>rl :lua package.loaded["neotree"] = nil<cr>

:hi Directory ctermfg=109 guifg=Cyan

lua << END
-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- require("neo-tree").paste_default_config()
  
--:l
local function get_keys(t)
  local keys={}
  for key,_ in pairs(t) do
    table.insert(keys, key)
  end
  return keys
end

local selected_nodes = {}
local select_node = function(state)
    local node = state.tree:get_node()

   print(get_keys(node))

    -- for i, n in ipairs(selected_nodes) do
    --     print(n.name)
    -- end
end


require("neo-tree").setup({
        close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
        log_to_file = false, -- true, false, "/path/to/file.log", use :NeoTreeLogs to show the file
        use_popups_for_input = true, -- If false, inputs will use vim.ui.input() instead of custom floats.
        popup_border_style = "rounded",
        enable_git_status = true,
        event_handlers = {
          {
            event = "file_opened",
            handler = function(file_path)
                -- auto close
                require("neo-tree").close_all()
              end
          }
        },
        enable_diagnostics = true,
        sort_case_insensitive = false, -- used when sorting files and directories in the tree
        sort_function = nil , -- use a custom function for sorting files and directories in the tree 
        -- sort_function = function (a,b)
        --       if a.type == b.type then
        --           return a.path > b.path
        --       else
        --           return a.type > b.type
        --       end
        --   end , -- this sorts files and directories descendantly
        default_component_configs = {
          container = {
            enable_character_fade = true
          },
          indent = {
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "ﰊ",
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "*",
            highlight = "NeoTreeFileIcon"
          },
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              -- Change type
              added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted   = "✖",-- this can only be used in the git_status source
              renamed   = "",-- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "",
              unstaged  = "",
              staged    = "",
              conflict  = "",
            }
          },
        },
        window = {
          position = "left",
          width = 40,
          same_level = false, -- Create and paste/move files/directories on the same level as the directory under cursor (as opposed to within the directory under cursor).
            insert_as = "child", -- Affects how nodes get inserted into the tree during creation/pasting/moving of files if the node under the cursor is a directory:
            -- "child":   Insert nodes as children of the directory under cursor.
            -- "sibling": Insert nodes  as siblings of the directory under cursor.
            -- Mappings for tree window. See `:h neo-tree-mappings` for a list of built-in commands.
            -- You can also create your own commands by providing a function instead of a string.
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["<tab>"] = "toggle_node",
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["l"] = "open",
            ["<esc>"] = "revert_preview",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            -- ["l"] = "focus_preview", -- focuses the preview window
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            -- ["S"] = "split_with_window_picker",
            -- ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            -- ["w"] = "open_with_window_picker",
            ["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
            -- ["C"] = "close_node",
            ["h"] = "close_node", -- enter preview mode, which shows the current node without focusing
            ["H"] = "close_all_nodes",
            --["Z"] = "expand_all_nodes",
            ["a"] = { 
              "add",
              -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
              -- some commands may take optional config options, see `:h neo-tree-mappings` for details
              config = {
                show_path = "none" -- "none", "relative", "absolute"
              }
            },
            ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
            -- ["c"] = {
            --  "copy",
            --  config = {
            --    show_path = "none" -- "none", "relative", "absolute"
            --  }
            --}
            ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
          }
        },
        nesting_rules = {},
        filesystem = {
          filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false, -- only works on Windows for hidden files/directories
            hide_by_name = {
              ".DS_Store",
              "node_modules"
            },
            hide_by_pattern = { -- uses glob style patterns
              --"*.meta",
              --"*/src/*/tsconfig.json",
            },
            always_show = { -- remains visible even if other settings would normally hide it
              ".gitignored",
            },
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
              ".DS_Store",
              --"thumbs.db"
            },
            never_show_by_pattern = { -- uses glob style patterns
              --".null-ls_*",
            },
          },
          follow_current_file = true, -- This will find and focus the file in the active buffer every
                                       -- time the current file is changed while the tree is open.
          use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
                                          -- instead of relying on nvim autocmd events.
          group_empty_dirs = true, -- when true, empty folders will be grouped together
          hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
                                                  -- in whatever position is specified in window.position
                                -- "open_current",  -- netrw disabled, opening a directory opens within the
                                                  -- window like netrw would, regardless of window.position
                                -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
          window = {
            mappings = {
              ["-"] = "navigate_up",
              ["."] = "set_root",
              -- ["H"] = "toggle_hidden",
              ["/"] = "fuzzy_finder",
              ["D"] = "fuzzy_finder_directory",
              ["f"] = "filter_on_submit",
              ["<c-x>"] = "clear_filter",
              ["[g"] = "prev_git_modified",
              ["]g"] = "next_git_modified",
              -- ["<tab>"] = select_node
            }
          }
        },
        buffers = {
          follow_current_file = true, -- This will find and focus the file in the active buffer every
                                      -- time the current file is changed while the tree is open.
          group_empty_dirs = true,    -- when true, empty folders will be grouped together
          show_unloaded = true,
          window = {
            mappings = {
              ["bd"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
            }
          },
        },
        git_status = {
          window = {
            position = "float",
            mappings = {
              ["A"]  = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
            }
          }
        }
      })
END

