local M = {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "canary",
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- or "github/copilot.vim" as an alternative
		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper functionalities
		{ "folke/which-key.nvim" }, -- for keybindings
	},
}

function M.config()
	require("CopilotChat").setup({
		debug = false,
		-- default window options
		window = {
			layout = "vertical", -- 'vertical', 'horizontal', 'float', 'replace'
			width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
			height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
			-- Options below only apply to floating windows
			relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
			border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
			row = nil, -- row position of the window, default is centered
			col = nil, -- column position of the window, default is centered
			title = "Copilot Chat", -- title of chat window
			footer = nil, -- footer of chat window
			zindex = 1, -- determines if window is on top or below other floating windows
		},
		mappings = {
			complete = {
				detail = "Use @<Tab> or /<Tab> for options.",
				insert = "<Tab>",
			},
			close = {
				normal = "q",
				insert = "<C-c>",
			},
			reset = {
				normal = "<C-r>",
				insert = "<C-r>",
			},
			submit_prompt = {
				normal = "<CR>",
				insert = "<C-s>",
			},
			accept_diff = {
				normal = "<C-y>",
				insert = "<C-y>",
			},
			yank_diff = {
				normal = "gy",
			},
			show_diff = {
				normal = "gd",
			},
			show_system_prompt = {
				normal = "gp",
			},
			show_user_selection = {
				normal = "gs",
			},
		},
	})

	local chat = require("CopilotChat")
	local wk = require("which-key")

	wk.register({
		["<leader>c"] = {
			name = "+CopilotChat",

			o = {
				function()
					chat.toggle({})
				end,
				"Toggle CopilotChat",
			},

			h = {
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(actions.help_actions())
				end,
				"CopilotChat - Help actions",
			},
			p = {
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
				end,
				"CopilotChat - Prompt actions",
			},
		},
	})
end

return M
