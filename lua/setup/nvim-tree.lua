-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local g = vim.g
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_icons = {
  symlink = "",
  git = {
    untracked = "?",
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
  },
}
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}

local tree_cb = require("nvim-tree.config").nvim_tree_callback

require("nvim-tree").setup({
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = { ".git", "node_modules", ".cache", ".idea", ".DS_Store" },
  },
  open_on_setup = true,
  open_on_tab = true,
  ignore_ft_on_setup = { "startify", "dashboard" },
  hijack_cursor = true,
  view = {
    hide_root_folder = true,
    mappings = {
      list = {
        { key = "<C-v>", cb = tree_cb("vsplit") },
        { key = "<C-s>", cb = tree_cb("split") },
        { key = "v", cb = tree_cb("vsplit") },
        { key = "s", cb = tree_cb("split") },
        { key = "<C-t>", cb = ":ToggleTerm<cr>" },
      },
    },
  },
  update_focused_file = {
    enable = true,
  },
})
