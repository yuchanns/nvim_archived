local api = vim.api
local g = vim.g

g.mapleader = ' '
g.blamer_enabled = 1

api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
