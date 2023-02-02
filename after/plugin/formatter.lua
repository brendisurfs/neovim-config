local format = function(payload)
  vim.lsp.buf.format({
    filter = function(client)
      print(client[1])
      return client.name ~= "volar"
    end,
  })
end

require("formatter").setup({
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettier,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("fmt", {})
--
autocmd({ "BufWritePre" }, {
  group = "fmt",
  pattern = "*",
  command = "Format"
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

require("indent_blankline").setup({
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
})
