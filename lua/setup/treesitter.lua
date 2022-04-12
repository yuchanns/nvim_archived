-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

require('nvim-treesitter.configs').setup {
    ensure_installed = 'all',
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    rainbow = {
        enable = true,
        max_file_lines = 1000,
    },
    autopairs = {
        enable = true,
    }
}
