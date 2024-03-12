-- credits to original theme https://rosepinetheme.com/
-- this is a modified version of it

local M = {}

M.base_30 = {
  black = "#191724", --  nvim bg
  darker_black = "#13111e",
  white = "#e0def4",
  black2 = "#1f1d2a",
  one_bg = "#262431", -- real bg of onedark
  one_bg2 = "#2d2b38",
  one_bg3 = "#353340",
  grey = "#3f3d4a",
  grey_fg = "#474552",
  grey_fg2 = "#514f5c",
  light_grey = "#5d5b68",
  red = "#eb6f92",
  baby_pink = "#f5799c",
  pink = "#ff83a6",
  line = "#2e2c39", -- for lines like vertsplit
  green = "#ABE9B3",
  vibrant_green = "#b5f3bd",
  nord_blue = "#86b9c2",
  blue = "#8bbec7",
  yellow = "#f6c177",
  sun = "#fec97f",
  purple = "#c4a7e7",
  dark_purple = "#bb9ede",
  teal = "#6aadc8",
  orange = "#f6c177",
  cyan = "#a3d6df",
  statusline_bg = "#201e2b",
  lightbg = "#2d2b38",
  pmenu_bg = "#c4a7e7",
  folder_bg = "#6aadc8",
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
  base00 = "#191724",
  base01 = "#1f1d2e",
  base02 = "#26233a",
  base03 = "#6e6a86",
  base04 = "#908caa",
  base05 = "#e0def4",
  base06 = "#e0def4",
  base07 = "#524f67",
  -- base08 = "#eb6f92",
  base08 = "#e0def4",
  base09 = "#f6c177",
  base0A = "#c4a7e7",
  base0B = "#f6c177",
  base0C = "#9ccfd8",
  base0D = "#ebbcba",
  base0E = "#31748f",
  base0F = "#524f67",
}

M.polish_hl = {
  ["@function.method.call"] = { fg = M.base_30.cyan },
  ["@property"] = { fg = M.base_30.cyan },
  ["@constant"] = { fg = M.base_30.orange, italic = true },
}

M = require("base46").override_theme(M, "myRosepine")

M.type = "dark"

return M
