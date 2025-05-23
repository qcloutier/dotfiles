vim.g.loaded_fzf = 0
vim.g.loaded_netrw = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.o.breakindent = true
vim.o.completeopt = "fuzzy,menuone,noselect,popup"
vim.o.ignorecase = true
vim.o.laststatus = 3
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.shell = "fish"
vim.o.shiftround = true
vim.o.shiftwidth = 0
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.sidescrolloff = 16
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.wrap = false
vim.opt.fillchars:append("eob: ")
vim.opt.guicursor:append("a:blinkon500-blinkoff500")

vim.cmd([[
  aunmenu PopUp.-2-
  aunmenu PopUp.How-to\ disable\ mouse
]])
