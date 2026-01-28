-- Show diagnostic virtual text
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
  virtual_text = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspConfig", {}),
  callback = function(args)
    local opts = { buffer = args.buf, noremap = true, silent = true }

    -- Mappings.
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

    -- Show diagnostics if available, otherwise show hover
    vim.keymap.set("n", "K", function()
      local line = vim.api.nvim_win_get_cursor(0)[1] - 1
      if vim.diagnostic.get(0, { lnum = line })[1] then
        vim.diagnostic.open_float()
      else
        vim.lsp.buf.hover()
      end
    end)
  end,
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "ts_ls",
    "tailwindcss",
    "cssls",
    "html",
    "biome",
    "jsonls",
    "gopls",
    "basedpyright",
  },
})

local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Apply LSP config with cmp capabilities
vim.lsp.config("*", {
  capabilities = capabilities,
})
