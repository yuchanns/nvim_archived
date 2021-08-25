-- Map the leader key as space
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

require('plugins')
require('options')

require('pconf/ui')
require('pconf/helper')
require('pconf/lsp')
require('pconf/debugger')

