local api = vim.api
local g = vim.g

g.mapleader = ' '

api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
