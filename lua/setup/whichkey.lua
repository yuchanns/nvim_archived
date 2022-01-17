-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "which-key")
if not status_ok then
  return
end

local wk = require("which-key")

-- normal mode
wk.register({
  g = {
    name = "Code Navigation",
    a = { ":lua vim.lsp.buf.code_action()<CR>", "Code Action", noremap = true, silent = true },
    i = { ":lua require(\'telescope.builtin\').lsp_implementations()<CR>", "Goto Implementation", noremap = true, silent = true },
    r = { ":lua vim.lsp.buf.references()<CR>", "Goto References", noremap = true, silent = true },
    s = { ":lua vim.lsp.buf.document_symbol()<CR>", "Goto Symbol", noremap = true, silent = true },
    R = { ":TroubleToggle lsp_references<CR>", "Goto Trouble References", noremap = true },
    h = { ":lua require\'lspsaga.provider\'.lsp_finder()<CR>", "Goto References", noremap = true, silent = true },
    cc = { "<Plug>kommentary_line_default", "Comment Line" },
    c = { "<Plug>kommentary_motion_default", "Comment" }
  }
}, { prefix = "", mode = "n" })
-- visual mode
wk.register({
  g = {
    name = "Code Navigation",
    c = { "<Plug>kommentary_visual_default<C-c>", "Comment" },
  }
}, { prefix = "", mode = "v" })
