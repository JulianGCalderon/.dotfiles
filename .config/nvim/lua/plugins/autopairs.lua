return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {},
  config = function(_, opts)
    local autopairs = require 'nvim-autopairs'

    autopairs.setup(opts)

    local ok, cmp = pcall(require, 'cmp')
    if ok then
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
  end,
}
