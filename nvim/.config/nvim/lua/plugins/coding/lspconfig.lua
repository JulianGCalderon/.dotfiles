return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', opts = {} },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Completion capabilities
    'hrsh7th/cmp-nvim-lsp',

    -- Telescope for keybindings
    'nvim-telescope/telescope.nvim',

    -- Language tools
    { 'folke/neodev.nvim', opts = {} },

    -- Schemas
    { 'b0o/schemastore.nvim' },
  },
  config = function(_)
    local lspconfig = require 'lspconfig'
    local mason_lspconfig = require 'mason-lspconfig'

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    if ok then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    local servers = require('util.lsp').servers

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
          on_attach = require('util.lsp').on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    }
  end,
}
