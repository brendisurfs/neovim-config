require('lsp-format').setup {
    sync = false,
    lua = {
        require("formatter.filetypes.lua").stylua,
    },
    css = {
        require('formatter.filetypes.css').prettier,
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
}

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
