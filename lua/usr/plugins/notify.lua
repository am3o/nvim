return {
	"rcarriga/nvim-notify",
	enabled = true,
	opts = {},
	config = function(_, opts)
		local notify = require("notify")
		vim.notify = notify

		notify.setup(opts)
	end,
}
