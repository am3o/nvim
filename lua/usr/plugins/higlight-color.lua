return {
	"brenoprata10/nvim-highlight-colors",
	enabled = true,
	event = "VeryLazy",
	opts = {},
	config = function(_, opts)
		require("nvim-highlight-colors").setup(opts)
	end,
}
