local message = {
	{
		header = "Good day, Sir",
		content = "Nice day for Fishin' ain't? 🎣",
	},
	{
		content = "During times of universal deceit.Telling the truth becomes a revolutionary act.",
	},
	{
		content = "Progress is our path, complexity builds the bridge, simplicity waits.",
	},
	{
		content = "If you need a machine and don’t buy it, then you will ultimately find that you have paid for it and don’t have it.",
	},
	{
		header = "Markus Rühl",
		content = "Muss net schmecke, muss wirke.",
	},
	{
		header = "Wayne Gretzky",
		content = "You miss 100% of the shots you don't take.",
	},
	{
		header = "A few good men",
		content = "A rooling stone gathers no moss",
	},
	{
		content = "Oh Captain, Oh Captain! 👨‍✈️",
	},
	{
		content = "Look at me. I'M THE CAPTAIN NOW ✌️",
	},
}

--- @param value any
--- @param rule string
--- @param length number
function Format(value, rule, length)
	local content = { "\n\t\t" }
	for str in string.gmatch(value, "[^" .. rule .. "]+") do
		table.insert(content, str)
		if #content % length == 0 then
			table.insert(content, "\n\t\t")
		end
	end

	return table.concat(content, " ")
end

-- Opening dialog
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		math.randomseed(os.time())
		local rnd = math.random(1, 100)

		local msg = message[(rnd % #message) + 1]
		local opts = {
			title = msg.header or "Good day, Sir",
			icon = "💢",
			render = "compact",
			stages = "slide",
		}

		vim.notify_once(Format(msg.content, "%s", 9), vim.log.levels.INFO, opts)
	end,
	group = vim.api.nvim_create_augroup("formating", { clear = true }),
	buffer = 0,
})
