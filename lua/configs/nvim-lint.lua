local lint = require("lint")

lint.linters_by_ft = {
	python = { "pylint" },
	cpp = { "clangtidy", "cppcheck", "cpplint" },
	bash = { "shellcheck" },
}

lint.linters.clangtidy.args = {
	function()
		if vim.fn.isdirectory("build") == 1 then
			return "-p build"
		else
			return nil
		end
	end,
	"--quiet",
	"--extra-arg=-std=c++20",
}

lint.linters.cppcheck.args = {
	"--enable=warning,style,performance,information",
	"--inline-suppr",
	"--max-configs=1",
	function()
		if vim.fn.isdirectory("build") == 1 then
			return "--cppcheck-build-dir=build"
		else
			return nil
		end
	end,
	function()
		if vim.bo.filetype == "cpp" then
			return "--language=c++"
		else
			return "--language=c"
		end
	end,
	"--quiet",
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

local pylint = require("lint").get_namespace("pylint")
vim.diagnostic.config({
	virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
	signs = { severity = { min = vim.diagnostic.severity.HINT } },
	underline = false,
}, pylint)

local cpplint = require("lint").get_namespace("cpplint")
vim.diagnostic.config({
	virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
	signs = { severity = { min = vim.diagnostic.severity.ERROR } },
	underline = false,
}, cpplint)
