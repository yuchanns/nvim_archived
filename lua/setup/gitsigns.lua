-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "gitsigns")
if not status_ok then
  return
end

require('gitsigns').setup({
  current_line_blame = true,
  linehl = true,
  numhl = true,

  signs = {
    add       = { text = '▎' },
    change    = { text = '▎' },
    delete    = { text = 'ﬠ' },
    topdelete = { text = 'ﬢ' }
  }
})
