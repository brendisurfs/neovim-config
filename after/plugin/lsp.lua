vim.cmd [[COQnow]]

vim.g.coq_settings = {
    ["keymap"] = {
        ['recommended'] = false,
        ["pre_select"] = false,
    },
    ["match"] = {
        ["exact_matches"] = 3,
    }
}
local coq = require("coq")
vim.cmd [[
ino <silent><expr> <C-f>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
]]

require("mason").setup()
require("gitsigns").setup()
require('lsp-format').setup()
require("mason-lspconfig").setup()
local lsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = lsp.get_installed_servers()



for _, server_name in pairs(servers) do
    -- if server_name == "rust_analyzer" then
    --     lspconfig["rust_analyzer"].setup({
    --         capabilities = {
    --             textDocument = {
    --                 completion = {
    --                     completionItem = {
    --                         snippetSupport = false,
    --                     },
    --                 },
    --             },
    --         },
    --     })
    -- end


    lspconfig[server_name].setup(coq.lsp_ensure_capabilities({
        on_attach = require('lsp-format').on_attach,
        capabilities = lsp_capabilities,
    }))
end
vim.diagnostic.config({
    virtual_text = false,
})


-- local cmp = require("cmp")
-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- local cmp_select = { behavior = cmp.SelectBehavior.Insert }
-- vim.opt.updatetime = 100
--
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
--
-- cmp.setup({
--     snippet = {
--         expand = function(args)
--             require("luasnip").lsp_expand(args.body)
--         end,
--     },
--     sources = cmp.config.sources({
--         { name = "nvim_lsp" },
--         { name = "nvim_lua" },
--         { name = "buffer" },
--         { name = "path" },
--         { name = "luasnip" },
--     }),
--     mapping = cmp.mapping.preset.insert({
--         ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
--         ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
--         ["<C-f>"] = cmp.mapping.confirm({ select = true }),
--         ["<C-space>"] = cmp.mapping.complete(),
--     }),
-- })

--- EFM for formatting

require("lsp-format").setup {
    sync = false
}
local prettier = {
    formatCommand = [[prettier --stdin-filepath ${INPUT}]],
    formatStdin = true
}

require("lspconfig").efm.setup {
    on_attach = require("lsp-format").on_attach,
    init_options = { documentFormatting = true },
    settings = {
        languages = {
            typescriptreact = { prettier },
            json = { prettier },
            css = { prettier },
        }
    }
}
