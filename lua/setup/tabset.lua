-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "tabset")
if not status_ok then
  return
end

require("tabset").setup({
  defaults = {
    tabwidth = 4,
    expandtab = true,
  },
  languages = {
    {
      filetypes = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "json",
        "yaml",
        "haskell",
        "lhaskell",
      },
      config = {
        tabwidth = 2,
      },
    },
  },
})
