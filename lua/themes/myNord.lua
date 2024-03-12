-- Credits to original https://github.com/arcticicestudio/nord-vim
-- This is modified version of it

local M = {}

M.base_30 = {
  white = "#abb2bf",
  darker_black = "#2a303c",
  black = "#2E3440", --  nvim bg
  black2 = "#343a46",
  one_bg = "#373d49",
  one_bg2 = "#464c58",
  one_bg3 = "#494f5b",
  grey = "#4b515d",
  grey_fg = "#565c68",
  grey_fg2 = "#606672",
  light_grey = "#646a76",
  red = "#BF616A",
  baby_pink = "#de878f",
  pink = "#d57780",
  line = "#414753", -- for lines like vertsplit
  green = "#A3BE8C",
  vibrant_green = "#afca98",
  blue = "#7797b7",
  nord_blue = "#81A1C1",
  yellow = "#EBCB8B",
  sun = "#e1c181",
  purple = "#B48EAD",
  dark_purple = "#a983a2",
  teal = "#6484a4",
  orange = "#e39a83",
  cyan = "#9aafe6",
  statusline_bg = "#333945",
  lightbg = "#3f4551",
  pmenu_bg = "#A3BE8C",
  folder_bg = "#7797b7",
}

M.base_16 = {
  -- base00 = "#2E3440", -- nord0 in palette
  -- base01 = "#3B4252", -- nord1 in palette
  -- base02 = "#434C5E", -- nord2 in palette
  -- base03 = "#4C566A", -- nord3 in palette
  -- base04 = "#D8DEE9", -- nord4 in palette
  -- base05 = "#E5E9F0", -- nord5 in palette
  -- base06 = "#ECEFF4", -- nord6 in palette
  -- base07 = "#8FBCBB", -- nord7 in palette
  -- base08 = "#88C0D0", -- nord8 in palette
  -- base09 = "#81A1C1", -- nord9 in palette
  -- base0A = "#5E81AC", -- nord10 in palette
  -- base0B = "#BF616A", -- nord11 in palette
  -- base0C = "#D08770", -- nord12 in palette
  -- base0D = "#EBCB8B", -- nord13 in palette
  -- base0E = "#A3BE8C", -- nord14 in palette
  -- base0F = "#B48EAD", -- nord15 in palette
  -- - base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  -- - base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
  -- - base0A - Classes, Markup Bold, Search Text Background
  -- - base0B - Strings, Inherited Class, Markup Code, Diff Inserted
  -- - base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
  -- - base0D - Functions, Methods, Attribute IDs, Headings
  -- - base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
  -- - base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
  base00 = "#2E3440",
  base01 = "#3B4252",
  base02 = "#434C5E",
  base03 = "#4C566A",
  base04 = "#D8DEE9",
  base05 = "#E5E9F0",
  base06 = "#ECEFF4",
  base07 = "#8FBCBB",
  base08 = "#D8DEE9",
  base09 = "#B48EAD",
  base0A = "#81A1C1",
  base0B = "#A3BE8C",
  base0C = "#88C0D0",
  base0D = "#88C0D0",
  base0E = "#81A1C1",
  base0F = "#EBCB8B",
}

M.polish_hl = {
  ["@constant"] = { fg = M.base_30.yellow },
  ["@operator"] = { fg = M.base_30.nord_blue },
  ["@property"] = { fg = M.base_30.teal, italic = true },
  ["@punctuation.bracket"] = { fg = M.base_16.base07 },
  ["@punctuation.delimiter"] = { fg = M.base_30.white },
}
M.type = "dark"

M = require("base46").override_theme(M, "myNord")

return M
