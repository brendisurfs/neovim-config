-- just to close nerdtree when its the last buffer.
vim.cmd [[
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]]

vim.g.NERDTreeWinPos = "right"
vim.keymap.set('n', "<C-f>", ":NERDTreeFind<CR>", { noremap = true })
vim.keymap.set('n', "<C-t>", ":NERDTreeToggle<CR>", { noremap = true })
vim.keymap.set('n', '<leader>n', ":NERDTreeFocus<CR>", { noremap = true })
