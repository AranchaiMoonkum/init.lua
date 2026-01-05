return {
	"rachartier/tiny-code-action.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	event = "LspAttach",
	config = function()
		require("tiny-code-action").setup({
			backend = "vim",
			picker = {
				"buffer",
				opts = {
					hotkeys = true,
					winborder = "single",
					keymaps = {
						preview = "K",
						close = { "q", "<Esc>" },
						select = "<CR>",
						preview_close = { "q", "<Esc>" },
					},
				},
			},
		})

		vim.keymap.set({ "n", "x" }, "<leader>ca", function()
			require("tiny-code-action").code_action()
		end, { noremap = true, silent = true })
	end,
}
