local opt = vim.opt
-- TODO: add annotations
opt.splitbelow = true
opt.splitright = true

opt.backup = false
opt.swapfile = false
opt.writebackup = false

opt.autoindent = true
opt.smartindent = true
opt.cindent = true
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set softtabstop=4')
opt.expandtab = true

opt.number = true
opt.termguicolors = true
opt.signcolumn = 'number'

opt.updatetime = 400
opt.hidden = true
opt.wrap = true
opt.fileencoding = 'utf-8'
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.belloff = 'all'
opt.shell = 'zsh'

