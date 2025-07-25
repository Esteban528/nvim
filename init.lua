require("settings")
require("keybinds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- require('mods')
vim.g.NERDTreeWinSize = 42

require("lsp")
require("colors")
require("miniconfig.picker")
require("miniconfig.visits")
require("miniconfig.snippets")
