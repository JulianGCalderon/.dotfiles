return {
  'folke/zen-mode.nvim',
  opts = {
    plugins = {
      tmux = { enabled = true },
    },
  },
  keys = {
    { '<leader>z', ':ZenMode<cr>', desc = '[Z]en Mode' },
  },
}
