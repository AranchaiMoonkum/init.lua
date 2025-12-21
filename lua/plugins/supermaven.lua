return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<tab>",
				clear_suggestion = "<c-]>",
				accept_wrd = "<c-j>",
			},
			ignore_filetypes = {},
			log_level = "info",
			disabe_inline_completion = false,
			disable_keymaps = false,
		})
	end,
}
