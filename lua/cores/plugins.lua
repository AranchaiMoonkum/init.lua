return {
	-- Colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-latte")
		end,
	},

	-- Blink completion
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"xzbdmw/colorful-menu.nvim",
			"bydlw98/blink-cmp-env",
		},
		version = "v1.8.0",
		event = "InsertEnter",
		config = function()
			require("plugins.blink-cmp")
		end,
	},

	-- Blink pairs
	{
		"saghen/blink.pairs",
		version = "*",
		dependencies = "saghen/blink.download",
		config = function()
			require("plugins.blink-pairs")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		config = function()
			require("plugins.conform")
		end,
	},

	-- Oil
	{
		"stevearc/oil.nvim",
		lazy = false,
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.tree")
		end,
	},

	-- Auto tag
	{
		"windwp/nvim-ts-autotag",
		config = true,
	},

	-- TS comments
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},

	-- Tiny code action
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "LspAttach",
		config = function()
			require("plugins.tca")
		end,
	},

	-- Lazydev
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	-- LSP
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("plugins.lsp")
		end,
	},

	-- Copilot
	{
		"zbirenbaum/copilot.lua",
		dependencies = "copilotlsp-nvim/copilot-lsp",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("plugins.copilot")
		end,
	},

	-- TypeScript error translator
	{
		"dmmulroy/ts-error-translator.nvim",
		config = function()
			require("ts-error-translator").setup()
		end,
	},

	-- Trouble
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
    config = function()
      require("plugins.telescope")
    end,
	},
}
