---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("highlights")

M.ui = {
	theme = "myEverForest",
	theme_toggle = { "myRosePine", "myRosePine" },
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
}

-- M.plugins = "plugins"

-- check core.mappings for table structure
-- M.mappings = require "mappings"

return M
