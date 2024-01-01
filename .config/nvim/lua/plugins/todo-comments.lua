return {
  'folke/todo-comments.nvim',
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
