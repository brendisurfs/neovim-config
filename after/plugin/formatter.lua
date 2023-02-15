-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.opt.list = true
-- sets blank line to only context highlight.
vim.cmd [[highlight IndentBlanklineChar guifg=#191724 gui=nocombine]]
require("indent_blankline").setup({
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
})

