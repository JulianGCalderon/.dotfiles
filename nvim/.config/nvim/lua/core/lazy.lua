local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  spec = {
    { import = 'plugins' },
    { import = 'plugins.language-tools' },
    { import = 'plugins.integrations' },
    { import = 'plugins.coding' },
    { import = 'plugins.themes' },
  },
  install = {
    colorscheme = { 'tokyonight-nigth' },
  },
}
