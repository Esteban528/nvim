-- Function to map keys in a clearer and more flexible way
local function map(mode, key, result, opts)
	-- Set default options
	opts = opts or { noremap = true, silent = false, expr = false }

	-- Check that mode and key are not empty
	if mode and key then
		vim.keymap.set(mode, key, result, opts)
	else
		print("Error: mode or key is missing.")
	end
end

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- Set leader key
vim.g.mapleader = " "

-- Save file
map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, expr = false })

map("n", "<leader>ww", function()
	vim.opt.wrap = not vim.opt.wrap:get()
end, { desc = "Toggle wrap" })

-- function NeoTreeToggle()
-- 	vim.cmd("Neotree toggle")
-- end

-- Toggle Tree
-- map("n", "<leader>n", NeoTreeToggle, { noremap = true, silent = false, expr = false })

-- Close all windows
map("n", "<leader>qq", ":qa!<CR>", { noremap = true, silent = true, expr = false })

-- Close current window
map("n", "<leader>wd", "<Cmd>:q<CR>", { noremap = true, silent = true, expr = false })

-- Add a semicolon at the end of the line
map("n", "<leader>;", "$a;<ESC>")

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- Clear highlight
map("n", "<Esc>", ":nohl<CR>", { noremap = false, silent = true, expr = false })
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Resize window
map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Tab and Buffers
map("n", "<leader>bd", ":bd<CR>", { noremap = true, silent = true, expr = false, desc = "close buffer" })
map("n", "<A-n>", "<cmd>tabnew<cr>", { desc = "Create new tabs" })
map("n", "<A-l>", "<cmd>tabnext<cr>", { desc = "Go to next tab" })
map("n", "<A-h>", "<cmd>tabprevious<cr>", { desc = "Go to previous tab" })
map("n", "<A-w>", "<cmd>tabclose<cr>", { desc = "Go to previous tab" })
local function tabSelector()
	local tab_count = vim.fn.tabpagenr("$")
	for i = 1, tab_count do
		map("n", "<A-" .. i .. ">", ":tabn " .. i .. "<CR>", { noremap = false, silent = true, expr = false })
	end
end

vim.api.nvim_create_autocmd("TabEnter", {
	callback = tabSelector,
})

-- Harpooon
map("n", "<leader>hm", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true, silent = false, expr = false })
map(
	"n",
	"<leader>hh",
	":lua require('harpoon.ui').toggle_quick_menu()<CR>",
	{ noremap = true, silent = false, expr = false }
)
map("n", "H", ":lua require('harpoon.ui').nav_file(1)<CR>", { noremap = true, silent = true, expr = false })
map("n", "J", ":lua require('harpoon.ui').nav_file(2)<CR>", { noremap = true, silent = true, expr = false })
map("n", "K", ":lua require('harpoon.ui').nav_file(3)<CR>", { noremap = true, silent = true, expr = false })
map("n", "L", ":lua require('harpoon.ui').nav_file(4)<CR>", { noremap = true, silent = true, expr = false })

map(
	"n",
	"<leader>th",
	":lua require('harpoon.term').gotoTerminal(1)<CR>",
	{ noremap = true, silent = true, expr = false }
)

map(
	"n",
	"<leader>tj",
	":lua require('harpoon.term').gotoTerminal(2)<CR>",
	{ noremap = true, silent = true, expr = false }
)

map(
	"n",
	"<leader>tk",
	":lua require('harpoon.term').gotoTerminal(3)<CR>",
	{ noremap = true, silent = true, expr = false }
)

map(
	"n",
	"<leader>tl",
	":lua require('harpoon.term').gotoTerminal(4)<CR>",
	{ noremap = true, silent = true, expr = false }
)

-- DAP
map("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true, expr = false })
map("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { noremap = true, silent = true, expr = false })
map("n", "<leader>ds", ":lua require'dap'.step_into()<CR>", { noremap = true, silent = true, expr = false })
map("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", { noremap = true, silent = true, expr = false })

--Window
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", silent = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", silent = true })

-- Indent
map("v", "<", "<gv")
map("v", ">", ">gv")
