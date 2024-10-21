return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    'nvim-treesitter/nvim-treesitter-textobjects',
  },


  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  init = function(plugin)
    -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
    -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
    -- no longer trigger the **nvim-treesitter** module to be loaded in time.
    -- Luckily, the only things that those plugins need are the custom queries, which we make available
    -- during startup.
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,

  event = 'VeryLazy',
  build = ':TSUpdate',
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  opts = {
    ensure_installed = { "lua", "vim", "vimdoc", "markdown", "html", "css", "php", "python", "java", "typescript" },
    highlight = {
      enable = true,
    },
    indent = { enable = true },
    auto_install = true, -- automatically install syntax support when entering new file type buffer
  },
  config = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      -- opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
    end
    require("nvim-treesitter.configs").setup(opts)
  end,
}
