return {
	"karb94/neoscroll.nvim",
	enabled = true,
	keys = {
		"<C-u>",
		"<C-d>",
		"<C-b>",
		"<C-f>",
		"<C-y>",
		"zt",
		"zz",
		"zb",
	},
	opts = {
		mappings = {
			"<C-u>",
			"<C-d>",
			"<C-b>",
			"<C-f>",
			"<C-y>",
			"zt",
			"zz",
			"zb",
		},
		hide_cursor = true, -- Hide cursor while scrolling
		stop_eof = true, -- Stop at <EOF> when scrolling downwards
		respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
		cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
		easing_function = "quadratic", -- Default easing function
		performance_mode = false, -- Disable "Performance Mode" on all buffers.
		post_hook = nil, -- Function to run after the scrolling animation ends
		pre_hook = function()
			-- vim.cmd("norm! zz")
			-- local current_line_number = vim.fn.line('.')
			-- print("Current line number: " .. current_line_number)
		end, -- Function to run before the scrolling animation starts
	},
	config = function(_, opts)
		require("neoscroll").setup(opts)
	end,
}
