-- Credits to original https://github.com/haishanh/night-owl.vim
-- This is modified version of it

local M = {}

M.base_30 = {
	white = "#d6deeb",
	darker_black = "#010f20",
	black = "#011627",
	black2 = "#091e2f",
	one_bg = "#112637", -- real bg of onedark
	one_bg2 = "#1b3041",
	one_bg3 = "#253a4b",
	grey = "#2c4152",
	grey_fg = "#34495a",
	grey_fg2 = "#3c5162",
	light_grey = "#495e6f",
	red = "#f78c6c",
	baby_pink = "#ff6cca",
	pink = "#fa58b6",
	line = "#182d3e",
	green = "#29E68E",
	vibrant_green = "#22da6e",
	blue = "#82aaff",
	nord_blue = "#78a0f5",
	yellow = "#ffcb8b",
	sun = "#ffe9a9",
	purple = "#c792ea",
	dark_purple = "#a974cc",
	teal = "#96CEB4",
	orange = "#FFAD60",
	cyan = "#aad2ff",
	statusline_bg = "#051a2b",
	lightbg = "#1a2f40",
	pmenu_bg = "#82aaff",
	folder_bg = "#82aaff",
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
	base00 = "#011627",
	base01 = "#0c2132",
	base02 = "#172c3d",
	base03 = "#223748",
	base04 = "#2c4152",
	base05 = "#ced6e3",
	base06 = "#d6deeb",
	base07 = "#feffff",
	base08 = "#C5E478",
	base09 = "#f78c6c",
	base0A = "#c792ea",
	base0B = "#ECC48D",
	base0C = "#aad2ff",
	base0D = "#82aaff",
	base0E = "#c792ea",
	base0F = "#f78c6c",
}

M.polish_hl = {
	treesitter = {
		["@type"] = { fg = M.base_30.cyan },
		["@type.buildin"] = { fg = M.base_16.base0A },
		["@namespace"] = { fg = M.base_16.base0A },
		["@parameter"] = { fg = "#D7DBE0", bold = true },
		["@variable.parameter"] = { fg = "#D7DBE0", bold = true },
		["@keyword.repeat"] = { fg = M.base_16.base0E },
		["@module"] = { fg = M.base_16.base0C },
		["@constant"] = { fg = M.base_30.dark_purple },
		["@punctuation.delimiter"] = { fg = M.base_16.base0E },
		["@punctuation.bracket"] = { fg = "#D6DEE8" },
		["@operator"] = { fg = M.base_16.base0A },
		["@variable"] = { fg = M.base_16.base08 },
		["@macro"] = { fg = "#7FDBCA", italic = true },
	},
}

M.type = "dark"

M = require("base46").override_theme(M, "nightowl")

return M
