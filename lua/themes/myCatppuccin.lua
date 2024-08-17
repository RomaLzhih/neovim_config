local M = {}

M.base_30 = {
	white = "#D9E0EE",
	darker_black = "#191828",
	black = "#1E1D2D", --  nvim bg
	black2 = "#252434",
	one_bg = "#2d2c3c", -- real bg of onedark
	one_bg2 = "#363545",
	one_bg3 = "#3e3d4d",
	grey = "#474656",
	grey_fg = "#4e4d5d",
	grey_fg2 = "#555464",
	light_grey = "#605f6f",
	red = "#F38BA8",
	baby_pink = "#ffa5c3",
	pink = "#F5C2E7",
	line = "#383747", -- for lines like vertsplit
	green = "#ABE9B3",
	vibrant_green = "#b6f4be",
	nord_blue = "#8bc2f0",
	blue = "#89B4FA",
	yellow = "#FAE3B0",
	sun = "#ffe9b6",
	purple = "#d0a9e5",
	dark_purple = "#c7a0dc",
	teal = "#B5E8E0",
	orange = "#F8BD96",
	cyan = "#89DCEB",
	statusline_bg = "#232232",
	lightbg = "#2f2e3e",
	pmenu_bg = "#ABE9B3",
	folder_bg = "#89B4FA",
	lavender = "#c7d1ff",
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
	base00 = "#1E1D2D",
	base01 = "#282737",
	base02 = "#2f2e3e",
	base03 = "#383747",
	base04 = "#414050",
	base05 = "#bfc6d4",
	base06 = "#ccd3e1",
	base07 = "#D9E0EE",
	base08 = "#CAD3F5",
	base09 = "#F8BD96",
	base0A = "#FAE3B0",
	base0B = "#ABE9B3",
	base0C = "#89DCEB",
	base0D = "#89B4FA",
	base0E = "#CBA6F7",
	base0F = "#EE99A0",
}

M.polish_hl = {
	treesitter = {
		["@type"] = { fg = M.base_16.base0A },
		["@type.buildin"] = { fg = M.base_16.base0E },
		["@namespace"] = { fg = M.base_16.base0B },
		["@parameter"] = { fg = M.base_16.base0F, bold = true },
		["@variable.parameter"] = { fg = M.base_30.white, bold = true },
		["@module"] = { fg = M.base_16.base0C },
		["@constant"] = { fg = M.base_30.dark_purple },
		["@punctuation.delimiter"] = { fg = M.base_30.green },
		["@punctuation.bracket"] = { fg = "#939AB7" },
		["@operator"] = { fg = M.base_30.white },
		["@variable"] = { fg = M.base_16.base08 },
		["@macro"] = { fg = M.base_16.base0F, italic = true },
		["@keyword.repeat"] = { fg = M.base_16.base0E },
		["@keyword.modifier"] = { fg = M.base_16.base0E, italic = true },
		["@property"] = { fg = M.base_30.teal, italic = true },
	},
}

M.type = "dark"

M = require("base46").override_theme(M, "mycatppuccin")

return M
