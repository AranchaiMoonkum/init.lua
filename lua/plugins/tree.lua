return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("oil").setup({
			columns = { "icon" },
			buf_options = { bufhidden = "hide" },
		})
		vim.keymap.set("n", "-", "<cmd>Oil<cr>")
	end,
}
