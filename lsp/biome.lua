---@brief
--- https://biomejs.dev
---
--- Biome LSP (no lspconfig dependency). Uses Neovim's native LSP API.

local function path_join(a, b)
  if a:sub(-1) == "/" then
    return a .. b
  end
  return a .. "/" .. b
end

local function file_exists(p)
  return p and vim.uv.fs_stat(p) ~= nil
end

-- Adds "package.json" as a possible "config marker" only if it declares Biome.
-- This mimics the intent of lspconfig.util.insert_package_json, but without lspconfig.
local function package_json_declares_biome(pkg_path)
  if not pkg_path or not file_exists(pkg_path) then
    return false
  end

  local ok, lines = pcall(vim.fn.readfile, pkg_path)
  if not ok or not lines then
    return false
  end

  local txt = table.concat(lines, "\n")

  -- Heuristic (fast, no JSON parsing): check common keys.
  -- Covers:
  --  - dependencies/devDependencies: "@biomejs/biome"
  --  - "biome" config key
  --  - legacy "biomejs" mentions (rare, but harmless)
  if txt:find([["@biomejs/biome"]], 1, true) then
    return true
  end
  if txt:find([["biome"]], 1, true) then
    -- This is broad, but we only use it if package.json is in the tree near the file.
    -- If you want stricter matching, tell me and I’ll tighten it.
    return true
  end

  return false
end

local function find_biome_config_or_package_json(filename, stop_dir)
  -- 1) biome.json / biome.jsonc
  local cfg = vim.fs.find({ "biome.json", "biome.jsonc" }, {
    path = filename,
    type = "file",
    limit = 1,
    upward = true,
    stop = stop_dir,
  })[1]

  if cfg then
    return cfg
  end

  -- 2) package.json that "declares" biome
  local pkg = vim.fs.find({ "package.json" }, {
    path = filename,
    type = "file",
    limit = 1,
    upward = true,
    stop = stop_dir,
  })[1]

  if pkg and package_json_declares_biome(pkg) then
    return pkg
  end

  return nil
end

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local cmd = "biome"
    local root_dir = (config or {}).root_dir
    if root_dir then
      local local_cmd = path_join(root_dir, "node_modules/.bin/biome")
      if vim.fn.executable(local_cmd) == 1 then
        cmd = local_cmd
      end
    end
    return vim.lsp.rpc.start({ cmd, "lsp-proxy" }, dispatchers)
  end,

  filetypes = {
    "astro",
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "svelte",
    "typescript",
    "typescriptreact",
    "vue",
  },

  workspace_required = true,

  root_dir = function(bufnr, on_dir)
    local root_markers = {
      "package-lock.json",
      "yarn.lock",
      "pnpm-lock.yaml",
      "bun.lockb",
      "bun.lock",
      "deno.lock",
      ".git",
    }

    local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    if filename == "" then
      return
    end

    -- Stop searching at the project root directory (same as original intent)
    local stop_dir = vim.fs.dirname(project_root)

    -- Only enable Biome if we can find a biome config file,
    -- or a package.json that indicates biome is used.
    local marker = find_biome_config_or_package_json(filename, stop_dir)
    if not marker then
      return
    end

    on_dir(project_root)
  end,
}
