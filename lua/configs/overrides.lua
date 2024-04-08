local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"c",
		"cpp",
		"python",
		"r",
		"bash",
		"markdown",
		"markdown_inline",
		"norg",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}

M.mason = {
	ensure_installed = {
		"lua-language-server",
		"stylua",
		"beautysh",
		"clangd",
		"bash-language-server",
		"pyright",
		"shfmt",
		"ltex-ls",
		"clang-format",
		"black",
		-- "r-languageserver",
		"shellcheck",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},
	view = {
		width = 45,
	},

	renderer = {
		indent_width = 4,
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
