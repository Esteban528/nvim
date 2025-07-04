-- Use different string to show empty tabstop as inline virtual text
local my_i = function(snippet)
	return MiniSnippets.default_insert(snippet, { empty_tabstop = "", empty_tabstop_final = "" })
end

require("mini.snippets").setup({
	expand = { insert = my_i },
})
