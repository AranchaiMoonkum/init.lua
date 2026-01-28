require("oil").setup({
  columns = { "icon" },
  buf_options = { bufhidden = "hide" },
})
vim.keymap.set("n", "-", "<cmd>Oil<cr>")
