return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>gg", builtin.git_status, { desc = "Telescope git status" })
		vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fs", ":Telescope possession list<CR>", { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>hs", ":Telescope harpoon marks<CR>", { desc = "Telescope help tags" })

		require("telescope").setup({
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
			defaults = {
				vimgrep_arguments = {
					"rg",
					"-L",
					-- "--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						preview_width = 0.6,
						results_width = 0.8,
					},
					width = function(_, max_columns, _)
						return math.min(max_columns, 200)
					end,
					height = function(_, _, max_lines)
						return math.min(max_lines, 40)
					end,
				},
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				file_ignore_patterns = { "node_modules", "target", "files/", "build/", "gradle/", "bin"},
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				path_display = { "truncate" },
				winblend = 0,
				border = {},
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				color_devicons = true,
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				mappings = {
					n = { ["q"] = require("telescope.actions").close },
				},
			},
			extensions_list = { "themes", "terms" },
		})
	end,
}
