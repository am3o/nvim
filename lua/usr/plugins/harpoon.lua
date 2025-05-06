return {
	"ThePrimeagen/harpoon",
	enabled = true,
	lazy = true,
	branch = "harpoon2",
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
			desc = "[A]dd to harpoon",
		},
		{
			"<C-e>",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "View harpoon ui",
		},
		{
			"<C-z>",
			function()
				require("harpoon"):list():next()
			end,
			desc = "Next element in the harpoon list",
		},
		{
			"<C-t>",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "Next element in the harpoon list",
		},
	},
	opts = {},
}
