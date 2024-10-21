return {
	{
		"mg979/vim-visual-multi",
	},
	{
		"JosefLitos/colorizer.nvim",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
}
