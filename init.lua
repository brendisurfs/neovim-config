require('brendi.packer')
require('brendi.remap')

local set = vim.opt
set.nu = true
set.relativenumber = true


vim.g.tabstop = 2
set.exrc = true
set.wrap = false
set.backup = false
set.undofile = true
set.incsearch = true
set.undodir = vim.fn.expand('~/.vim/undodir')

set.tabstop = 2
set.softtabstop = 2
set.scrolloff = 8
set.shiftwidth = 2
vim.cmd('set expandtab')
set.signcolumn = "yes"
set.termguicolors = true

