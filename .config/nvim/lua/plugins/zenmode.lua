return {
  'folke/zen-mode.nvim',
  opts = {
    plugins = {
      tmux = { enabled = true },
    },
  },
  keys = {
    { '<leader>z', '<cmd>ZenMode<cr>', desc = '[Z]en Mode' },
  },
}
