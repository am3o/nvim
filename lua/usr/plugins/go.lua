return {
	"ray-x/go.nvim",
	enabled = true,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
	},
	build = ":lua require('go.install').update_all_sync()", -- if you need to install/update all binaries
	opts = {},
	config = function(_, opts)
		local go = require("go")
		go.setup(opts)

		vim.keymap.set("n", "<leader>r", ":!go run .<CR>", { silent = true })
		vim.keymap.set("n", "<leader>gif", "<CMD>GoIfErr<CR>", { silent = true })
		vim.keymap.set("n", "<leader>gfs", "<CMD>GoFillStruct<CR>", { silent = true })
		vim.keymap.set("n", "<leader>gat", "<CMD>GoAddTag<CR>", { silent = true })
	end,
}
