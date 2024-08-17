-- Credits to original https://github.com/rebelot/kanagawa.nvim
-- This is modified version of it

local M = {}

M.base_30 = {
	white = "#DCD7BA",
	darker_black = "#191922",
	black = "#1F1F28", --  nvim bg
	black2 = "#25252e",
	one_bg = "#272730",
	one_bg2 = "#2f2f38",
	one_bg3 = "#363646",
	grey = "#43434c",
	grey_fg = "#4c4c55",
	grey_fg2 = "#53535c",
	light_grey = "#5c5c65",
	red = "#d8616b",
	baby_pink = "#D27E99",
	pink = "#c8748f",
	line = "#31313a", -- for lines like vertsplit
	green = "#98BB6C",
	vibrant_green = "#a3c677",
	nord_blue = "#7E9CD8",
	blue = "#7FB4CA",
	yellow = "#FF9E3B",
	sun = "#FFA066",
	purple = "#a48ec7",
	dark_purple = "#9c86bf",
	teal = "#7AA89F",
	orange = "#fa9b61",
	cyan = "#A3D4D5",
	statusline_bg = "#24242d",
	lightbg = "#33333c",
	pmenu_bg = "#a48ec7",
	folder_bg = "#7E9CD8",
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
	base00 = "#1F1F28",
	base01 = "#2A2A37",
	base02 = "#223249",
	base03 = "#727169",
	base04 = "#C8C093",
	base05 = "#DCD7BA",
	base06 = "#938AA9",
	base07 = "#363646",
	base08 = "#dcd7ba",
	base09 = "#FFA066",
	base0A = "#DCA561",
	base0B = "#98BB6C",
	base0C = "#7FB4CA",
	base0D = "#7E9CD8",
	base0E = "#e82424",
	-- base0E = "#957FB8",
	base0F = "#D27E99",
}

M.polish_hl = {
	treesitter = {
		["@namespace"] = { fg = M.base_16.base0C },
		["@parameter"] = { fg = M.base_16.base05, bold = true },
		["@variable.parameter"] = { fg = M.base_16.base05, bold = true },
		["@number"] = { fg = M.base_16.base0F },
		["@property"] = { fg = "#e6c384" },
		["@type"] = { fg = "#7aa89f" },
		["@constant"] = { fg = M.base_16.base09 },
		["@operator"] = { fg = "#c0a36e" },
		["@keyword.repeat"] = { fg = M.base_16.base0E },
		["@macro"] = { fg = M.base_16.base0F, italic = true },
		["@punctuation.bracket"] = { fg = "#9cabca" },
		["@punctuation.delimiter"] = { fg = M.base_30.white },
		["@keyword.modifier"] = { fg = M.base_16.base0E, italic = true },
	},
}

M.type = "dark"

M = require("base46").override_theme(M, "myKanagawa")

return M
