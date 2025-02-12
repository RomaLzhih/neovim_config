local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		tex = { "tex-fmt" },
	},
}

require("conform").setup(options)
