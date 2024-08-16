-- Credits to original https://github.com/EdenEast/nightfox.nvim
-- This is modified version of it

local M = {}

M.base_30 = {
	white = "#cdcecf",
	darker_black = "#121c29",
	black = "#192330",
	black2 = "#202a37",
	one_bg = "#252f3c", -- real bg of onedark
	one_bg2 = "#313b48",
	one_bg3 = "#3d4754",
	grey = "#495360",
	grey_fg = "#535d6a",
	grey_fg2 = "#5c6673",
	light_grey = "#646e7b",
	red = "#c94f6d",
	baby_pink = "#e26886",
	pink = "#d85e7c",
	line = "#2a3441",
	green = "#8ebaa4",
	vibrant_green = "#6ad4d6",
	blue = "#719cd6",
	nord_blue = "#86abdc",
	yellow = "#dbc074",
	sun = "#e0c989",
	purple = "#baa1e2",
	dark_purple = "#9d79d6",
	teal = "#5cc6c8",
	orange = "#fe9373",
	cyan = "#8be5e7",
	statusline_bg = "#202a37",
	lightbg = "#313b48",
	pmenu_bg = "#719cd6",
	folder_bg = "#719cd6",
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
	base00 = "#192330",
	base01 = "#252f3c",
	base02 = "#313b48",
	base03 = "#3d4754",
	base04 = "#495360",
	base05 = "#c0c8d5",
	base06 = "#c7cfdc",
	base07 = "#ced6e3",
	base08 = "#d6d6d7",
	base09 = "#fe9373",
	base0A = "#dbc074",
	base0B = "#8ebaa4",
	base0C = "#7ad4d6",
	base0D = "#86abdc",
	base0E = "#9d79d6",
	base0F = "#e26886",
}

M.polish_hl = {
	treesitter = {
		["@type"] = { fg = M.base_16.base0C },
		["@type.buildin"] = { fg = M.base_16.base0F },
		["@property"] = { fg = M.base_30.folder_bg, italic = true },
		["@namespace"] = { fg = M.base_16.base0C },
		["@parameter"] = { fg = M.base_16.base0A, bold = true },
		["@variable.parameter"] = { fg = M.base_30.white, bold = true },
		["@module"] = { fg = M.base_16.base0C },
		["@constant"] = { fg = M.base_30.dark_purple },
		["@punctuation.delimiter"] = { fg = M.base_30.white },
		["@punctuation.bracket"] = { fg = M.base_30.white },
		["@operator"] = { fg = M.base_16.base0E },
		["@variable"] = { fg = M.base_30.white },
		["@macro"] = { fg = M.base_16.base0F, italic = true },
		["@keyword.repeat"] = { fg = M.base_16.base0E },
		["@keyword.modifier"] = { fg = M.base_16.base0C, italic = true },
	},
}

M.type = "dark"

M = require("base46").override_theme(M, "myNightFox")

return M
