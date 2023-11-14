-- cursor line
vim.opt.guicursor = ""
vim.opt.cursorline = true

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs & indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- line wrapping
vim.opt.wrap = true

-- swap mechanism
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.cache/vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

-- vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- turn on termguicolors for nightfly colorschema to work
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
