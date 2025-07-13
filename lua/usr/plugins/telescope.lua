return {
  "nvim-telescope/telescope.nvim",
  enabled = false,
  event = "VeryLazy",
  branch = "0.1.x",
  keys = {
    { "<leader>saf", desc = "[S]earch [A]round [F]iles" },
    { "<leader>sif", desc = "[S]earch [I]nner [F]iles" },
    { "<leader>sg",  desc = "[S]earch [B]uffers" },
    { "<leader>sb",  desc = "[S]earch [B]uffers" },
    { "<leader>sh",  desc = "[S]earch [H]elptags" },
    { "<leader>sm",  desc = "[S]earch [M]an-Pages" },
    { "<leader>sn",  desc = "[S]earch [N]otifications" },
    { "<leader>sc",  desc = "[S]earch [C]onfig" },
    { "<leader>cs",  desc = "[C]heck [S]pell" },
    { "<leader>u",   desc = "Search command history" },
  },
  dependencies = {
    { "debugloop/telescope-undo.nvim" },
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  opts = {
    defaults = {
      border = false,
      file_ignore_patterns = {
        "^.git/",
        "^vendor/",
        "node_modules",
        "^.DS_Store",
      },
      prompt_prefix = " 🔭 ",
    },
    pickers = {
      find_files = {
        hidden = true,
        additional_args = function()
          return {
            "--hidden",
            "--glob",
          }
        end,
      },
      live_grep = {
        hidden = true,
        additional_args = function()
          return {
            "--hidden",
          }
        end,
      },
      grep_string = {
        hidden = true,
        additional_args = function()
          return {
            "--hidden",
            "--glob",
          }
        end,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      },
      undo = {
        side_by_side = true,
        layout_strategy = "vertical",
        layout_config = {
          preview_height = 0.8,
        },
        use_delta = true,
        vim_diff_opts = {
          ctxlen = 0,
        },
        entry_format = "#$ID, $TIME",
        saved_only = true,
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    local extensions = {
      "fzf",
      "notify",
      "undo",
    }

    for _, extension in ipairs(extensions) do
      telescope.load_extension(extension)
    end

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>saf", builtin.find_files, { desc = "[S]earch [A]round [F]iles" })
    vim.keymap.set("n", "<leader>sif", builtin.live_grep, { desc = "[S]earch [I]nner [F]iles" })
    vim.keymap.set("n", "<leader>sg", builtin.git_files, { desc = "[S]earch [B]uffers" })
    vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffers" })
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elptags" })
    vim.keymap.set("n", "<leader>sm", builtin.man_pages, { desc = "[S]earch [M]an-Pages" })
    vim.keymap.set("n", "<leader>sn", "<cmd>Telescope notify<cr>", { desc = "[S]earch [N]otifications" })
    vim.keymap.set("n", "<leader>cs", builtin.spell_suggest, { desc = "[C]heck [S]pell" })
    vim.keymap.set("n", "<leader>u", function()
      telescope.extensions.undo.undo({ side_by_side = true })
    end, { desc = "[U]ndo" })
    vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Search find in files" })
    vim.keymap.set("n", "<C-r>", builtin.command_history, { desc = "Search command history" })
  end,
}
