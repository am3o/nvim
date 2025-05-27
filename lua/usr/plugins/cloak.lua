return {
	"laytan/cloak.nvim",
	enabled = true,
	lazy = true,
	event = {
		"BufReadPre *.env",
		"BufReadPre *.envrc",
	},
	opts = {
		cloak_character = "*",
		highlight_group = "Comment",
		cloak_length = 16, -- Provide a number if you want to hide the true length of the value.
		try_all_patterns = true,
		patterns = {
			{
				file_pattern = {
					".envrc",
					".env",
				},
				cloak_pattern = "=.+",
			},
		},
	},
}
