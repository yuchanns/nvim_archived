-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

require('nvim-autopairs').setup()
