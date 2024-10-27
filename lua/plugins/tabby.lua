local gruvbox_dark = {
	accent = "#B3B626",
	accent_sec = "#a89984", -- fg4
	bg = "#3c3836", -- bg1
	bg_sec = "#504945", -- bg2
	fg = "#d5c4a1", -- fg2
	fg_sec = "#bdae93", -- fg3
}

local buffer_is_saved = function()
	local buff = vim.api.nvim_get_current_buf()
	if vim.api.nvim_buf_get_option(buff, "modified") then
		return "  "
	else
		return "  "
	end
end

local tabby_config = function()
	local palette = gruvbox_dark
	local filename = require("tabby.filename")
	local cwd = function()
		return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
	end
	local tabname = function(tabid)
		return vim.api.nvim_tabpage_get_number(tabid)
	end
	local line = {
		hl = { fg = palette.fg, bg = palette.bg },
		layout = "active_wins_at_tail",
		head = {
			{ "  NeoVim ", hl = { fg = palette.bg, bg = palette.accent } },
			{ "", hl = { fg = palette.accent, bg = palette.bg } },
		},
		active_tab = {
			label = function(tabid)
				return {
					"  " .. tabname(tabid) .. " ",
					hl = { fg = palette.bg, bg = palette.accent_sec, style = "bold" },
				}
			end,
			left_sep = { "", hl = { fg = palette.accent_sec, bg = palette.bg } },
			right_sep = { "", hl = { fg = palette.accent_sec, bg = palette.bg } },
		},
		inactive_tab = {
			label = function(tabid)
				return {
					"  " .. tabname(tabid) .. " ",
					hl = { fg = palette.fg, bg = palette.bg_sec, style = "bold" },
				}
			end,
			left_sep = { "", hl = { fg = palette.bg_sec, bg = palette.bg } },
			right_sep = { "", hl = { fg = palette.bg_sec, bg = palette.bg } },
		},
		top_win = {
			label = function(winid)
				return {
					buffer_is_saved() .. filename.unique(winid) .. " ",
					hl = { fg = palette.fg, bg = palette.bg_sec },
				}
			end,
			left_sep = { "", hl = { fg = palette.bg_sec, bg = palette.bg } },
			right_sep = { "", hl = { fg = palette.bg_sec, bg = palette.bg } },
		},
		win = {
			label = function(winid)
				return {
					buffer_is_saved() .. filename.unique(winid) .. " ",

					hl = { fg = palette.fg, bg = palette.bg_sec },
				}
			end,
			left_sep = { "", hl = { fg = palette.bg_sec, bg = palette.bg } },
			right_sep = { "", hl = { fg = palette.bg_sec, bg = palette.bg } },
		},
		tail = {
			{ "", hl = { fg = palette.accent_sec, bg = palette.bg } },
			{ "  ", hl = { fg = palette.bg, bg = palette.accent_sec } },
		},
	}
	require("tabby").setup({ tabline = line })
end

return {
	"nanozuki/tabby.nvim",
	config = tabby_config,
}