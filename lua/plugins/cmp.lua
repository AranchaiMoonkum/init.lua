return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	config = function()
		require("blink.cmp").setup({
			keymap = { preset = "default" },
			appearance = { nerd_font_variant = "mono" },
			signature = {
				enabled = true,
				window = { show_documentation = false },
			},
			completion = {
				menu = {
					auto_show = true,
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = {
				implementation = "lua",
				sorts = {
					"exact",
					"score",
					"sort_text",
				},
			},
		})
	end,
}
