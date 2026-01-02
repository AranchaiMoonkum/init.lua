return {
	"XXiaoA/atone.nvim",
	cmd = "Atone",
	keys = {
		{
			"<leader>u",
			function()
				vim.cmd.Atone()
			end,
		},
	},
	config = function()
		require("atone").setup({
			layout = { direction = "right" },
		})
	end,
}
