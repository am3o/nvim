return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap'
    },
    config = function()
        vim.keymap.set("n", "<F7>", ":lua require'dap'.step_into()<CR>", { silent = true, desc = "Debug jump step into" })
        vim.keymap.set("n", "<F8>", ":lua require'dap'.step_over()<CR>", { silent = true, desc = "Debug jump step over" })
        vim.keymap.set("n", "<F9>", ":lua require'dap'.step_out()<CR>", { silent = true, desc = "Debug jump step out" })
        vim.keymap.set("n", "<F10>", ":lua require'dap'.continue()<CR>", { silent = true, desc = "Debug jump continue" })

        vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>",
            { silent = true, desc = "set [B]reakpoint" })
        vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
            { silent = true, desc = "set conditionaly [B]reakpoint" })
        vim.keymap.set("n", "<leader>rd", ":lua require'dap'.continue()<CR>",
            { silent = true, desc = "[R]un [D]ebugger" })
        vim.keymap.set("n", "<leader>rdt", ":lua require'dap-go'.debug_test()<CR>",
            { silent = true, desc = "[R]un [D]ebugger [T]est" })
        vim.keymap.set("n", "<leader>od", ":lua require'dapui'.toggle()<CR>",
            { silent = true, desc = "[O]pen [D]ebugger" })

        require("nvim-dap-virtual-text").setup()
        require('dap-go').setup()
        require("dapui").setup()

        local dap, dapui = require("dap"), require("dapui")
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
