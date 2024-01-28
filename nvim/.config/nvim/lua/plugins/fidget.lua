return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'jay-babu/mason-null-ls.nvim',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local mason_null_ls = require 'mason-null-ls'
    mason_null_ls.setup {
      automatic_installation = true,
    }

    local null_ls = require 'null-ls'

    local formatting = null_ls.builtins.formatting
    -- local diagnostics = none_ls.builtins.diagnostics

    null_ls.setup {
      sources = {
        formatting.isort,
        formatting.black,
        formatting.stylua,
        -- formatting.gofumpt,
        -- formatting.goimports,
        -- formatting.golines,
      },
    }
  end,
}
