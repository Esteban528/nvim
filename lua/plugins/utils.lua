return {
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
		"tpope/vim-sleuth",
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			-- Default options:
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function(colors) -- add/modify highlights
					return {}
				end,
				theme = "wave", -- Load "wave" theme
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus",
				},
			})

			-- setup must be called before loading
			vim.cmd("colorscheme kanagawa")
		end,
	},
	-- {
	-- 	"HoNamDuong/hybrid.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		-- Lua
	-- 		-- vim.opt.background = "bamboo" -- set this to dark or light
	-- 		vim.cmd.colorscheme "hybrid"
	-- 	end,
	-- },
	{
		"https://gitlab.com/Alucherdi/hand-of-god",
		config = function()
			local jumper = require("handofgod.jumper")
			jumper.setup()

			-- add file to jumper list
			vim.keymap.set("n", "<leader>a", function()
				jumper.add()
			end)
			-- explore jumper list as buffer
			vim.keymap.set("n", "<leader>e", function()
				jumper:explore()
			end)

			-- jump bindings
			vim.keymap.set("n", "<A-h>", function()
				jumper.jump_to(1)
			end)
			vim.keymap.set("n", "<A-j>", function()
				jumper.jump_to(2)
			end)
			vim.keymap.set("n", "<A-k>", function()
				jumper.jump_to(3)
			end)
			vim.keymap.set("n", "<A-l>", function()
				jumper.jump_to(4)
			end)
		end,
	},
}
