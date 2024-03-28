return {
  'folke/which-key.nvim',
  opts = {
    triggers_nowait = {
      -- marks
      '`',
      "'",
      'g`',
      "g'",
      -- spelling
      'z=',
    },
  },
  config = function(_, opts)
    local which_key = require 'which-key'
    which_key.setup(opts)
    which_key.register {
      ['<leader>c'] = { name = '[c]ode', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]iagnostic', _ = 'which_key_ignore' },
      -- ['<leader>s'] = { name = '[S]plit', _ = 'which_key_ignore' },
    }
  end,
}
