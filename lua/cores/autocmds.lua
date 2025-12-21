-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- No auto continue comments on new line
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("NoAutoContinueComments", {}),
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- Syntax highlight for dotenv file
vim.api.nvim_create_autocmd("BufRead", {
    group = vim.api.nvim_create_augroup("DotenvSyntaxHighlight", { clear = true }),
    pattern = { ".env", ".env.*" },
    callback = function()
        vim.bo.filetype = "dosini"
    end,
})

-- Disable number and relative number in terminal in neovim
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("CustomTermOpen", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})
