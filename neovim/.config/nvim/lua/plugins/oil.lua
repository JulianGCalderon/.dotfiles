return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  opts = {
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == '.git'
      end,
    },
  },
  keys = {
    { '-', ':Oil<CR>', desc = 'Oil [E]xplorer' },
  },
}
