local home = os.getenv("HOME")
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name
local cmd = {
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
	"-javaagent:" .. home .. "/.local/share/nvim/mason/packages/lombok-nightly/lombok.jar",
	"-jar",
	vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
	"-configuration",
	home .. "/.local/share/nvim/mason/packages/jdtls/config_mac",
	"-data",
	workspace_dir,
}

return {
	cmd = cmd,
	filetypes = { "java" },
	root_markers = {
		"pom.xml",
		"build.gradle",
		"settings.gradle",
		"settings.gradle.kts",
		"pom.xml",
		"build.gradle",
		"mvnw",
		"gradlew",
		"build.gradle",
		"build.gradle.kts",
		".git",
	},
	settings = {
		java = {
			signatureHelp = { enabled = true },
			maven = {
				downloadSources = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "none",
				},
			},
			format = {
				enabled = false,
			},
		},
	},
	on_attach = function(client, bufnr)
	end,
}
