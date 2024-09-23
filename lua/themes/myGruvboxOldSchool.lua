-- Credits to original https://github.com/morhetz/gruvbox
-- This is modified version based on the origin gruvbox theme in base46
-- better base16

local M = {}

M.base_30 = {
	white = "#ebdbb2",
	darker_black = "#232323",
	black = "#282828", --  nvim bg
	black2 = "#2e2e2e",
	one_bg = "#353535",
	one_bg2 = "#3f3f3f",
	one_bg3 = "#444444",
	grey = "#4b4b4b",
	grey_fg = "#4e4e4e",
	grey_fg2 = "#505050",
	light_grey = "#656565",
	red = "#fb4934",
	baby_pink = "#cc241d",
	pink = "#ff75a0",
	line = "#36393a", -- for lines like vertsplit
	green = "#b8bb26",
	vibrant_green = "#a9b665",
	nord_blue = "#83a598",
	blue = "#458588",
	yellow = "#d79921",
	sun = "#fabd2f",
	purple = "#b4bbc8",
	dark_purple = "#d3869b",
	teal = "#749689",
	orange = "#e78a4e",
	cyan = "#82b3a8",
	statusline_bg = "#2c2c2c",
	lightbg = "#3d3d3d",
	pmenu_bg = "#83a598",
	folder_bg = "#749689",
}

M.base_16 = {
	base00 = "#282828",
	base01 = "#3c3836",
	base02 = "#423e3c",
	base03 = "#484442",
	base04 = "#bdae93",
	base05 = "#d5c4a1",
	base06 = "#ebdbb2",
	base07 = "#fbf1c7",
	base08 = "#87afaf",
	base09 = "#d787af",
	base0A = "#ffaf00",
	base0B = "#afaf00",
	base0C = "#8ec07c",
	base0D = "#afaf00",
	base0E = "#d75f5f",
	base0F = "#d65d0e",
}

M.type = "dark"

M = require("base46").override_theme(M, "myGruvboxOldSchool")

M.polish_hl = {
	treesitter = {
		["@constructor"] = { fg = M.base_16.base0D },
		["@variable.member"] = { fg = M.base_30.white },
		["@type"] = { fg = M.base_16.base0A },
		["@type.buildin"] = { fg = M.base_16.base0F },
		["@property"] = { fg = "#87afaf" },
		["@namespace"] = { fg = M.base_16.base0C },
		["@parameter"] = { fg = M.base_30.white, bold = true },
		["@variable.parameter"] = { fg = M.base_30.white, bold = true },
		["@module"] = { fg = M.base_16.base0C },
		["@constant"] = { fg = M.base_30.dark_purple },
		["@punctuation.delimiter"] = { fg = M.base_30.white },
		["@punctuation.bracket"] = { fg = M.base_30.white },
		["@operator"] = { fg = M.base_30.white },
		["@variable"] = { fg = M.base_30.white },
		["@macro"] = { fg = M.base_16.base0F, italic = true },
		["@keyword.repeat"] = { fg = M.base_16.base0E },
		["@keyword.modifier"] = { fg = M.base_16.base0E, italic = true },
	},
}

return M
