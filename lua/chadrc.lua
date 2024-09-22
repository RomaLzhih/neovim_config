---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("highlights")

M.ui = {
	theme = "mySolarized",
	theme_toggle = { "mySolarized", "mySolarized" },
	hl_override = highlights.override,
	hl_add = highlights.add,
	statusline = {
		order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "mylint", "cwd", "cursor" },
		modules = {
			mylint = function()
				local linters = require("lint").get_running()
				if #linters == 0 then
					return " %#St_lspWarning#󰦕  "
				end
				return "%#St_lspWarning#󱉶  " .. table.concat(linters, ", ") .. " "
			end,
		},
	},
	mason = {
		cmd = true,
		pkgs = {
			"lua-language-server",
			"stylua",
			"beautysh",
			"clangd",
			"bash-language-server",
			"pyright",
			"pylint",
			"shfmt",
			"clang-format",
			"black",
			"shellcheck",
		},
	},
}

-- M.plugins = "plugins"

-- check core.mappings for table structure
-- M.mappings = require "mappings"

return M
