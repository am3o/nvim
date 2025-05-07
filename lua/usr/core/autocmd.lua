function Opening()
	-- https://37signals.com
	local header, content =
		{
			"Good day, Sir",
		}, {
			"Nice day for Fishin' ain't? 🎣",
			"During times of universal deceit. Telling the truth becomes a revolutionary act.",
			"Progress is our path, complexity builds the bridge, simplicity waits.",
			"If you need a machine and don’t buy it, then you will ultimately find that you have paid for it and don’t have it.",
		}

	-- Seed the random number generator
	math.randomseed(os.time())
	local rnd = math.random(1, 100)
	return {
		Title = header[(rnd % #header) + 1],
		Content = content[(rnd % #content) + 1],
	}
end

-- Opening dialog
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local message = Opening()

		local opts = {
			title = message.Title,
			render = "compact",
			stages = "slide",
		}

		vim.notify_once(message.Content, vim.log.levels.INFO, opts)
	end,
	group = vim.api.nvim_create_augroup("formating", { clear = true }),
	buffer = 0,
})
