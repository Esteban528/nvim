local home = os.getenv("HOME")
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name
local lombok_path = home .. "/.local/share/nvim/mason/packages/lombok-nightly/lombok.jar"
local config_path = home .. "/.local/share/nvim/mason/packages/jdtls/config_linux"
local equinox_path =
	vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")

local _, jdtls = pcall(require, "jdtls")
local extendedClientCapabilities = jdtls.extendedClientCapabilities
local javaDebug = home .. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.*.jar"

local config = {
	cmd = {

		-- 💀
		"java",

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. lombok_path,

		"-jar",
		equinox_path,

		"-configuration",
		config_path,
		"-data",
		workspace_dir,
	},

	root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "settings.gradle" }),

	settings = {
		java = {},
	},

	init_options = {
		bundles = {
			vim.fn.glob(javaDebug, 1),
		},
	},
}
require("jdtls").start_or_attach(config)
