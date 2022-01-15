-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "tokyonight")
if not status_ok then
  return
end
local g = vim.g

g.tokyonight_transparent = false

vim.cmd[[colorscheme tokyonight]]
