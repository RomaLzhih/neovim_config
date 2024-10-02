-- Credits to original https://github.com/tiagovla/tokyonight.nvim
-- This is modified version of it

local M = {}

M.base_30 = {
	white = "#c0caf5",
	darker_black = "#16161e",
	black = "#1a1b26", --  nvim bg
	black2 = "#1f2336",
	one_bg = "#24283b",
	one_bg2 = "#414868",
	one_bg3 = "#353b45",
	grey = "#40486a",
	grey_fg = "#565f89",
	grey_fg2 = "#4f5779",
	light_grey = "#545c7e",
	red = "#f7768e",
	baby_pink = "#DE8C92",
	pink = "#ff75a0",
	line = "#32333e", -- for lines like vertsplit
	green = "#9ece6a",
	vibrant_green = "#73daca",
	nord_blue = "#80a8fd",
	blue = "#7aa2f7",
	yellow = "#e0af68",
	sun = "#EBCB8B",
	purple = "#bb9af7",
	dark_purple = "#9d7cd8",
	teal = "#1abc9c",
	orange = "#ff9e64",
	cyan = "#7dcfff",
	statusline_bg = "#1d1e29",
	lightbg = "#32333e",
	pmenu_bg = "#7aa2f7",
	folder_bg = "#7aa2f7",
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
	base00 = "#1a1b26",
	base01 = "#16161e",
	base02 = "#2f3549",
	base03 = "#444b6a",
	base04 = "#787c99",
	base05 = "#a9b1d6",
	base06 = "#cbccd1",
	base07 = "#d5d6db",
	base08 = "#73daca",
	base09 = "#ff9e64",
	base0A = "#0db9d7",
	base0B = "#9ece6a",
	base0C = "#b4f9f8",
	base0D = "#7aa2f7",
	base0E = "#bb9af7",
	base0F = "#9abdf5",
}

M.polish_hl = {
	treesitter = {
		["@constructor"] = { fg = M.base_16.base0D },
		["@variable.member"] = { fg = M.base_16.base08 },
		["@parameter"] = { fg = "#d9d4cd", bold = true },
		["@variable.parameter"] = { fg = "#d9d4cd", bold = true },
		["@namespace"] = { fg = "#0db9d7" },
		["@property"] = { fg = M.base_16.base07 },
		["@type"] = { fg = "#c0caf5" },
		["@macro"] = { fg = M.base_16.base0F, italic = true },
		["@type.builtin"] = { fg = "#bb9af7" },
		["@keyword.repeat"] = { fg = "#bb9af7" },
		["@keyword.modifier"] = { fg = M.base_16.base0E, italic = true },
	},
}

M.type = "dark"

M = require("base46").override_theme(M, "mytokyonight")

return M
