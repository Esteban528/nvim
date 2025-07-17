local function map(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = "Mini.pick: " .. desc })
end

map("<leader>ff", ":Pick files<CR>", "Open file finder")
map("<leader>fg", ":Pick grep_live<CR>", "Open live grep")
map("<leader>gg", ":Pick git_hunks<CR>", "Open unstaged files")
map("<leader>ga", ":Pick git_hunks scope='staged'<CR>", "Open staged files")
map("<leader>fh", ":Pick help<CR>", "Open help")
map("<leader>,", ":Pick buffers<CR>", "Open buffers")

MiniPick.setup({
	preview = true,
	mappings = {
		toggle_info = "<C-h>",
		toggle_preview = "<C-p>",
		move_down = "<Tab>",
		move_up = "<S-Tab>",
    scroll_up = "<C-u>",
    scroll_down = "<C-d>",
    delete_left = "<Del>",
	},
	-- options = { content_from_bottom = true },
})

require('mini.extra').setup()

local stage_hunk_item = function(item)
  local patch = vim.deepcopy(item.header)
  vim.list_extend(patch, item.hunk)
  local cmd = { 'git', 'apply', '--cached', '-' }
  vim.system(cmd, { stdin = patch }):wait()
end
local stage_marked = function(items_marked) vim.tbl_map(stage_hunk_item, items_marked) end

-- NOTE: Make sure `require('mini.pick').setup()` is called prior to this
MiniPick.registry.git_hunks = function(local_opts)
  MiniExtra.pickers.git_hunks(local_opts, { source = { choose_marked = stage_marked } })
end

map("<leader>hh", ":Pick visit_labels<CR>", "Open Mini.Visitis labels")
