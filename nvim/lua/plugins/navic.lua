local navic = require('nvim-navic')

local icons = {
    File = ' ',
    Module = ' ',
    Namespace = ' ',
    Package = ' ',
    Class = ' ',
    Method = ' ',
    Property = ' ',
    Field = ' ',
    Constructor = ' ',
    Enum = ' ',
    Interface = ' ',
    Function = ' ',
    Variable = ' ',
    Constant = ' ',
    String = ' ',
    Number = ' ',
    Boolean = ' ',
    Array = ' ',
    Object = ' ',
    Key = ' ',
    Null = ' ',
    EnumMember = ' ',
    Struct = ' ',
    Event = ' ',
    Operator = ' ',
    TypeParameter = ' '
  }

navic.setup {
  icons,
  highlight = true,             -- add colors to icons and text as defined by highlight groups NavicIcons*
  separator = '  ',
  click = false,                -- single click to goto element, double click to open nvim-navbuddy on the clicked element
  depth_limit = 0,              -- maximum depth of context to be shown. If the context hits this depth limit, it is truncated
  depth_limit_indicator = '..', -- icon to indicate that depth_limit was hit and the shown context is truncated
  lazy_update_context = true,   -- if true, turns off context updates for the "CursorMoved" event
  safe_output = true, -- sanitize the output for use in statusline and winbar
}
