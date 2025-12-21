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
					draw = {
						columns = {
							{ "kind_icon" },
							{ "label" },
							{ "kind", gap = 1 },
							{ "label_description", gap = 1 },
							{ "source_name", gap = 1 },
						},
					},
				},
				documentation = {
					auto_show = true,
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
