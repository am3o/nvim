return {
	"michaelrommel/nvim-silicon",
	enabled = true,
	lazy = "VeryLazy",
	cmd = "Silicon",
	opts = {
		-- most of them could be overridden with other
		-- the font settings with size and fallback font
		font = "VictorMono NF=34",
		-- the theme to use, depends on themes available to silicon
		theme = "gruvbox-dark",
		-- a string or function that defines the path to the output image
		output = function()
			return "/tmp/snapshot_" .. os.date("!%Y-%m-%dT%H-%M-%S") .. ".png"
		end,
	},
	config = function(_, opts)
		require("silicon").setup(opts)
	end,
}
