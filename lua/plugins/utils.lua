return {
	{
		"mg979/vim-visual-multi",
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.files").setup()
			require("mini.statusline").setup()
			require("mini.pairs").setup()
			vim.keymap.set("n", "<leader>n", ":lua MiniFiles.open() <CR>")

			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons()
		end,
	},
}
