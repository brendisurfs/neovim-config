local util = require("formatter.util")
require("formatter").setup({
  filetype = {
    typescript = {
      require("formatter.filetypes.typescript").prettierd,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettierd,
    },
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})

local augroup = vim.api.nvim_create_augroup
augroup("fmt", {})
local autocmd = vim.api.nvim_create_autocmd
--
autocmd({ "BufWritePre" }, {
  group = "fmt",
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end
})
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})
