-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Undo (no backups)
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.swapfile = false

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- Update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Appearance
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 8
vim.opt.breakindent = true
vim.opt.colorcolumn = '80'
vim.opt.updatetime = 50

-- Splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Tab config
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Format options
vim.opt.textwidth = 80
vim.opt.formatoptions:remove 't'
vim.opt.formatoptions:append 'cro'
