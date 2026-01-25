return {
	"zbirenbaum/copilot.lua",
	dependencies = "copilotlsp-nvim/copilot-lsp",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<C-l>",
				},
			},
			nes = {
				enabled = true,
				keymap = {
					accept_and_goto = "<leader>p",
					accept = false,
					dismiss = "<Esc>",
				},
			},
		})
	end,
}
