-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "which-key")
if not status_ok then
  return
end

local wk = require("which-key")

-- normal mode
wk.register({
  -- Code Navigation
  g = {
    name = "Code Navigation",
    a = { ":lua require(\'lspsaga.codeaction\').range_code_action()<CR>", "Code Action", noremap = true, silent = true },
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
  -- Code Navigation
  g = {
    name = "Code Navigation",
    c = { "<Plug>kommentary_visual_default<C-c>", "Comment" },
  },
}, { prefix = "", mode = "v" })
--- with leader prefix
wk.register({
  -- Diagnostics
  e = { ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Show Diagnostics", noremap = true, silent = true },
  x = {
    name = "Trouble Toggle",
    x = { ":TroubleToggle<CR>", "Toggle Trouble", noremap = true, silent = true },
    w = { ":TroubleToggle workspace_diagnostics<CR>", "Toggle Workspace Trouble", noremap = true, silent = true },
    d = { ":TroubleToggle document_diagnostics<CR>", "Toggle Document Trouble", noremap = true, silent = true },
    q = { ":TroubleToggle quickfix<CR>", "Toggle Quickfix", noremap = true, silent = true },
    l = { ":TroubleToggle loclist<CR>", "Toggle Loclist", noremap = true, silent = true }
  },
  -- Dashboard
  f = {
    name = "Dashboard",
    f = { ":lua require(\'telescope\').extensions.file_browser.file_browser()<CR>", "Browse File", noremap = true, silent = true },
    a = { ":DashboardFindWord<CR>", "Global Search", noremap = true, silent = true },
    b = { ":DashboardJumpMark<CR>", "Jump Mark", noremap = true, silent = true },
    p = { ":Telescope neoclip<CR>", "Open Clipboard", noremap = true, silent = true },
    s = { ":lua require(\'telescope.builtin\').lsp_dynamic_workspace_symbols()<CR>", "Dynamic Symbol", noremap = true, silent = true },
    h = { ":DashboardFindHistory<CR>", "Browse History", noremap = true, silent = true }
  }
}, { prefix = "<leader>", mode = "n" })
