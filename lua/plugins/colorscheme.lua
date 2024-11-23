return {
  'kvrohit/rasmus.nvim',

	priority = 1000,
	config = function()
		vim.o.background = "dark"
    vim.opt.termguicolors = true
		vim.cmd("colorscheme rasmus")
	end,
}
