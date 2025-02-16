return {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("onedark").setup({
			style = "warm",
		})
		require("onedark").load()
		vim.cmd("colorscheme onedark")
	end,
}
