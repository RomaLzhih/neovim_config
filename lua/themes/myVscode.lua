-- Thanks to original theme for existing https://github.com/microsoft/vscode/blob/main/extensions/theme-defaults/themes/dark_plus.json
-- this is a modified version of it

local M = {}

M.base_30 = {
	white = "#dee1e6",
	darker_black = "#1a1a1a",
	black = "#1E1E1E", --  nvim bg
	black2 = "#252525",
	one_bg = "#282828",
	one_bg2 = "#313131",
	one_bg3 = "#3a3a3a",
	grey = "#444444",
	grey_fg = "#4e4e4e",
	grey_fg2 = "#585858",
	light_grey = "#626262",
	red = "#D16969",
	baby_pink = "#ea696f",
	pink = "#bb7cb6",
	line = "#2e2e2e", -- for lines like vertsplit
	green = "#B5CEA8",
	green1 = "#4EC994",
	vibrant_green = "#bfd8b2",
	blue = "#569CD6",
	nord_blue = "#60a6e0",
	yellow = "#D7BA7D",
	sun = "#e1c487",
	purple = "#c68aee",
	dark_purple = "#b77bdf",
	teal = "#4294D6",
	orange = "#d3967d",
	cyan = "#9CDCFE",
	statusline_bg = "#242424",
	lightbg = "#303030",
	pmenu_bg = "#60a6e0",
	folder_bg = "#7A8A92",
}

M.base_16 = {
	-- - base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
	-- - base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
	-- - base0A - Classes, Markup Bold, Search Text Background
	-- - base0B - Strings, Inherited Class, Markup Code, Diff Inserted
	-- - base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
	-- - base0D - Functions, Methods, Attribute IDs, Headings
	-- - base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
	-- - base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
	base00 = "#1E1E1E",
	base01 = "#262626",
	base02 = "#303030",
	base03 = "#3C3C3C",
	base04 = "#464646",
	base05 = "#D4D4D4",
	base06 = "#E9E9E9",
	base07 = "#FFFFFF",
	base08 = "#9CDCFE",
	base09 = "#B5CEA8",
	base0A = "#569cd6",
	base0B = "#E8C9BB",
	base0C = "#9CDCFE",
	base0D = "#DCDCAA",
	base0E = "#D8A0DF",
	base0F = "#E9E9E9",
}

M.polish_hl = {
	treesitter = {
		["@type"] = { fg = "#4EC9B0" },
		["@type.buildin"] = { fg = "#569CD6" },
		["@namespace"] = { fg = "#C8C8C8" },
		["@property"] = { fg = M.base_30.teal, italic = true },
		["@parameter"] = { fg = "#9A9A9A", bold = true },
		["@variable.parameter"] = { fg = "#9A9A9A", bold = true },
		["@module"] = { fg = M.base_16.base0C },
		["@constant"] = { fg = M.base_30.dark_purple },
		["@punctuation.delimiter"] = { fg = "#B4B4B4" },
		["@keyword.repeat"] = { fg = M.base_16.base0E },
		["@punctuation.bracket"] = { fg = "#B4B4B4" },
		["@operator"] = { fg = "#B4B4B4" },
		["@variable"] = { fg = M.base_16.base08 },
		["@macro"] = { fg = "#BEB7FF", italic = true },
		["@keyword.modifier"] = { fg = M.base_16.base0C, italic = true },
	},
}

M.type = "dark"

M = require("base46").override_theme(M, "myVscode")

return M
