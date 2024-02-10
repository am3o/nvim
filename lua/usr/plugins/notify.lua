return {
	"rcarriga/nvim-notify",
	enabled = true,
	opts = {
		-- background_colour = "#000000",
	},
	config = function(_, opts)
		local notify = require("notify")
		vim.notify = notify

		notify.setup(opts)
	end,
}
