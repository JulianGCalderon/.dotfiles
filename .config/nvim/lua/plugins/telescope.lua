return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  opts = {},
  config = function(opts)
    require("telescope").setup(opts)
    pcall(require('telescope').load_extension, 'fzf')
  end,
  keys = {
    { '<leader>ff',      function() require('telescope.builtin').find_files() end,  desc = '[F]ind [F]iles' },
    { '<leader>fh',      function() require('telescope.builtin').help_tags() end,   desc = '[F]ind [H]elp' },
    { '<leader>fg',      function() require('telescope.builtin').live_grep() end,   desc = '[F]ind by [G]rep' },
    { '<leader>fd',      function() require('telescope.builtin').diagnostics() end, desc = '[F]ind [D]iagnostics' },
    { '<leader>f?',      function() require('telescope.builtin').oldfiles() end,    desc = '[F]ind recently opened files' },
    { '<leader><space>', function() require('telescope.builtin').buffers() end,     desc = 'Find existing buffers' },
  }
}
