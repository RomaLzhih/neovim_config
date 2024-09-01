local configs = require("nvchad.configs.lspconfig")
local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local servers = { "bashls", "pyright", "clangd", "r_language_server", "texlab", "ltex" }

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

lspconfig.clangd.setup({
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
})

-- lspconfig.ccls.setup({
-- 	init_options = {
-- 		compilationDatabaseDirectory = "build",
-- 		cache = {
-- 			directory = ".ccls-cache",
-- 		},
-- 	},
-- })

lspconfig.r_language_server.setup({
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			-- Disable virtual_text
			virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
			signs = { severity = { min = vim.diagnostic.severity.ERROR } },
			underline = { severity = { min = vim.diagnostic.severity.ERROR } },
		}),
	},
})

lspconfig.texlab.setup({
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			-- Disable virtual_text
			virtual_text = false,
		}),
	},
})

lspconfig.ltex.setup({
	filetypes = { "tex", "bib" },
	autostart = false,
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			-- Disable virtual_text
			virtual_text = false,
			underline = { severity = { min = vim.diagnostic.severity.INFO } },
		}),
	},
	settings = {
		ltex = {
			checkFrequency = "save",
			statusBarItem = "trye",
		},
	},
})
--
-- lspconfig.pyright.setup { blabla}
