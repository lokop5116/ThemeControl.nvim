local M = {}

function M.colors()
	local defaultColors = {}

	-- extract all colorschemes installed from runtime
	for _, file in ipairs(vim.fn.globpath(vim.o.runtimepath, "colors/*.vim", true, true)) do
		local name = vim.fn.fnamemodify(file, ":t:r")
		table.insert(defaultColors, name)
	end

	return defaultColors
end

return M
