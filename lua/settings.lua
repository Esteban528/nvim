local o = vim.o
local wo = vim.wo
local opt = vim.opt

vim.opt.encoding = "utf-8"
wo.number = true
o.clipboard = "unnamedplus"
o.relativenumber = true
o.numberwidth = 4

o.splitright = true
o.hidden = true
o.lazyredraw = true

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.undofile = true
opt.undolevels = 10000

opt.updatetime = 100
