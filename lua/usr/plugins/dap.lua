return {
	{
		"rcarriga/nvim-dap-ui",
		enabled = true,
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
		keys = {
			{ "<F7>", desc = "Debug jump step into" },
			{ "<F8>", desc = "Debug jump step over" },
			{ "<F9>", desc = "Debug jump step out" },
			{ "<F10>", desc = "Debug jump continue" },
			{ "<leader>b", desc = "set [B]reakpoint" },
			{ "<leader>B", desc = "set conditionaly [B]reakpoint" },
			{ "<leader>rd", desc = "[R]un [D]ebugger" },
			{ "<leader>od", desc = "[O]pen [D]ebugger" },
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			vim.keymap.set("n", "<F7>", dap.step_into, { silent = true, desc = "Debug jump step into" })
			vim.keymap.set("n", "<F8>", dap.step_over, { silent = true, desc = "Debug jump step over" })
			vim.keymap.set("n", "<F9>", dap.step_out, { silent = true, desc = "Debug jump step out" })
			vim.keymap.set("n", "<F10>", dap.continue, { silent = true, desc = "Debug jump continue" })

			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { silent = true, desc = "set [B]reakpoint" })
			vim.keymap.set("n", "<leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { silent = true, desc = "set conditionaly [B]reakpoint" })

			vim.keymap.set("n", "<leader>rd", dap.continue, { silent = true, desc = "[R]un [D]ebugger" })
			vim.keymap.set("n", "<leader>od", dapui.toggle, { silent = true, desc = "[O]pen [D]ebugger" })

			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close
		end,
	},
	{
		"leoluz/nvim-dap-go",
		enabled = true,
		ft = {
			"go",
			"gomod",
		},
		keys = {
			{ "<leader>rd", desc = "[R]un [D]ebugger" },
			{ "<leader>rdt", desc = "[R]un [D]ebugger [T]est" },
		},
		config = function()
			local dapgo = require("dap-go")

			dapgo.setup()
			vim.keymap.set("n", "<leader>rdt", dapgo.debug_test, { silent = true, desc = "[R]un [D]ebugger [T]est" })
		end,
	},
}
