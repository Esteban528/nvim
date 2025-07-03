local map_vis = function(keys, call, desc)
	local rhs = "<Cmd>lua MiniVisits." .. call .. "<CR>"
	vim.keymap.set("n", "<Leader>" .. keys, rhs, { desc = desc })
end

-- map_vis("vv", "add_label()", "Add label")
-- map_vis("vV", "remove_label()", "Remove label")
-- map_vis("vl", 'select_label("", "")', "Select label (all)")
-- map_vis("vL", "select_label()", "Select label (cwd)")

map_vis("vv", 'add_label("core")', "Add to core")
map_vis("vV", 'remove_label("core")', "Remove from core")
map_vis("vc", 'select_path("", { filter = "core" })', "Select core (all)")
map_vis("vC", 'select_path(nil, { filter = "core" })', "Select core (cwd)")

-- Iterate based on recency
local sort_latest = MiniVisits.gen_sort.default({ recency_weight = 1 })
local map_iterate_core = function(lhs, direction, desc)
	local opts = { filter = "core", sort = sort_latest, wrap = true }
	local rhs = function()
		MiniVisits.iterate_paths(direction, vim.fn.getcwd(), opts)
	end
	vim.keymap.set("n", lhs, rhs, { desc = desc })
end

map_iterate_core("[{", "last", "Core label (earliest)")
map_iterate_core("[[", "forward", "Core label (earlier)")
map_iterate_core("]]", "backward", "Core label (later)")
map_iterate_core("]}", "first", "Core label (latest)")
