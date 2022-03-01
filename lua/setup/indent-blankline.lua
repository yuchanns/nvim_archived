-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "indent_blankline")
if not status_ok then
  return
end

vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    buftype_exclude = { "terminal", 'nofile' },
    filetype_exclude = {
        "startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit",
        "packer", "vimwiki", "markdown", "json", "txt", "vista", "help",
        "todoist", "NvimTree", "peekaboo", "git", "TelescopePrompt", "undotree",
        "flutterToolsOutline", "" -- for all buffers without a file type
    },
    use_treesitter = true,
    char_list = {'|', '¦', '┆', '┊'},
    show_first_indent_level = true,
    show_trailing_blankline_indent = false
}

