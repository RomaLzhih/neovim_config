-- Credits to original https://github.com/sainnhe/everforest
-- This is modified version of it

local M = {}

M.base_30 = {
	white = "#D3C6AA",
	darker_black = "#272f35",
	black = "#2b3339", --  nvim bg
	black2 = "#323a40",
	one_bg = "#363e44",
	one_bg2 = "#363e44",
	one_bg3 = "#3a4248",
	grey = "#4e565c",
	grey_fg = "#545c62",
	grey_fg2 = "#626a70",
	light_grey = "#656d73",
	red = "#e67e80",
	baby_pink = "#ce8196",
	pink = "#ff75a0",
	line = "#3a4248", -- for lines like vertsplit
	green = "#83c092",
	vibrant_green = "#a7c080",
	nord_blue = "#78b4ac",
	blue = "#7393b3",
	yellow = "#dbbc7f",
	sun = "#d1b171",
	purple = "#ecafcc",
	dark_purple = "#d699b6",
	teal = "#69a59d",
	orange = "#e69875",
	cyan = "#95d1c9",
	statusline_bg = "#2e363c",
	lightbg = "#3d454b",
	pmenu_bg = "#83c092",
	folder_bg = "#7393b3",
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
	base00 = "#2b3339",
	base01 = "#323c41",
	base02 = "#3a4248",
	base03 = "#424a50",
	base04 = "#4a5258",
	base05 = "#d3c6aa",
	base06 = "#ddd0b4",
	base07 = "#e7dabe",
	base08 = "#7fbbb3",
	base09 = "#d699b6",
	base0A = "#83c092",
	base0B = "#dbbc7f",
	base0C = "#e69875",
	base0D = "#a7c080",
	base0E = "#e67e80",
	base0F = "#d699b6",
}

M.type = "dark"

M.polish_hl = {
	treesitter = {
		["@type"] = { fg = M.base_16.base08 },
		["@constructor"] = { fg = M.base_16.base0D },
		["@variable.member"] = { fg = M.base_30.white },
		["@type.buildin"] = { fg = M.base_16.base08 },
		["@property"] = { fg = M.base_30.teal },
		["@namespace"] = { fg = M.base_16.base0A },
		["@parameter"] = { fg = M.base_30.white, bold = true },
		["@variable.parameter"] = { fg = M.base_30.white, bold = true },
		["@module"] = { fg = M.base_16.base0C },
		["@constant"] = { fg = M.base_30.dark_purple },
		["@punctuation.delimiter"] = { fg = M.base_30.white },
		["@punctuation.bracket"] = { fg = M.base_30.white },
		["@operator"] = { fg = M.base_16.base0C },
		["@variable"] = { fg = M.base_30.white },
		["@macro"] = { fg = M.base_16.base0F, italic = true },
		["@keyword.repeat"] = { fg = M.base_16.base0E },
		["@keyword.modifier"] = { fg = M.base_16.base0E, italic = true },
	},
}

M = require("base46").override_theme(M, "myEverForest")

return M
