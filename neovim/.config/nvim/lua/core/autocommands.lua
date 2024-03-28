-- Highlight on yank
local yank_highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = yank_highlight_group,
  pattern = '*',
})

-- Format on save
local auto_format_group = vim.api.nvim_create_augroup('AutoFormat', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  group = auto_format_group,
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})
