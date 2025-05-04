return {
	"laytan/cloak.nvim",
	enabled = true,
	event = {
		"BufReadPre *.env",
		"BufReadPre *.envrc",
	},
	opts = {
		cloak_character = "*",
		highlight_group = "Comment",
		cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
		try_all_patterns = true,
		patterns = {
			{
				file_pattern = {
					".env*",
				},
				cloak_pattern = "=.+",
			},
		},
	},
}
