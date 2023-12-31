return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	requires = {
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon.setup({})

		-- Add the current file to Harpoon's list
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():append()
		end)
		vim.keymap.set("n", "<leader>ht", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		-- Navigate to files at indices 1-9
		for i = 1, 9 do
			vim.keymap.set("n", "<leader>h" .. i, function()
				harpoon:list():select(i)
			end)
		end
	end,
}

-- vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
