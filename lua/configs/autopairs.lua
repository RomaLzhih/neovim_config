-- Import Rule and cond from nvim-autopairs
local Rule = require("nvim-autopairs.rule")
local npairs = require("nvim-autopairs")
local cond = require("nvim-autopairs.conds")

-- Add custom rule for < and > in C++ files
npairs.add_rules({
	Rule("<", ">"):with_pair(cond.not_filetypes({ "cpp" })), -- Apply only to C++ files
})

npairs.add_rule(Rule("$", "$", "tex"))
