-- Create group to assign commandsaut
-- "clear = true" must be set to prevent loading an
-- auto-command repeatedly every time a file is resourced
local formating = vim.api.nvim_create_augroup("formating", { clear = true })

-- Opening dialog
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local opts = {
			title = "Good day, Sir",
			render = "compact",
			stages = "slide",
		}
		vim.notify_once("Nice day for Fishin' ain't? 🎣", vim.log.levels.INFO, opts)
		-- During times of universal deceit. Telling the truth becomes a revolutionary act.
	end,
	group = formating,
	buffer = 0,
})
