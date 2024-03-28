local M = {}

M.on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  opts.desc = '[G]oto [D]efinition'
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

  opts.desc = '[C]ode [A]ction'
  vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
  opts.desc = '[C]ode [R]eferences'
  vim.keymap.set('n', '<leader>cr', require('telescope.builtin').lsp_references, opts)
  opts.desc = '[C]ode [I]mplementation'
  vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, opts)

  opts.desc = '[R]ename Symbol'
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)

  opts.desc = 'Hover Documentation'
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
end

M.servers = {
  gopls = {
    usePlaceholders = true,
    analyses = {
      unusedparams = true,
    },
  },
  jsonls = {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = {},
      },
    },
  },
  rust_analyzer = {},
  tsserver = {},
  lua_ls = {},
  pyright = {},
}

return M
