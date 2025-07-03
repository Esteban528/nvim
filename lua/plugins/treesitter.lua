return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "html",
        "bash",
        "java",
        "javascript",
        "typescript",
        "nix",
        "c"
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      modules = {},
    })
  end,
}
