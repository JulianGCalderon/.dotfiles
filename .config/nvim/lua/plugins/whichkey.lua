return {
  'folke/which-key.nvim',
  config = function(_)
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]iagnostic', _ = 'which_key_ignore' },
      -- ['<leader>s'] = { name = '[S]plit', _ = 'which_key_ignore' },
    }
  end
}
