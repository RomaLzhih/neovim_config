local lint = require("lint")

lint.linters_by_ft = {
	python = { "pylint" },
	cpp = { "clangtidy", "cpplint", "cppcheck" },
	bash = { "shellcheck" },
}

lint.linters.clangtidy.args = {
	"-extra-arg=-std=c++20",
}

-- lint.linters.cppcheck.args = {
-- 	"--std=c++20",
-- 	"--check-level=exhaustive",
-- }

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

local ns = require("lint").get_namespace("my_linter_name")
vim.diagnostic.config({ virtual_text = true }, ns)
