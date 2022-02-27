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
    a = { ":lua require(\'lspsaga.codeaction\').code_action()<CR>", "Code Action", noremap = true, silent = true },
    i = { ":lua require(\'telescope.builtin\').lsp_implementations()<CR>", "Goto Implementation", noremap = true, silent = true },
    r = { ":lua vim.lsp.buf.references()<CR>", "Goto References", noremap = true, silent = true },
    s = { ":lua vim.lsp.buf.document_symbol()<CR>", "Goto Symbol", noremap = true, silent = true },
    R = { ":TroubleToggle lsp_references<CR>", "Goto Trouble References", noremap = true },
    h = { ":lua require\'lspsaga.provider\'.lsp_finder()<CR>", "Goto References", noremap = true, silent = true },
    cc = { "<Plug>kommentary_line_default", "Comment Line" },
    c = { "<Plug>kommentary_motion_default", "Comment" }
  },
  K = { ":lua require(\'lspsaga.hover\').render_hover_doc()<CR>", "Hover Doc", noremap = true, silent = true },
  -- Window Resize
  ["="] = { "<Cmd>exe \"resize +1.5\"<CR>", "Window Horizontal Expand", noremap = true, silent = true },
  ["-"] = { "<Cmd>exe \"resize -1.5\"<CR>", "Window Horizontal Shrink", noremap = true, silent = true },
  -- Debug
  d = {
    name = "Debug",
    c = { ":lua require(\'dap\').continue()<CR>", "Continue", noremap = true, silent = true },
    i = { ":lua require(\'dap\').step_over()<CR>", "Step Over", noremap = true, silent = true },
    n = { ":lua require(\'dap\').step_into()<CR>", "Step Into", noremap = true, silent = true },
    o = { ":lua require(\'dap\').step_out()<CR>", "Step Out", noremap = true, silent = true },
    b = { ":lua require(\'dap\').toggle_breakpoint()<CR>", "Toggle Breakpoint", noremap = true, silent = true },
    r = { ":lua require(\'dap\').repl.open()<CR>", "Open Repl", noremap = true, silent = true }
  },
  -- BufferLine
  b = {
    ["]"] = { ":BufferLineCycleNext<CR>", "BufferLine Cycle Next", noremap = true, silent = true },
    ["["] = { ":BufferLineCyclePrev<CR>", "BufferLine Cycle Prev", noremap = true, silent = true },
    ["e"] = { ":BufferLineSortByExtension<CR>", "BufferLine Sort By Extension", noremap = true, silent = true },
    ["d"] = { ":BufferLineSortByDirectory<CR>", "BufferLine Sort By Directory", noremap = true, silent = true },
    ["c"] = { ":BufferLinePickClose<CR>", "BufferLine Pick Close", noremap = true, silent = true },
    ["b"] = { ":BufferLinePick<CR>", "BufferLine Pick", noremap = true, silent = true },
  },
  -- Code Structure
  ["{"] = { "<cmd>AerialPrev<CR>", "Prev Code Structure" },
  ["}"] = { "<cmd>AerialNext<CR>", "Next Code Structure" }
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
  },
  c = {
    n = { ":DashboardNewFile<CR>", "Create New File", noremap = true, silent = true }
  },
  -- Session
  -- This not work well for now.
  s = {
    s = { ":<C-u>SessionSave<CR>", "Session Save", noremap = true },
    l = { ":<C-u>SessionLoad<CR>", "Session Load", noremap = true },
  },
  -- Window Resize
  ["="] = { "<Cmd>exe \"vertical resize +1.5\"<CR>", "Window Vertical Expand", noremap = true, silent = true },
  ["-"] = { "<Cmd>exe \"vertical resize -1.5\"<CR>", "Window Vertical Shrink", noremap = true, silent = true },
  -- Code Structure
  a = { "<cmd>AerialToggle! left<CR>", "Toggle Code Structure" },
}, { prefix = "<leader>", mode = "n" })
-- Terminal
wk.register({
  ["<leader>t"] = { "<Cmd>exe v:count1 . \"ToggleTerm size=10 direction=horizontal\"<CR>", "Toggle Float Terminal", noremap = true, silent = true, mode = "n" },
  -- This will not work now and I cannot figure out why.
  -- ["<Esc>"] = { "<C-\\><C-n>", "Exit Terminal Input Mode", noremap = true, silent = true, mode = "t" }
}, {})
