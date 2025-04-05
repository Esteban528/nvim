return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc' },
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      settings = {
        Lua = {
          codeLens = {
            enable = true, -- Configurar CodeLens en el servidor LSP
          },
        },
      },
    },
  }
}
