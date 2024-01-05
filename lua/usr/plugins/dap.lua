return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap'
    },
    config = function()
        local dap = require("dap")

        vim.keymap.set("n", "<F7>", function() dap.step_into() end, { silent = true, desc = "Debug jump step into" })
        vim.keymap.set("n", "<F8>", function() dap.step_over() end, { silent = true, desc = "Debug jump step over" })
        vim.keymap.set("n", "<F9>", function() dap.step_out() end, { silent = true, desc = "Debug jump step out" })
        vim.keymap.set("n", "<F10>", function() dap.continue() end, { silent = true, desc = "Debug jump continue" })


        vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end,
            { silent = true, desc = "set [B]reakpoint" })
        vim.keymap.set("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
            { silent = true, desc = "set conditionaly [B]reakpoint" })

        vim.keymap.set("n", "<leader>rd", function() dap.continue() end,
            { silent = true, desc = "[R]un [D]ebugger" })

        local dapgo = require("dap-go")
        vim.keymap.set("n", "<leader>rdt", function() dapgo.debug_test() end,
            { silent = true, desc = "[R]un [D]ebugger [T]est" })

        local dapui = require("dapui")
        vim.keymap.set("n", "<leader>od", function() dapui.toggle() end,
            { silent = true, desc = "[O]pen [D]ebugger" })

        dapui.setup()
        dapgo.setup()
        require("nvim-dap-virtual-text").setup()

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end
}
