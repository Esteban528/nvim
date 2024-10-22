return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = { options = vim.opt.sessionoptions:get() },
		keys = {
			{
				"<leader>qs",
				function()
					require("persistence").load()
				end,
				desc = "Restore Session",
			},
			{
				"<leader>ql",
				function()
					require("persistence").load({ last = true })
				end,
				desc = "Restore Last Session",
			},
			{
				"<leader>qd",
				function()
					require("persistence").stop()
				end,
				desc = "Don't Save Current Session",
			},
		},
		config = function()
			require("persistence").setup({
				dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
				options = { "buffers", "curdir", "tabpages", "winsize" },
			})
		end,
	},
	{
		-- Icons for file types
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
}
