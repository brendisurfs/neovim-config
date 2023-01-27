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
local autocomd = vim.api.nvim_create_autocmd

autocomd({ 'BufWritePre' }, {
  group = FormatBrendi,
  pattern = "*",
  command = "lua vim.lsp.buf.format()"
})
