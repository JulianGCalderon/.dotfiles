return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- sources
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',

    -- snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- formatting
    'onsails/lspkind.nvim',
  },
  config = function(_)
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'

    cmp.setup {
      preselect = 'None',
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
      },
      sources = cmp.config.sources {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },
      },
      formatting = {
        format = lspkind.cmp_format {
          menu = {
            nvim_lsp = '[LSP]',
            path = '[path]',
            luasnip = '[snip]',
            buffer = '[buf]',
          },
        },
      },
    }
  end,
}
