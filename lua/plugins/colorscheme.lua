return {
  "chriskempson/vim-tomorrow-theme",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function ()
    vim.cmd("colorscheme Tomorrow-Night")
  end
}
