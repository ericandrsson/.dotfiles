local M = {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	dependencies = {
		"zbirenbaum/copilot-cmp",
	},
}

function M.config()
	require("copilot").setup({
		panel = {
			keymap = {
				jump_next = "<c-j>",
				jump_prev = "<c-k>",
				accept = "<c-l>",
				refresh = "r",
				open = "<M-CR>",
			},
		},
		suggestion = {
			enabled = true,
			auto_trigger = true,
			keymap = {
				accept = "<c-l>",
				next = "<c-j>",
				prev = "<c-k>",
				dismiss = "<c-h>",
			},
		},
		filetypes = {
			markdown = true,
			help = false,
			gitcommit = false,
			gitrebase = false,
			cvs = false,
			["."] = false,
		},
		copilot_node_command = "node",
	})

	local opts = { noremap = true, silent = true }
	vim.keymap.set("n", "<c-s>", function()
		require("copilot.suggestion").toggle_auto_trigger()
		vim.notify("Copilot has been toggled")
	end)
end

return M
