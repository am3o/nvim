return {
  {
    "rcarriga/nvim-dap-ui",
    enabled = true,
    lazy = true,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    keys = {
      {
        "<F7>",
        function()
          return require("dap").step_into()
        end,
        desc = "Debug jump step into"
      },
      {
        "<F8>",
        function()
          return require("dap").step_over()
        end,
        desc = "Debug jump step over"
      },
      {
        "<F9>",
        function()
          return require("dap").step_out()
        end,
        desc = "Debug jump step out"
      },
      {
        "<F10>",
        function()
          return require("dap").continue()
        end,
        desc = "Debug jump continue"
      },
      {
        "<leader>b",
        function()
          return require("dap").toggle_breakpoint()
        end,
        desc = "set [B]reakpoint"
      },
      {
        "<leader>B",
        function()
          return require("dap").set_breakpoint(vim.fn.input("Breakpoint conditions: "))
        end,
        desc = "set conditionaly [B]reakpoint"
      },
      {
        "<leader>dr",
        function()
          return require("dap").restart()
        end,
        desc = "[R]un [D]ebugger"
      },
      {
        "<leader>od",
        function()
          return require("dapui").toggle()
        end,
        desc = "[O]pen [D]ebugger"
      },
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

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
      {
        "<leader>rdt",
        function()
          return require("dap-go").debug_test
        end,
        desc = "[R]un [D]ebugger [T]est"
      }
    },
    opts = {}
  },
}
