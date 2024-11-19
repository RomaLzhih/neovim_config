-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "mytomorrow",

	hl_override = {
		CursorLine = {
			bg = "one_bg",
		},
		["@function"] = { italic = true },
		["@function.call"] = { italic = true },
		["@keyword"] = { italic = true },
		["@keyword.repeat"] = { italic = true },
		["@keyword.conditional"] = { italic = true },
		["@keyword.return"] = { italic = true },
		["@string"] = { italic = true },
		["@type.builtin"] = { italic = true },
		["@repeat"] = { italic = true },
		["@conditional"] = { italic = true },
		["@parameter"] = { bold = true },
		["@comment"] = { italic = true },
		["@variable.builtin"] = { italic = true },
		Repeat = { italic = true },
		Type = { italic = true },
		Conditional = { italic = true },
		-- Statement = { fg = "base0D", italic = true },
		Statement = { fg = "green", italic = true },
	},
}

M.ui = {
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

return M
