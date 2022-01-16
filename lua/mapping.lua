local api = vim.api
local g = vim.g
local fn = vim.fn

g.mapleader = ' '
g.blamer_enabled = 1

api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'ga', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'gi', ':lua require(\'telescope.builtin\').lsp_implementations()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>e', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>f', ':lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'gs', ':lua vim.lsp.buf.document_symbo<CR>', { noremap = true, silent = true })

api.nvim_set_keymap('n', '<leader>xx', ':TroubleToggle<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>xw', ':TroubleToggle lsp_workspace_diagnostics<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>xd', ':TroubleToggle lsp_document_diagnostics<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>xq', ':TroubleToggle quickfix<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>xl', ':TroubleToggle loclist<CR>', { noremap = true })
api.nvim_set_keymap('n', 'gR', ':TroubleToggle lsp_references<CR>', { noremap = true })

api.nvim_set_keymap('n', '<leader>ss', ':<C-u>SessionSave<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>sl', ':<C-u>SessionLoad<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>fh', ':DashboardFindHistory<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>ff', ':lua require(\'telescope\').extensions.file_browser.file_browser()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>tc', ':DashboardChangeColorscheme<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>fa', ':DashboardFindWord<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>fb', ':DashboardJumpMark<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>cn', ':DashboardNewFile<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>fp', ':Telescope neoclip<CR>', { noremap = true, silent = true })

api.nvim_set_keymap('n', '<leader>fs', ':lua require(\'telescope.builtin\').lsp_dynamic_workspace_symbols()<CR>', { noremap = true })

api.nvim_set_keymap('n', '<leader>ca', ':lua require(\'lspsaga.codeaction\').code_action()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('v', '<leader>ca', ':lua require(\'lspsaga.codeaction\').range_code_action()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'gh', ':lua require\'lspsaga.provider\'.lsp_finder()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'K', ':lua require(\'lspsaga.hover\').render_hover_doc()<CR>', { noremap = true, silent = true })

api.nvim_set_keymap('n', '<leader>t', '<Cmd>exe v:count1 . "ToggleTerm size=10 direction=float"<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
api.nvim_set_keymap("n", "gcc", "<Plug>kommentary_line_default", {})
api.nvim_set_keymap("n", "gc", "<Plug>kommentary_motion_default", {})
api.nvim_set_keymap("v", "gc", "<Plug>kommentary_visual_default<C-c>", {})
api.nvim_set_keymap("n", '<leader>=', '<Cmd>exe "vertical resize +1.5"<CR>', { noremap = true, silent = true })
api.nvim_set_keymap("n", '<leader>-', '<Cmd>exe "vertical resize -1.5"<CR>', { noremap = true, silent = true })
api.nvim_set_keymap("n", '=', '<Cmd>exe "resize +1.5"<CR>', { noremap = true, silent = true })
api.nvim_set_keymap("n", '-', '<Cmd>exe "resize -1.5"<CR>', { noremap = true, silent = true })

api.nvim_set_keymap('n', 'dc', ':lua require(\'dap\').continue()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'di', ':lua require(\'dap\').step_over()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'dn', ':lua require(\'dap\').step_into()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'do', ':lua require(\'dap\').step_out()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'db', ':lua require(\'dap\').toggle_breakpoint()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'dr', ':lua require(\'dap\').repl.open()<CR>', { noremap = true, silent = true })

