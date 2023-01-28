local util = require("formatter.util")
require("formatter").setup {
  filetype = {
    typescriptreact = {
      require('formatter.filetypes.typescriptreact').prettierd,
    },
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

vim.g.prettier = {
  autoformat_config_present = 1,
}

local augroup = vim.api.nvim_create_augroup
local FormatBrendi = augroup("Brendi", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd({ 'BufWritePre' }, {
  group = FormatBrendi,
  pattern = "*",
  command = "lua vim.lsp.buf.format()"
})


-- autocmd({ "CursorHold" }, {
--   callback = function()
--     local curs = vim.fn.expand('<cword>')
--     local len_cword = curs:len()
--     local cursor = vim.api.nvim_win_get_cursor(0)
--     local line = cursor[1]
--     local start_cursor = cursor[2]
--     local end_cursor = start_cursor + len_cword
--
--     local ns = vim.api.nvim_create_namespace("currentword")
--     vim.api.nvim_buf_add_highlight(0, ns, curs, line, start_cursor, end_cursor)
--
--     print(start_cursor, end_cursor)
--   end
-- })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end
})
