-- Credits to original https://github.com/sainnhe/gruvbox-material
-- This is modified version of it

local M = {}

M.base_30 = {
	white = "#c7b89d",
	darker_black = "#1a1d1e",
	black = "#1e2122", --  nvim bg
	black2 = "#242728",
	one_bg = "#282b2c",
	one_bg2 = "#393c3d",
	one_bg3 = "#404344",
	grey = "#484b4c",
	grey_fg = "#575a5b",
	grey_fg2 = "#545758",
	light_grey = "#606364",
	red = "#ec6b64",
	baby_pink = "#ce8196",
	pink = "#ff75a0",
	line = "#323536", -- for lines like vertsplit
	green = "#89b482",
	vibrant_green = "#a9b665",
	nord_blue = "#6f8faf",
	blue = "#6d8dad",
	yellow = "#d6b676",
	sun = "#d1b171",
	purple = "#9385b4",
	dark_purple = "#887aa9",
	teal = "#749689",
	orange = "#e78a4e",
	cyan = "#82b3a8",
	statusline_bg = "#222526",
	lightbg = "#2d3031",
	pmenu_bg = "#89b482",
	folder_bg = "#6d8dad",
}

M.base_16 = {
	base00 = "#1e2122",
	base01 = "#2c2f30",
	base02 = "#36393a",
	base03 = "#404344",
	base04 = "#d4be98",
	base05 = "#c0b196",
	base06 = "#c3b499",
	base07 = "#c7b89d",
	base08 = "#7daea3",
	base09 = "#d3869b",
	base0A = "#d8a657",
	base0B = "#a9b665",
	base0C = "#89b482",
	base0D = "#a9b665",
	base0E = "#ea6962",
	base0F = "#e78a4e",
}

M.polish_hl = {
	treesitter = {
		["@constructor"] = { fg = M.base_16.base0D },
		["@variable.member"] = { fg = M.base_30.white },
		["@type"] = { fg = M.base_16.base0A },
		["@type.builtin"] = { fg = M.base_16.base0F },
		["@property"] = { fg = M.base_30.teal },
		["@namespace"] = { fg = M.base_16.base0C },
		["@parameter"] = { fg = M.base_30.white, bold = true },
		["@variable.parameter"] = { fg = M.base_30.white, bold = true },
		["@module"] = { fg = M.base_16.base0C },
		["@constant"] = { fg = M.base_30.baby_pink },
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

M.type = "dark"

M = require("base46").override_theme(M, "mygruvboxmaterial")

return M
