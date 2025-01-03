-- credits to original theme https://github.com/voronianski/oceanic-next-color-scheme
-- This is a modified version of the original theme.

local M = {}

M.base_30 = {
	white = "#D8DEE9", -- confirmed
	darker_black = "#15252e",
	black = "#1B2B34", --  nvim bg
	black2 = "#21313a",
	one_bg = "#25353e",
	one_bg2 = "#2e3e47",
	one_bg3 = "#36464f",
	grey = "#43535c",
	grey_fg = "#4d5d66",
	grey_fg2 = "#576770",
	light_grey = "#5f6f78",
	red = "#EC5F67",
	baby_pink = "#ff7d85",
	pink = "#ffafb7",
	line = "#2a3a43", -- for lines like vertsplit
	green = "#99C794",
	vibrant_green = "#b9e75b",
	nord_blue = "#598cbf",
	blue = "#6699CC",
	yellow = "#FAC863",
	sun = "#ffd06b",
	purple = "#C594C5",
	dark_purple = "#ac7bac",
	teal = "#50a4a4",
	orange = "#F99157",
	cyan = "#62B3B2",
	statusline_bg = "#1f2f38",
	lightbg = "#2c3c45",
	pmenu_bg = "#15bf84",
	folder_bg = "#598cbf",
}

-- Base16 colors taken from:
M.base_16 = {
	base00 = "#1B2B34",
	base01 = "#343D46",
	base02 = "#4F5B66",
	base03 = "#65737e",
	base04 = "#A7ADBa",
	base05 = "#C0C5Ce",
	base06 = "#CDD3De",
	base07 = "#D8DEE9",
	base08 = "#6cbdbc",
	base09 = "#FAC863",
	base0A = "#F99157",
	base0B = "#99C794",
	base0C = "#5aaeae",
	base0D = "#6699CC",
	base0E = "#C594C5",
	base0F = "#d75f5f",
}

M.type = "dark"

M.polish_hl = {
	treesitter = {
		["@constructor"] = { fg = M.base_16.base0D },
		["@variable.member"] = { fg = M.base_30.white },
		["@type"] = { fg = M.base_16.base08 },
		["@type.builtin"] = { fg = M.base_16.base08 },
		["@property"] = { fg = M.base_16.base0B },
		["@namespace"] = { fg = M.base_16.base0C },
		["@parameter"] = { fg = M.base_30.white, bold = true },
		["@variable.parameter"] = { fg = M.base_30.white, bold = true },
		["@module"] = { fg = M.base_16.base0C },
		["@constant"] = { fg = M.base_30.dark_purple },
		["@boolean"] = { fg = M.base_30.dark_purple, italic = true },
		["@punctuation.delimiter"] = { fg = M.base_30.white },
		["@punctuation.bracket"] = { fg = M.base_30.white },
		["@operator"] = { fg = M.base_30.white },
		["@variable"] = { fg = M.base_30.white },
		["@macro"] = { fg = M.base_16.base0F, italic = true },
		["@keyword.repeat"] = { fg = M.base_16.base0E },
		["@keyword.modifier"] = { fg = M.base_16.base0E, italic = true },
	},
}

M = require("base46").override_theme(M, "myoceanic-next")

return M
