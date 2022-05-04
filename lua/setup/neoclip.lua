-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "neoclip")
if not status_ok then
  return
end

require("neoclip").setup({
  history = 1000,
  filter = nil,
  preview = true,
  default_register = '"',
  content_spec_column = false,
  on_paste = {
    set_reg = false,
  },
  keys = {
    telescope = {
      i = {
        select = "<cr>",
        paste = "<c-p>",
        paste_behind = "<c-k>",
      },
      n = {
        select = "<cr>",
        paste = "p",
        paste_behind = "P",
      },
    },
  },
})
