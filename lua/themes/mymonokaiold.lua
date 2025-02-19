-- Credits to original theme https=//monokai.pro/
-- This is modified version of it

local M = {}

M.base_30 = {
	white = "#f8f8f2",
	darker_black = "#2e2e2e",
	black = "#3b3b3b", --  nvim bg
	black2 = "#444444",
	one_bg = "#4d4d4d", -- real bg of onedark
	one_bg2 = "#565656",
	one_bg3 = "#5f5f5f",
	grey = "#666666",
	grey_fg = "#707070",
	grey_fg2 = "#7a7a7a",
	light_grey = "#848484",
	red = "#e57373",
	baby_pink = "#f48fb1",
	pink = "#f06292",
	line = "#4d4d4d", -- for lines like vertsplit
	green = "#81c784",
	vibrant_green = "#aed581",
	nord_blue = "#4fc3f7",
	blue = "#64b5f6",
	yellow = "#fff176",
	sun = "#ffd54f",
	purple = "#ba68c8",
	dark_purple = "#ab47bc",
	teal = "#4db6ac",
	orange = "#ffb74d",
	cyan = "#4dd0e1",
	statusline_bg = "#444444",
	lightbg = "#565656",
	pmenu_bg = "#aed581",
	folder_bg = "#64b5f6",
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
	-- base00 = "#272822",
	base00 = "#282822",
	base01 = "#383830",
	base02 = "#49483e",
	base03 = "#75715e",
	base04 = "#a59f85",
	base05 = "#f8f8f2",
	base06 = "#f5f4f1",
	base07 = "#f9f8f5",
	base08 = "#f8f8f2",
	base09 = "#b39ddb",
	base0A = "#ffcc80",
	base0B = "#c5e1a5",
	base0C = "#80deea",
	base0D = "#aed581",
	base0E = "#f48fb1",
	base0F = "#ffab91",
}

M.polish_hl = {
	treesitter = {
		["@type"] = { fg = "#ffcc80" },
		["@type.builtin"] = { fg = "#80deea" },
		["@namespace"] = { fg = M.base_16.base0A },
		["@property"] = { fg = "#b3e5fc" },
		["@parameter"] = { fg = "#ffab91", bold = true },
		["@variable.parameter"] = { fg = "#ffab91", bold = true },
		["@module"] = { fg = M.base_16.base0C },
		["@constant"] = { fg = M.base_16.base09 },
		["@boolean"] = { fg = M.base_16.base09, italic = true },
		["@punctuation.delimiter"] = { fg = M.base_16.base0E },
		["@punctuation.bracket"] = { fg = "#f8f8f2" },
		["@operator"] = { fg = M.base_16.base05 },
		["@variable"] = { fg = M.base_16.base05 },
		["@constructor"] = { fg = M.base_16.base0D },
		["@variable.member"] = { fg = M.base_16.base05 },
		["@macro"] = { fg = M.base_16.base0F, italic = true },
		["@keyword.repeat"] = { fg = M.base_16.base0E },
		["@keyword.modifier"] = { fg = M.base_16.base0E, italic = true },
	},
}

M.type = "dark"

M = require("base46").override_theme(M, "mymonokaiold")

return M
