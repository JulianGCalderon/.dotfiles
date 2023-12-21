return {
  'simrat39/rust-tools.nvim',
  dependencies = 'neovim/nvim-lspconfig',
  opts = {
    server = {
      on_attach = function(client, bufnr)
        require('plugins.config.lspconfig').on_attach(client, bufnr)
        local rt = require 'rust-tools'
        local opts = { noremap = true, silent = true, buffer = bufnr }

        opts.desc = '[H]over Actions'
        vim.keymap.set('n', '<localleader>h', rt.hover_actions.hover_actions, opts)
        opts.desc = '[C]ode Actions'
        vim.keymap.set('n', '<localleader>a', rt.code_action_group.code_action_group, opts)
      end,
    },
  },
}
