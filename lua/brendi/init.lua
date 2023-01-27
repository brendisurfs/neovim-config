require('brendi.set')
require('brendi.remap')
--
--local augroup = vim.api.nvim_create_augroup
--local brendiGroup = augroup("Brendi", {})
--
--local autocomd = vim.api.nvim_create_autocmd
--
--autocomd({ 'BufWritePre' }, {
--	group = brendiGroup,
--	pattern = "*",
--	command = ":lua vim.lsp.buf.format()"
--})
