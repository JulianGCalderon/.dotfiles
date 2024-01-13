return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', opts = {} },
    { 'williamboman/mason-lspconfig.nvim' },

    -- completion capabilities
    'hrsh7th/cmp-nvim-lsp',

    -- language tools
    { 'folke/neodev.nvim', opts = {} },

    -- pretty progress messages
    { 'j-hui/fidget.nvim', opts = {} },

    -- Telescope for keybindings
    'nvim-telescope/telescope.nvim',
  },
  config = function(_)
    local servers = {
      gopls = {
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
    }

    local lspconfig = require 'lspconfig'
    local mason_lspconfig = require 'mason-lspconfig'

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
      handlers = {
        function(server_name)
          lspconfig[server_name].setup {
            capabilities = capabilities,
            on_attach = require('util.lsp').on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
          }
        end,
      },
    }
  end,
}
