-- Use different string to show empty tabstop as inline virtual text
local my_i = function(snippet)
	return MiniSnippets.default_insert(snippet, { empty_tabstop = "", empty_tabstop_final = "" })
end

require("mini.snippets").setup({
	expand = { insert = my_i },
})

local gen_loader = MiniSnippets.gen_loader
local completion = {
    original = vim.opt.completeopt,
    nomenu = "noselect",
}
local custom_expand_insert = function(snippet)
    vim.opt.completeopt = completion.nomenu
    return MiniSnippets.default_insert(snippet, {
        lookup = {
            GIT_USERNAME = vim.fn.system("git config user.name"):gsub("\n", ""),
        },
    })
end

---@diagnostic disable: undefined-global
MiniSnippets.setup {
    snippets = {
        gen_loader.from_file(vim.fn.stdpath("config") .. "/snippets/global.json"),
        gen_loader.from_lang(),
    },
    expand = { insert = custom_expand_insert },
}

vim.keymap.set(
    "i",
    "<C-e>",
    function() return MiniSnippets.session.get() and "<C-n>" or "<C-e>" end,
    { noremap = true, silent = true, expr = true }
)
vim.api.nvim_create_autocmd("User", {
    pattern = "MiniSnippetsSessionStart",
    callback = function()
        vim.diagnostic.config({
            underline = false,
        })
    end,
})
vim.api.nvim_create_autocmd("User", {
    pattern = "MiniSnippetsSessionJump",
    callback = function(buf)
        if buf.data.tabstop_to == "0" then MiniSnippets.session.stop() end
    end,
})

vim.api.nvim_create_autocmd("User", {
    pattern = "MiniSnippetsSessionStop",
    callback = function()
        vim.diagnostic.config({
            underline = true,
        })
        vim.opt.completeopt = completion.original
    end,
})
