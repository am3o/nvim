return {
	"ziontee113/ollama.nvim",
	enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local ollama = require("ollama")
		vim.keymap.set("n", "<C-i>", function()
			ollama.show()
		end, {})
	end,
}
