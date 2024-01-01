-- [[ Keymaps ]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Move selection
vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('v', '<M-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })

-- Indent keeping selection
vim.keymap.set('v', '>', '>gv', { desc = 'Shift selection rightwards' })
vim.keymap.set('v', '<', '<gv', { desc = 'Shift selection leftwards' })

-- Keep cursor on center
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll downward' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll upwards' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Repeat forward search' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Repeat backwards search' })

-- Delete without yank
vim.keymap.set('n', 'x', '"_x', { desc = 'Delete under cursor' })

-- Update current buffer
vim.keymap.set('n', '<C-s>', '<CMD>up<CR>', { desc = 'Save current file' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = '[D]iagnostic floating window' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = '[D]iagnostics list' })

-- Disable highlight on esc
vim.keymap.set('n', '<esc>', ':noh<CR>', { desc = 'No highlight' })
