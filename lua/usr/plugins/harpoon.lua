return {
	"ThePrimeagen/harpoon",
	enabled = true,
	lazy = true,
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>a", desc = "[A]dd to harpoon" },
		{ "<C-e>", desc = "View harpoon ui" },
	},
	config = function()
		local harpoon = require("harpoon")

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)

		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		harpoon:setup()
	end,
}
