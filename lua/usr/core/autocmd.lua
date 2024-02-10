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
	end,
	group = formating,
	buffer = 0,
})

-- Setup Lua formating
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.lua" },
	desc = "Auto-format LUA files",
	callback = function()
		local fileName = vim.api.nvim_buf_get_name(0)

		vim.cmd(":silent !stylua " .. fileName)
		vim.notify("Formating succesfully done", vim.log.levels.DEBUG, { title = "stylua" })
	end,
	group = formating,
})

-- Setup yaml formating
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.yaml", "*.yml" },
	desc = "Auto-format YAML files",
	callback = function()
		local fileName = vim.api.nvim_buf_get_name(0)
		vim.cmd(":silent !yamlfmt " .. fileName)
		vim.notify("Formating succesfully done", vim.log.levels.INFO, { title = "yamlfmt" })
	end,
	group = formating,
})

-- Setup Golang formating
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.go" },
	desc = "Auto-format Golang files",
	callback = function()
		require("go.format").goimport() -- goimport + gofmt
		vim.notify("Formating successfully done", vim.log.levels.DEBUG, { title = "gofmt" })
	end,
	group = formating,
})

-- Setup Typescript formating
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
	desc = "Auto-format Typescript files",
	callback = function()
		local fileName = vim.api.nvim_buf_get_name(0)
		vim.cmd(":silent !prettier -w " .. fileName)
		vim.notify("Formating successfully done", vim.log.levels.INFO, { title = "prittier" })
	end,
	group = formating,
})
