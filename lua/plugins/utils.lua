return {
	{
		"mg979/vim-visual-multi",
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			-- require("mini.files").setup()
			require("mini.statusline").setup()
			require("mini.pairs").setup()
			require("mini.snippets").setup({})
			-- vim.keymap.set("n", "<leader>n", ":lua MiniFiles.open() <CR>")

			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons()
			require("mini.indentscope").setup({
				draw = {
					-- Delay (in ms) between event and start of drawing scope indicator
					delay = 0,
				},
			})
      require("mini.diff").setup();
			vim.cmd("colorscheme minicyan")
      vim.cmd("set signcolumn=number")
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			vim.cmd("set termguicolors");
			require("colorizer").setup({
				"css",
				"javascript",
				html = {
					mode = "foreground",
				},
			})
		end,
	},
}
