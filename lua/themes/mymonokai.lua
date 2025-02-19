-- Credits to original theme https=//monokai.pro/
-- This is modified version of it

local M = {}

M.base_30 = {
	white = "#f5f4f1",
	darker_black = "#22231D",
	black = "#272822", --  nvim bg
	black2 = "#2F302A",
	one_bg = "#363731", -- real bg of onedark
	one_bg2 = "#3E3F39",
	one_bg3 = "#464741",
	grey = "#4D4E48",
	grey_fg = "#555650",
	grey_fg2 = "#5D5E58",
	light_grey = "#64655F",
	red = "#e36d76",
	baby_pink = "#f98385",
	pink = "#f36d76",
	line = "#363942", -- for lines like vertsplit
	green = "#96c367",
	vibrant_green = "#99c366",
	nord_blue = "#81A1C1",
	blue = "#51afef",
	yellow = "#e6c181",
	sun = "#fce668",
	purple = "#c885d7",
	dark_purple = "#b26fc1",
	teal = "#34bfd0",
	orange = "#d39467",
	cyan = "#41afef",
	statusline_bg = "#2F302A",
	lightbg = "#3E3F39",
	pmenu_bg = "#99c366",
	folder_bg = "#61afef",
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
	base00 = "#272822",
	base01 = "#383830",
	base02 = "#49483e",
	base03 = "#75715e",
	base04 = "#a59f85",
	base05 = "#f8f8f2",
	base06 = "#f5f4f1",
	base07 = "#f9f8f5",
	base08 = "#F8F8F2",
	base09 = "#ae81ff",
	base0A = "#f4bf75",
	base0B = "#E6DB74",
	base0C = "#a1efe4",
	base0D = "#A6E22E",
	base0E = "#f92672",
	base0F = "#cc6633",
}

M.polish_hl = {
	treesitter = {
		["@type"] = { fg = "#FFF769" },
		["@type.builtin"] = { fg = "#66D9EF" },
		["@namespace"] = { fg = M.base_16.base0A },
		["@property"] = { fg = "#abcbde" },
		["@parameter"] = { fg = "#FFA133", bold = true },
		["@variable.parameter"] = { fg = "#FFA133", bold = true },
		["@module"] = { fg = M.base_16.base0C },
		["@constant"] = { fg = M.base_30.dark_purple },
		["@boolean"] = { fg = M.base_30.dark_purple, italic = true },
		["@punctuation.delimiter"] = { fg = M.base_16.base0E },
		["@punctuation.bracket"] = { fg = "#F8F8F2" },
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

M = require("base46").override_theme(M, "mymonokai")

return M
