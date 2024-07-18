require("w1zh")

vim.opt.clipboard = "unnamedplus"

-- Set commentstring for JavaScript files
vim.api.nvim_exec([[
    augroup MyJavaScriptComment
        autocmd!
        autocmd FileType javascript setlocal commentstring=//\ %s
    augroup END
]], false)

-- Set commentstring for TypeScript files
vim.api.nvim_exec([[
    augroup MyJavaScriptComment
        autocmd!
        autocmd FileType typescript setlocal commentstring=//\ %s
    augroup END
]], false)
