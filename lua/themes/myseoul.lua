local M = {}

M.base_30 = {
	white = "#DFE0E0",
	darker_black = "#444444",
	black = "#4A4A4A",
	black2 = "#515151",
	one_bg = "#585858",
	one_bg2 = "#5f5f5f",
	one_bg3 = "#666666",
	grey = "#6d6d6d",
	grey_fg = "#747474",
	grey_fg2 = "#7b7b7b",
	light_grey = "#828282",
	red = "#DF9A98",
	baby_pink = "#FFBEB0",
	pink = "#DFBDBC",
	line = "#606060",
	green = "#719672",
	vibrant_green = "#97BB98",
	blue = "#96BBDC",
	nord_blue = "#BADCFC",
	yellow = "#E0BB71",
	sun = "#FFDD98",
	purple = "#DFBDBC",
	dark_purple = "#FFBEB0",
	teal = "#7FB7BD",
	orange = "#ffcb88",
	cyan = "#96DDDE",
	statusline_bg = "#515151",
	lightbg = "#5f5f5f",
	pmenu_bg = "#D8D8D8",
	folder_bg = "#67A9AA",
	brown = "#a2a2a2",
}

M.base_16 = {
	base00 = "#3d3d3d",
	base01 = "#515151",
	base02 = "#585858",
	base03 = "#5f5f5f",
	base04 = "#666666",
	base05 = "#D8D8D8",
	base06 = "#D8D8D8",
	base07 = "#DFE0E0",
	base08 = "#DF9A98",
	base09 = "#E07798",
	base0A = "#E0BB71",
	base0B = "#97BB98",
	base0C = "#97BCBC",
	base0D = "#96BBDC",
	base0E = "#DFBDBC",
	base0F = "#b0b0b0",
}

M.type = "dark"

M.polish_hl = {
	syntax = {
		Constant = { fg = M.base_30.sun },
	},
	treesitter = {
		["@constant"] = { fg = M.base_30.brown },
		["@punctuation.bracket"] = { fg = M.base_30.sun },
		["@constructor"] = { fg = M.base_16.base0D },
		["@variable.member"] = { fg = M.base_30.base08 },
		["@type"] = { fg = "#e6dfb8" },
		["@type.builtin"] = { fg = M.base_16.base0A },
		["@property"] = { fg = M.base_30.dark_purple },
		["@namespace"] = { fg = M.base_16.base0C },
		["@parameter"] = { fg = M.base_30.white, bold = true },
		["@variable.parameter"] = { fg = M.base_30.white, bold = true },
		["@module"] = { fg = M.base_16.base0C },
		["@boolean"] = { fg = M.base_30.brown, italic = true },
		["@punctuation.delimiter"] = { fg = M.base_16.base06 },
		["@operator"] = { fg = M.base_16.base06 },
		["@macro"] = { fg = M.base_16.base0F, italic = true },
		["@keyword.repeat"] = { fg = M.base_16.base0E },
		["@keyword.modifier"] = { fg = M.base_16.base0E, italic = true },
	},
}

M = require("base46").override_theme(M, "myseoul")

return M
