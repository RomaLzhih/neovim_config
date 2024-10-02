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
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},
	view = {
		width = 50,
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
