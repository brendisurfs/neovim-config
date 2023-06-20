-- inoremap <silent><expr> <C-f> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"
-- inoremap <silent> <leader>ol :call CocOutline
local keyset = vim.keymap.set

local opts = {
    silent = true,
    noremap = true,
    expr = true,
    replace_keycodes = false,
}
--         ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
keyset("i", "<C-n>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<C-p>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- trigger completion
keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keyset("n", "g[", "<Plug>(coc-diagnostic-prev)", { silent = true })
keyset("n", "g]", "<Plug>(coc-diagnostic-next)", { silent = true })

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "gr", "<Plug>(coc-references)", { silent = true })

vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- accept keymap
keyset("i", "<C-f>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

vim.cmd [[ nnoremap<silent> gh :call CocActionAsync('doHover', 'float')<CR> ]]
-- keyset("n", "gh", vim.fn.CocActionAsync('doHover'), opts)

-- codeaction
keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
-- Symbol renaming
keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })


-- Apply codeAction to the selected region
-- Example: `<leader>aap` for current paragraph
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)


-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
})
