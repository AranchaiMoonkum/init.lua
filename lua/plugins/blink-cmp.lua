require("blink-cmp").setup({
	appearance = {
		use_nvim_cmp_as_default = false,
		nerd_font_variant = "normal",
	},
	signature = {
		enabled = true,
	},
	sources = {
		default = { "lsp", "path", "snippets", "env" },
		providers = {
			env = {
				module = "blink-cmp-env",
				name = "Env",
				score_offset = -3,
				opts = {},
				max_items = 5,
			},
			lsp = {
				async = true,
				max_items = 7,
			},
			snippets = {
				opts = {
					friendly_snippets = true,
				},
				max_items = 5,
			},
		},
	},
cmdline = {
		completion = {
			ghost_text = {
				enabled = false,
			},
			menu = {
				auto_show = true,
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
		},
	},
	completion = {
		ghost_text = { enabled = false },
		list = {
			selection = {
				preselect = true,
				auto_insert = true,
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 50,
		},
		menu = {
			draw = {
				columns = {
					{ "label", gap = 1 },
					{ "source_name" },
				},
				components = {
					label = {
						text = function(ctx)
							return require("colorful-menu").blink_components_text(ctx)
						end,
						highlight = function(ctx)
							return require("colorful-menu").blink_components_highlight(ctx)
						end,
					},
				},
			},
		},
	},
})
