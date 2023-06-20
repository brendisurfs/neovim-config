vim.diagnostic.config({
    virtual_text = false,
})

vim.cmd [[ au BufNewFile,BufRead *.wgsl set filetype=wgsl ]]
