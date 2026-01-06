return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	opts = {
		options = {
			theme = "auto",
			component_separators = "",
			section_separators = { left = "", right = "" },
			globalstatus = true,
			disabled_filetypes = {},
		},
		extensions = {},
		sections = {
			lualine_a = {
				{ "mode", separator = "" },
			},
			lualine_b = {},
			lualine_c = {
				{
					"filetype",
					icon_only = true,
					padding = { left = 1, right = 0 },
				},
				{ "filename", path = 1, separator = "", shorting_target = 40 },
				{
					"diff",
					symbols = {
						added = " ",
						modified = " ",
						removed = " ",
					},
				},
			},
			lualine_x = {
				{
					"diagnostics",
					symbols = {
						error = " ",
						warn = " ",
						info = " ",
						hint = "󰌵 ",
					},
				},
				{
					function()
						local msg = "LSP-Off"
						local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
						local clients = vim.lsp.get_clients()
						if next(clients) == nil then
							return msg
						end
						local displayed_clients = {}
						for _, client in ipairs(clients) do
							local filetypes = client.config.filetypes
							if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
								vim.list_extend(displayed_clients, { client.name })
							end
						end
						if #displayed_clients > 0 then
							return table.concat(displayed_clients, ", ")
						end
						return msg
					end,
					color = {
						fg = vim.api.nvim_get_hl(0, { name = "@tag" }).fg,
						gui = "bold",
					},
				},
				"progress",
				"location",
			},
			lualine_y = {},
			lualine_z = {
				{ "branch", icon = "" },
			},
		},
	},
}
