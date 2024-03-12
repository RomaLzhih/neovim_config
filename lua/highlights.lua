-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
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
	-- ["@storageclass"] = { italic = true },
	-- ["@type"] = { italic = true },
	-- ["@type.qualifier"] = { italic = true },
	["@type.builtin"] = { italic = true },
	-- ["@type.identifier"] = { italic = true },
	["@repeat"] = { italic = true },
	["@conditional"] = { italic = true },
	-- ["@parameter"] = { italic = true },
	-- ["@property"] = { italic = true },
	["@comment"] = { italic = true },
	["@variable.builtin"] = { italic = true },
	["@variable.parameter"] = { italic = true },
	Repeat = { italic = true },
	Type = { italic = true },
	-- Comment = { italic = true },
	Conditional = { italic = true },
}

---@type HLTable
M.add = {
	NvimTreeOpenedFolderName = { fg = "green", bold = true },
	String = { italic = true },
}

return M
