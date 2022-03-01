-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local g = vim.g
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1

require("nvim-tree").setup {
    diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = ""
        }
    },
    filters = {
      dotfiles = false,
      custom = { '.git', 'node_modules', '.cache', '.idea', '.DS_Store' }
    },
    open_on_setup = true,
    open_on_tab = true,
    ignore_ft_on_setup = { 'startify', 'dashboard' },
    hijack_cursor = true,
    view = {
      hide_root_folder = true,
    }
}

