-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "lualine")
if not status_ok then
  return
end

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "tokyonight",
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
  extensions = { "nvim-tree" },
})
