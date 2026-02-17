return {
  "aikhe/wrapped.nvim",
  enabled = true,
  lazy = "VeryLazy",
  dependencies = {
    "nvzone/volt",
  },
  cmd = { "Wrapped" },
  opts = {
    path = vim.fn.stdpath("config"),
    border = true,
    size = {
      width = 120,
      height = 80,
    },
    exclude_filetype = {
      ".gitmodules",
    },
    cap = {
      commits = 1000,
      plugins = 100,
      plugins_ever = 200,
      lines = 10000,
    },
  },
}
