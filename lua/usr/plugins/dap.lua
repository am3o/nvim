return {
	"rcarriga/nvim-dap-ui",
	enabled = true,
	event = "VeryLazy",
	dependencies = {
		"leoluz/nvim-dap-go",
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")

		vim.keymap.set("n", "<F7>", dap.step_into, { silent = true, desc = "Debug jump step into" })
		vim.keymap.set("n", "<F8>", dap.step_over, { silent = true, desc = "Debug jump step over" })
		vim.keymap.set("n", "<F9>", dap.step_out, { silent = true, desc = "Debug jump step out" })
		vim.keymap.set("n", "<F10>", dap.continue, { silent = true, desc = "Debug jump continue" })

		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { silent = true, desc = "set [B]reakpoint" })
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { silent = true, desc = "set conditionaly [B]reakpoint" })

		vim.keymap.set("n", "<leader>rd", dap.continue, { silent = true, desc = "[R]un [D]ebugger" })

		local dapgo = require("dap-go")
		vim.keymap.set("n", "<leader>rdt", dapgo.debug_test, { silent = true, desc = "[R]un [D]ebugger [T]est" })

		local dapui = require("dapui")
		vim.keymap.set("n", "<leader>od", dapui.toggle, { silent = true, desc = "[O]pen [D]ebugger" })

		dapui.setup()
		dapgo.setup()

		require("nvim-dap-virtual-text").setup({})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
