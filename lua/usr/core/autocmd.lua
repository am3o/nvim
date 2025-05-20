-- TODO: extract the messages to a better place
local header, content =
	{
		"Good day, Sir",
	}, {
		"\n\t\tNice day for Fishin' ain't? 🎣",
		"\n\t\tDuring times of universal deceit.\n\t\tTelling the truth becomes a revolutionary act.",
		"\n\t\tProgress is our path, complexity \n\t\tbuilds the bridge, simplicity waits.",
		"\n\t\tIf you need a machine and don’t buy it, \n\t\tthen you will ultimately find that you have \n\t\tpaid for it and don’t have it.",
		"\n\t\t Muss net schmecke, muss wirke.",
	}

-- TODO: extract the daily tip to a dedicated plugin to configure them and be able to disable it.
function format(value, rule)
	local rule = rule or "%s"

	local result = {}
	for str in string.gmatch(value, "([^" .. rule .. "])") do
		table.insert(result, str)
	end

	return table.concat(result, " ")
end

-- Opening dialog
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		math.randomseed(os.time())
		local rnd = math.random(1, 100)
		local opts = {
			title = header[(rnd % #header) + 1],
			icon = "💢",
			render = "compact",
			stages = "slide",
		}

		local message = content[(rnd % #content) + 1]
		vim.notify_once(message, vim.log.levels.INFO, opts)
	end,
	group = vim.api.nvim_create_augroup("formating", { clear = true }),
	buffer = 0,
})
