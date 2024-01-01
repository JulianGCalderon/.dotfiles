return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'go', 'rust' },
    highlight = { enable = true },
  },
}
