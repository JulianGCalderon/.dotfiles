local M = {}

M.on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  opts.desc = '[G]oto [D]efinition'
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

  opts.desc = '[C]ode [A]ction'
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)

  opts.desc = '[R]ename Symbol'
  vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)

  opts.desc = 'Hover Documentation'
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

  -- opts.desc = "[G]oto [R]eferences"
  -- vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
  -- opts.desc = "[G]oto [I]mplementation"
  -- vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
end

return M
