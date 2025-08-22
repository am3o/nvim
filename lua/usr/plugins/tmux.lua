return {
  "christoomey/vim-tmux-navigator",
  enabled = true,
  event = "VeryLazy",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    {
      "<c-h>",
      "<cmd><C-U>TmuxNavigateLeft<cr>",
      desc = "Jump to left window"
    },
    {
      "<c-j>",
      "<cmd><C-U>TmuxNavigateDown<cr>",
      desc = "Jump to downside window"
    },
    {
      "<c-k>",
      "<cmd><C-U>TmuxNavigateUp<cr>",
      desc = "Jump to upside window"
    },
    {
      "<c-l>",
      "<cmd><C-U>TmuxNavigateRight<cr>",
      desc = "Jump to right window"
    },
    {
      "<c-\\>",
      "<cmd><C-U>TmuxNavigatePrevious<cr>",
      desc = "Jump to previous window"
    },
  },
}
