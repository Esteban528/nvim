local o = vim.o
local wo = vim.wo

o.encoding = "utf-8"
wo.number = true
o.clipboard = "unnamedplus"
o.relativenumber = true
o.numberwidth = 5
-- o.winborder = "single"

o.splitright = true
o.hidden = true
o.lazyredraw = true

-- Indenting
o.expandtab = true
o.smartindent = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2

o.undofile = true
o.undolevels = 10000

-- opt.updatetime = 200

vim.opt.wrap = false

vim.cmd("autocmd FileType java setlocal et ts=4 sw=4 sts=4 <CR>")
vim.cmd("set signcolumn=number")

