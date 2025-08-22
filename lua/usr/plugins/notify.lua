return {
  "rcarriga/nvim-notify",
  enabled = true,
  opts = {
    background_colour = "#000000",
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)

    vim.notify = notify
  end,
}
