return {
  {
    "j-hui/fidget.nvim",
    opts = {}
  },
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim',          opts = {} },
      { 'williamboman/mason-lspconfig.nvim' },

      -- completion capabilities
      "hrsh7th/cmp-nvim-lsp",

      -- language tools
      { "folke/neodev.nvim", opts = {} },

      -- Telescope for keybindings
      'nvim-telescope/telescope.nvim',
    },
    config = function(_)
      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        opts.desc = "[G]oto [D]efinition"
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

        opts.desc = "[G]oto [R]eferences"
        vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)

        opts.desc = "[G]oto [I]mplementation"
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)

        opts.desc = "[C]ode [A]ction"
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "[C]ode [R]ename"
        vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, opts)

        opts.desc = "Hover Documentation"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      end

      local servers = {
        gopls = {
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
        rust_analyzer = {},
        lua_ls = {},
        pyright = {},
        clangd = {},
      }

      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            lspconfig[server_name].setup {
              capabilities = capabilities,
              on_attach = on_attach,
              settings = servers[server_name],
              filetypes = (servers[server_name] or {}).filetypes,
            }
          end,
        }
      }
    end,
  },
}
