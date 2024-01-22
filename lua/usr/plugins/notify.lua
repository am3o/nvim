return {
	"rcarriga/nvim-notify",
	opts = {},
	config = function(_, opts)
		local notify = require("notify")
		vim.notify = notify

		notify.setup(opts)
	end,
}
