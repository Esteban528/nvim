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

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- Set leader key
vim.g.mapleader = " "

-- Key mappings
-- Save file
map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, expr = false })

-- Format code with LSP
-- map(
-- 	"n",
-- 	"<leader>ft",
-- 	":lua require('conform').format({ bufnr = args.buf })",
-- 	{ noremap = true, silent = true, expr = false }
-- )

function NeoTreeToggle()
	vim.cmd("Neotree toggle")
end

-- Toggle Tree
map("n", "<leader>n", NeoTreeToggle, { noremap = true, silent = false, expr = false })

-- Close all windows
map("n", "<leader>qq", ":Neotree toggle<CR>:qa!<CR>", { noremap = true, silent = true, expr = false })

-- Close current window
map("n", "<leader>wd", ":q<CR>", { noremap = true, silent = true, expr = false })

-- Add a semicolon at the end of the line
map("n", "<leader>;", "$a;<ESC>")

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- Clear highlight
map("n", "<Esc>", ":nohl<CR>", { noremap = false, silent = true, expr = false })

-- Resize window
map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Barbar
local opts = nil
map("n", "H", "<Cmd>BufferPrevious<CR>", opts)
map("n", "L", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
map("n", "<Leader>bd", "<Cmd>BufferClose<CR>", opts)

map("n", "<A-W>", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
-- map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- DAP
map("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true, expr = false })
map("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { noremap = true, silent = true, expr = false })
map("n", "<leader>ds", ":lua require'dap'.step_into()<CR>", { noremap = true, silent = true, expr = false })
map("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", { noremap = true, silent = true, expr = false })

-- Terminal

map("n", "<leader>ft", ":ToggleTerm<CR>", { noremap = true, silent = true, expr = false })

--Window
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", silent = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", silent = true })
