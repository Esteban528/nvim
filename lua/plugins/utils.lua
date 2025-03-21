return {
	{
		"mg979/vim-visual-multi",
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = {},
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = false, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function(colors) -- add/modify highlights
					return {}
				end,
				theme = "dragon", -- Load "wave" theme when 'background' option is not set
				background = { -- map the value of 'background' option to a theme
					dark = "dragon", -- try "dragon" !
					light = "lotus",
				},
			})
			vim.cmd("colorscheme kanagawa")
		end,
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.files").setup()
			require("mini.statusline").setup()
			require("mini.pairs").setup()
			require("mini.snippets").setup({})
			vim.keymap.set("n", "<leader>n", ":lua MiniFiles.open() <CR>")

			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons()
			require("mini.indentscope").setup({
				draw = {
					-- Delay (in ms) between event and start of drawing scope indicator
					delay = 0,
				},
			})
			require("mini.diff").setup()
			vim.cmd("set signcolumn=number")
			-- vim.opt.s
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
			vim.cmd("set termguicolors")
			require("colorizer").setup({
				"css",
				"javascript",
				"yml",
				html = {
					mode = "foreground",
				},
			})
		end,
	},
}
