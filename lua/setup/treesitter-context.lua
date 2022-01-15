-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "treesitter-context")
if not status_ok then
  return
end

require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
}

vim.cmd("let &fcs='eob: '")
