return {
  'folke/todo-comments.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    keywords = {
      TEST = {
        icon = '󰙨',
      },
    },
  },
  keys = {
    { '<leader>fc', ':TodoTelescope<CR>', desc = '[F]ind [C]omments' },
  },
}
