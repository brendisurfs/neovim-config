local lsp = require("lsp-zero")
lsp.preset("recommended")

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Insert }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-f>"] = cmp.mapping.confirm({ select = true }),
  ["<C-space>"] = cmp.mapping.complete(),
})
vim.opt.updatetime = 100

lsp.set_preferences({
  sign_icons = {},
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})

local entry_filter = function(entry, ctx)
  local kind = cmp.types.lsp.CompletionItemKind[entry:get_kind()]
  print(kind)
  if kind == "Text" then
    return false
  end
  return true
end

cmp.setup({
  sources = {
    {
      name = "nvim_lua",
      entry_filter = entry_filter
    },
    {
      name = "path",
      entry_filter = entry_filter
    },
    {
      name = "nvim_lsp",
      entry_filter = entry_filter
    },
  },
})

lsp.setup()
