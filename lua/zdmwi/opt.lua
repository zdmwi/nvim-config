vim.opt.nu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.cursorline = false
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.showmode = false -- stops showing the secondary vim mode
vim.o.cmdheight = 0 -- removes secondary vim status line

vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
