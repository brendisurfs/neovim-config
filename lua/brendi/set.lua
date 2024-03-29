local set = vim.opt

set.nu = true
set.relativenumber = true
set.exrc = true
set.wrap = false
set.backup = false
set.undofile = true
set.shortmess = "c"
set.hlsearch = false
set.incsearch = true
set.swapfile = false

set.tabstop = 4
set.scrolloff = 8
set.shiftwidth = 4
set.softtabstop = 0
set.expandtab = true
set.updatetime = 50
set.signcolumn = "yes"
set.termguicolors = true
set.undodir = vim.fn.expand("~/.vim/undodir")

-- leptosfmt command for formatting leptos code
vim.api.nvim_create_user_command("LeptosFmt", "!leptosfmt .", {})
