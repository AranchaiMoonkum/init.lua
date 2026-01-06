return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-path",
	},
	config = function()
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
			-- float = {
			-- 	border = "single",
			-- },
		})

		-- Hover with border
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "single",
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("LspConfig", {}),
			callback = function(args)
				local opts = { buffer = args.buf, noremap = true, silent = true }

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
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

		vim.keymap.set("n", "<leader>q", function()
			vim.diagnostic.setqflist({
				bufnr = 0,
				severity = { min = vim.diagnostic.severity.WARN },
				open = true,
			})
		end)

		vim.keymap.set("n", "<leader>qe", function()
			vim.diagnostic.setqflist({
				bufnr = 0,
				severity = vim.diagnostic.severity.ERROR,
				open = true,
			})
		end)

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

		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		local kind_icons = {
			Text = "󰉿",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰜢",
			Variable = "󰀫",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "󰑭",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "󰈇",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "󰙅",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "",
		}

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "buffer" },
			},
			mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						path = "[Path]",
					})[entry.source.name]
					return vim_item
				end,
			},
		})

		-- Apply LSP config with cmp capabilities
		vim.lsp.config("*", {
			capabilities = capabilities,
		})
	end,
}
