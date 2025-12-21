return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"angular",
				"html",
				"css",
				"scss",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"dockerfile",
				"python",
				"yaml",
				"toml",
				"lua",
				"luadoc",
				"vim",
				"vimdoc",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			sync_install = false,
			auto_install = true,
		})
	end,
}
