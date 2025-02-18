-- Credits to original https://github.com/altercation/solarized
-- This is modified version of it

local M = {}

M.base_30 = {
	white = "#abb2bf",
	darker_black = "#002530",
	black = "#002b36", --  nvim bg
	black2 = "#06313c",
	one_bg = "#0a3540", -- real bg of onedark
	one_bg2 = "#133e49",
	one_bg3 = "#1b4651",
	grey = "#28535e",
	grey_fg = "#325d68",
	grey_fg2 = "#3c6772",
	light_grey = "#446f7a",
	red = "#dc322f",
	baby_pink = "#eb413e",
	pink = "#d33682",
	line = "#0f3a45", -- for lines like vertsplit
	green = "#859900",
	vibrant_green = "#b2c62d",
	nord_blue = "#197ec5",
	blue = "#268bd2",
	yellow = "#b58900",
	sun = "#c4980f",
	purple = "#6c71c4",
	dark_purple = "#5d62b5",
	teal = "#519ABA",
	orange = "#cb4b16",
	cyan = "#2aa198",
	statusline_bg = "#042f3a",
	lightbg = "#113c47",
	pmenu_bg = "#268bd2",
	folder_bg = "#268bd2",
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
	base00 = "#002b36",
	base01 = "#06313c",
	base02 = "#0a3540",
	base03 = "#133e49",
	base04 = "#1b4651",
	base05 = "#93a1a1",
	base06 = "#eee8d5",
	base07 = "#fdf6e3",
	base08 = "#dc322f",
	base09 = "#2aa198",
	base0A = "#b58900",
	base0B = "#2aa198",
	base0C = "#2aa198",
	base0D = "#268bd2",
	base0E = "#859900",
	-- base0E = "#b2c62d",
	base0F = "#d33682",
}

M.type = "dark"

M = require("base46").override_theme(M, "mysolarized")

M.polish_hl = {
	treesitter = {
		["@constructor"] = { fg = M.base_16.base0D },
		["@variable.member"] = { fg = M.base_30.white },
		["@variable"] = { fg = M.base_30.white },
		["@type"] = { fg = M.base_16.base0A },
		["@type.builtin"] = { fg = M.base_16.base0A },
		["@property"] = { fg = "#a9b665" },
		["@namespace"] = { fg = M.base_16.base0C },
		["@parameter"] = { fg = M.base_30.white, bold = true },
		["@variable.parameter"] = { fg = M.base_30.white, bold = true },
		["@module"] = { fg = M.base_16.base0C },
		["@constant"] = { fg = "#cb4b16" },
		["@boolean"] = { fg = "#cb4b16", italic = true },
		["@punctuation.delimiter"] = { fg = M.base_30.white },
		["@punctuation.bracket"] = { fg = M.base_30.white },
		["@operator"] = { fg = M.base_30.white },
		["@macro"] = { fg = M.base_16.base0F, italic = true },
		["@keyword.repeat"] = { fg = M.base_16.base0E },
		["@keyword.modifier"] = { fg = M.base_16.base0E, italic = true },
	},
}
return M
