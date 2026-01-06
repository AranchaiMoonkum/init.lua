return {
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter" },
		config = true,
	},
	{
		"windwp/nvim-ts-autotag",
		config = true,
	},
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},
}
