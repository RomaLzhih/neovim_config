-- Credits to original https://github.com/craftzdog/solarized-osaka.nvim
-- This is a modified version of it

---@type Base46Table
local M = {}

M.base_30 = {
	white = "#9eabac",
	darker_black = "#011923",
	black = "#011219",
	black2 = "#02202D",
	one_bg = "#022736",
	one_bg2 = "#03394F",
	one_bg3 = "#044A67",
	grey = "#405055",
	grey_fg = "#47585E",
	grey_fg2 = "#4F6369",
	light_grey = "#586E75",
	red = "#db302d",
	baby_pink = "#575ea2",
	pink = "#849900",
	line = "#022736",
	green = "#849900",
	vibrant_green = "#bad600",
	nord_blue = "#1a6397",
	blue = "#268bd3",
	yellow = "#b28500",
	sun = "#e6ac00",
	purple = "#29a298",
	dark_purple = "#B02669",
	teal = "#519ABA",
	orange = "#C84C16",
	cyan = "#2aa198",
	statusline_bg = "#02202D",
	lightbg = "#03394F",
	pmenu_bg = "#29a298",
	folder_bg = "#268bd3",
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
	base00 = M.base_30.black,
	base01 = M.base_30.one_bg,
	base02 = M.base_30.one_bg2,
	base03 = M.base_30.one_bg3,
	base04 = "#1b4651",
	base05 = M.base_30.white,
	base06 = "#eee8d5",
	base07 = "#fdf6e3",
	base08 = "#268bd5",
	base09 = "#519ABA",
	base0A = "#b58900",
	base0B = "#29a298",
	base0C = "#c94c16",
	base0D = "#268bd5",
	base0E = "#849900",
	base0F = "#c94c16",
}

M.polish_hl = {
	treesitter = {
		["@type"] = { fg = M.base_16.base08 },
		["@type.buildin"] = { fg = M.base_16.base0A },
		["@namespace"] = { fg = M.base_16.base08 },
		["@parameter"] = { fg = M.base_16.base0C, bold = true },
		["@variable.parameter"] = { fg = M.base_16.base0C, bold = true },
		["@module"] = { fg = M.base_16.base0E },
		["@constant"] = { fg = M.base_30.dark_purple },
		["@punctuation.delimiter"] = { fg = M.base_16.base0E },
		["@punctuation.bracket"] = { fg = "#9eacad" },
		["@operator"] = { fg = M.base_16.base0E },
		["@variable"] = { fg = "#9eacad" },
		["@macro"] = { fg = M.base_16.base0F, italic = true },
		["@keyword.repeat"] = { fg = M.base_16.base0E },
		["@keyword.modifier"] = { fg = M.base_16.base0C, italic = true },
	},
}

M.type = "dark"

M = require("base46").override_theme(M, "myOsaka")

return M
