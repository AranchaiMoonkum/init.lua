require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    go = { "goimports-reviser" },
  },
})

-- Format by pressing <leader>-fm
vim.keymap.set("n", "<leader>fm", function()
  require("conform").format({ bufnr = 0 })
end)
