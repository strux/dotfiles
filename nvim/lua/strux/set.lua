vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.ts=2
vim.opt.sts=2
vim.opt.sw=2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true -- ignore case in search

vim.opt.visualbell = true
vim.opt.splitright = true

vim.opt.termguicolors = true
vim.cmd [[colorscheme NeoSolarized]]

vim.opt.hidden = true

vim.api.nvim_set_option("clipboard","unnamed")
