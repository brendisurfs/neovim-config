vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "g]", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, opts)
vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, opts)
vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, opts)


-- barbar remap.
map("n", "≤", "<A-,>", opts)
map("n", "≥", "<A-.>", opts)
map("n", "ç", "<A-c>", opts)
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
map("n", "<leader>mt", ":MinimapToggle<CR>", opts)
