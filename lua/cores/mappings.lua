vim.keymap.set("i", "jk", "<esc>") -- Exit Insert Mode
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv") -- Move Code Up
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv") -- Move Code Down
vim.keymap.set("x", "<leader>p", "_dP") -- Paste Without Deleting Previous Buffer
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>") -- Open Explorer

-- Open Terminal
vim.keymap.set("n", "<leader>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 5)
end)

-- Quickfix list
vim.keymap.set("n", "<leader>co", "<cmd>copen<cr>") -- Open Quickfix List
vim.keymap.set("n", "<leader>cj", "<cmd>cnext<cr>") -- Go To Next Quickfix List
vim.keymap.set("n", "<leader>ck", "<cmd>cprev<cr>") -- Go To Prev Quickfix List
