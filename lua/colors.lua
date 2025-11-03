local hl = vim.api.nvim_set_hl
require("mini.hipatterns").setup()

MiniHipatterns.setup({
	highlighters = {
		-- Highlight standalone 'FIX', 'HACK', 'TODO', 'NOTE'
		fix = { pattern = "%f[%w]()FIX()%f[%W]", group = "MiniHipatternsFixme" },
		hack = {
			pattern = "%f[%w]()HACK()%f[%W]",
			group = "MiniHipatternsHack",
		},
		todo = {
			pattern = "%f[%w]()TODO()%f[%W]",
			group = "MiniHipatternsTodo",
		},
		note = {
			pattern = "%f[%w]()NOTE()%f[%W]",
			group = "MiniHipatternsNote",
		},
		censor = {
			pattern = "%w%s*=%s*()%S+()",
			group = "",
			extmark_opts = function(_, match, _)
				local mask = string.rep("⣿", vim.fn.strchars(match))
				local extmark_opts = { virt_text = { { mask, "Comment" } }, virt_text_pos = "overlay" }
				if vim.fn.expand("%:t") == ".env" then
					extmark_opts.priority = 200
					extmark_opts.right_gravity = false
					return extmark_opts
				end
			end,
		},
		-- Highlight hex color strings (`#ffffff`) using that color
		hex_color = MiniHipatterns.gen_highlighter.hex_color({
			style = "inline",
			inline_text = "󱓻 ",
		}),
		shorthand = {
			pattern = "()#%x%x%x()%f[^%x%w]",
			group = function(_, _, data)
				---@type string
				local match = data.full_match
				local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
				local hex_color = "#" .. r .. r .. g .. g .. b .. b
				return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
			end,
		},
	},
})
local palette = require("palette").palette
local color = function()
	hl(0, "FloatBorder", { link = "Normal" })
	hl(0, "MiniPickHeader", { link = "FloatTitle" })
	hl(0, "MiniPickBorderText", { link = "FloatTitle" })
	hl(0, "LspInfoBorder", { link = "Normal" })
	hl(0, "NormalFloat", { link = "Normal" })
	hl(0, "BLACK", { bg = "#000000" })
	hl(0, "BlinkCmpLabelDeprecated", { fg = "#2f3639", strikethrough = true })
	hl(0, "BlinkCmpKindVariable", { fg = palette.base0B })
	hl(0, "BlinkCmpKindClass", { fg = palette.base09 })
	hl(0, "BlinkCmpKindInterface", { fg = palette.base08 })
	hl(0, "BlinkCmpKindConstructor", { fg = palette.base0A })
	hl(0, "BlinkCmpKindModule", { fg = palette.base0E })
	hl(0, "BlinkCmpKindKeyword", { fg = palette.base0F })
	hl(0, "BlinkCmpKindSnippet", { fg = palette.base09 })
	hl(0, "BlinkCmpKindConstant", { fg = palette.base08 })
	hl(0, "BlinkCmpKindMethod", { fg = palette.base0D })
	hl(0, "BlinkCmpKindFunction", { fg = palette.base0D })
	hl(0, "Type", { fg = palette.base09 })
	hl(0, "@keyword", { fg = palette.base0F })
	hl(0, "@keyword.modifier", { link = "@keyword" })
	hl(0, "@lsp.type.keyword", { link = "@keyword" })
	-- hl(0, "@lsp.type.modifier", { link = "@keyword" })
	hl(0, "@type.qualifier", { link = "@keyword" })
  hl(0, "MiniSnippetsCurrent", { fg = palette.base00 })

	vim.cmd([[
        hi! RedBG cterm=bold ctermfg=234 ctermbg=167 gui=bold guifg=#1d2021 guibg=#db4740 " #f2594b
        hi! YellowBG cterm=bold ctermfg=234 ctermbg=214 gui=bold guifg=#1d2021 guibg=#e9b143 
        hi! YellowBold cterm=bold ctermfg=234 ctermbg=214 gui=bold guifg=#e9b143 
        hi! GreenBG cterm=bold ctermfg=234 ctermbg=142 gui=bold guifg=#1d2021  guibg=#b0b846 
        hi! BlueBG cterm=bold ctermfg=234 ctermbg=109 gui=bold guifg=#1d2021 guibg=#80aa9e
        hi! GreyBG cterm=bold ctermfg=234 ctermbg=246 gui=bold guifg=#1d2021  guibg=#a89984
        hi! PurpleBG cterm=bold ctermfg=234 ctermbg=175 gui=bold guifg=#1d2021   guibg=#d3869b
        hi! OtherBG cterm=bold ctermfg=234 ctermbg=175 gui=bold guifg=#1d2021   guibg=#d3869b
        hi! Winbar guibg=none
        hi! @keyword.function guifg=#90B1C9
        hi! MiniPickPromptCaret ctermfg=167  guifg=#f2594b guibg=NONE
        hi! MiniPickPromptPrefix ctermfg=167  guifg=#f2594b guibg=NONE
        hi! MiniCursorwordCurrent gui=nocombine guifg=NONE guibg=NONE
        hi! link MiniStarterFooter Yellow
        hi! link MiniClueTitle FloatTitle
        hi! link MiniSnippetsCurrent visual
        hi! link MiniPickPrompt FloatTitle
        hi! link BlinkCmpMenuSelection visual
        hi! link TabLineSel visual
        hi! link TabLine StatusLineNC
        hi! link @punctuation.bracket comment
        hi! link @lsp.type.function @function
        hi! link @lsp.type.macro @function
        hi! link @lsp.type.keyword @keyword
        hi! link @string.json String
        hi! link @string.jsonc String
        hi! link @variable.nix yellow
        hi! link MiniIndentscopeSymbol Blue
        hi! link MiniCursorword Visual
        hi! link FloatTitle Comment
        hi! link FloatFooter Comment
        hi! link MiniFilesTitleFocused FloatBorder
        hi! link DiagnosticVirtualTextError DiagnosticError
        hi! link DiagnosticVirtualTextWarn DiagnosticWarn
        hi! link DiagnosticVirtualTextHint DiagnosticHint
        hi! link DiagnosticVirtualTextInfo DiagnosticInfo
        au Colorscheme * hi! link MiniIndentscopeSymbol Blue
        ]])
	for _, i in ipairs({ "Red", "Yellow", "Green", "Purple", "Grey", "Blue", "Other" }) do
		local x = vim.api.nvim_get_hl(0, { name = i .. "BG" })
		vim.api.nvim_set_hl(0, i, { fg = x.bg, ctermfg = 234 })
		-- vim.api.nvim_echo({ { i, i } }, 1, { err = true, verbose = false })
	end
end
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		color()
	end,
})
color()
