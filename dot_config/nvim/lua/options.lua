local g = vim.g
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

local opt = vim.opt
opt.guicursor:append("a:blinkon500-blinkoff500")
opt.ignorecase = true
opt.laststatus = 3
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.shell = "fish"
opt.shiftround = true
opt.shiftwidth = 0
opt.showtabline = 2
opt.sidescrolloff = 16
opt.signcolumn = "yes"
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.wrap = false
