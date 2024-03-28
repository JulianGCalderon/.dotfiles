return {
  'L3MON4D3/LuaSnip',
  dependencies = { 'rafamadriz/friendly-snippets' },
  config = function()
    require('luasnip.loaders.from_vscode').lazy_load()
  end,
  keys = {
    {
      '<C-k>',
      function()
        local ls = require 'luasnip'
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end,
      mode = { 'i', 's' },
      desc = 'Expand or jump in snippet',
    },
    {
      '<C-j>',
      function()
        local ls = require 'luasnip'
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end,
      mode = { 'i', 's' },
      desc = 'Jump back in snippet',
    },
  },
}
