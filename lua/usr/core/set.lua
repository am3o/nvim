-- cursor line
vim.opt.guicursor = ""
vim.opt.cursorline = true

-- line numbers
vim.opt.nu = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 999

-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- spelling
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- line wrapping
vim.opt.wrap = true

-- swap mechanism
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.cache/vim/undodir"
vim.opt.undofile = true

-- split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- divers
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.scrolloff = 10

vim.opt.isfname:append("@-@")
vim.opt.inccommand = "split"

-- update intervals
vim.opt.updatetime = 200
vim.opt.timeoutlen = 300

-- turn on termguicolors for nightfly colorschema to work
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

-- shell options
vim.opt.shell = "/opt/homebrew/bin/zsh"
vim.opt.showmode = false
