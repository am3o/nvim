vim.keymap.set("n", "<leader>vp", vim.cmd.Ex, { silent = true, desc = "[V]iew [P]roject" })
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { silent = true, desc = "[F]ormat [F]ile" })

-- Navigation
vim.keymap.set("n", "<C-o>", "<C-o>zz")

-- Search
vim.keymap.set({ "n", "v" }, "n", "nzz")
vim.keymap.set({ "n", "v" }, "N", "Nzz")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
