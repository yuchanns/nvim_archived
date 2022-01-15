-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "indent_blankline")
if not status_ok then
  return
end

local g = vim.g

g.indentLine_char_list = {'|', '¦', '┆', '┊'}
g.indent_blankline_use_treesitter = true
g.indent_blankline_show_current_context = true
g.indent_blankline_show_first_indent_level = true
g.indent_blankline_filetype_exclude = {
    "startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit",
    "packer", "vimwiki", "markdown", "json", "txt", "vista", "help",
    "todoist", "NvimTree", "peekaboo", "git", "TelescopePrompt", "undotree",
    "flutterToolsOutline", "" -- for all buffers without a file type
}
g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_current_context = true
g.indent_blankline_context_patterns = {
    "class", "function", "method", "block", "list_literal", "selector",
    "^if", "^table", "if_statement", "while", "for"
}
 -- because lazy load indent-blankline so need readd this autocmd
 vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
