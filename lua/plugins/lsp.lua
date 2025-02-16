-- Use a descriptive name for the document highlighting option
local enable_document_highlighting = false

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependents
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "nvim-java/nvim-java",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            -- Load luvit types when "vim.uv" is encountered
            { path = "luvit-meta/library", words = { "vim%.uv" } },
          },
        },
      },
      { "Bilal2453/luvit-meta", lazy = true },
    },

    config = function()
      ------------------------------------------------------------------------------
      -- Helper function to navigate diagnostics filtered by severity
      ------------------------------------------------------------------------------
      local function diagnostic_goto(next, severity)
        local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
        severity = severity and vim.diagnostic.severity[severity] or nil
        return function()
          go({ severity = severity })
        end
      end

      ------------------------------------------------------------------------------
      -- Setup autocmd for LspAttach and LSP-specific key mappings
      ------------------------------------------------------------------------------
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local buf = event.buf

          ----------------------------------------------------------------------------
          -- Helper function to define key mappings with default options
          ----------------------------------------------------------------------------
          local function map(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = buf, desc = "LSP: " .. desc })
          end

          ----------------------------------------------------------------------------
          -- Try to load Telescope and, if available, set some key mappings
          ----------------------------------------------------------------------------
          local telescope_ok, telescope = pcall(require, "telescope.builtin")
          if telescope_ok then
            map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")
            map("gr", telescope.lsp_references, "[G]oto [R]eferences")
            map("gI", telescope.lsp_implementations, "[G]oto [I]mplementation")
            map("<leader>dd", telescope.lsp_type_definitions, "Type [D]efinition")
            map("<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
            map("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
          else
            vim.notify("Telescope not found", vim.log.levels.WARN)
          end

          ----------------------------------------------------------------------------
          -- Other key mappings for LSP
          ----------------------------------------------------------------------------
          map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
          map("<leader>ca", ":Lspsaga code_action<CR>", "[C]ode [A]ction")
          map("gD", ":Lspsaga peek_definition<CR>", "[G]oto [D]eclaration")
          map("<leader>cs", vim.lsp.codelens.run, "Run Codelens")
          map("<leader>cc", vim.lsp.codelens.refresh, "Refresh & Display Codelens")
          map("<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")
          map("]d", ":Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic")
          map("[d", ":Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostic")
          map("]e", diagnostic_goto(true, "ERROR"), "Next Error")
          map("[e", diagnostic_goto(false, "ERROR"), "Prev Error")
          map("]w", diagnostic_goto(true, "WARN"), "Next Warning")
          map("[w", diagnostic_goto(false, "WARN"), "Prev Warning")

          ----------------------------------------------------------------------------
          -- Optional: Setup document highlighting if enabled
          ----------------------------------------------------------------------------
          if enable_document_highlighting then
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
              local highlight_group = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })

              vim.api.nvim_create_autocmd("CursorHold", {
                buffer = buf,
                group = highlight_group,
                callback = function()
                  vim.lsp.buf.document_highlight()
                end,
              })

              vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = buf,
                group = highlight_group,
                callback = function()
                  vim.lsp.buf.clear_references()
                end,
              })

              vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                callback = function(event2)
                  vim.lsp.buf.clear_references()
                  vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                end,
              })
            end
          end
        end,
      })

      ------------------------------------------------------------------------------
      -- Setup LSP capabilities
      ------------------------------------------------------------------------------
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      ------------------------------------------------------------------------------
      -- Define LSP servers and their specific configurations
      ------------------------------------------------------------------------------
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = "Replace" },
              settings = {
                Lua = { codeLens = { enable = true } },
              },
            },
          },
        },
      }

      ------------------------------------------------------------------------------
      -- Setup Mason and additional tools
      ------------------------------------------------------------------------------
      require("mason").setup()

      local ensure_installed = vim.tbl_keys(servers)
      vim.list_extend(ensure_installed, { "stylua" })
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      ------------------------------------------------------------------------------
      -- Setup Mason-Lspconfig and configure each LSP server
      ------------------------------------------------------------------------------
      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server_opts = servers[server_name] or {}
            server_opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server_opts.capabilities or {})
            require("lspconfig")[server_name].setup(server_opts)
          end,
          -- Special configuration for jdtls (Java)
          jdtls = function()
            require("java").setup({})
            require("lspconfig").jdtls.setup({})
          end,
        },
      })
    end,
  },

  ------------------------------------------------------------------------------
  -- Configure lspsaga.nvim to enhance the LSP experience
  ------------------------------------------------------------------------------
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        ui = {
          code_action = "",
          lines = { " ", " ", " ", " ", " " },
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- Optional
    },
  },
}
