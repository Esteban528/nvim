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
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight")
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
