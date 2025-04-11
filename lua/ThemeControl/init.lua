-- main module
local M = {}

-- list of all colorschemes, in case list of colorschemes is not provided it cycles through these
local defaultColors = {}

-- Extract the colorscheme name from the file path
for _, file in ipairs(vim.fn.globpath(vim.o.runtimepath, "colors/*.vim", true, true)) do
	local name = vim.fn.fnamemodify(file, ":t:r")
	table.insert(defaultColors, name)
end

function M.setup(opts)
	opts = opts or {}

	-- default colorscheme
	local colorschemes = opts.colorschemes or defaultColors

	-- keep track of current theme
	local curTheme = (opts.default and opts.default <= #colorschemes) and opts.default or 1

	-- user provided variable must be the index of default scheme in colorschemes
	local default = (opts.default and opts.default <= #colorschemes) and opts.default or 1

	-- function to set colorscheme
	local function set_colorscheme(index)
		vim.cmd(":colorscheme " .. colorschemes[index])
	end

	-- creates command to cycle forward
	vim.api.nvim_create_user_command("CycleThemeForward", function()
		curTheme = curTheme % #colorschemes + 1
		set_colorscheme(curTheme)
	end, {})

	-- creates command to cycle backward
	vim.api.nvim_create_user_command("CycleThemeBackward", function()
		curTheme = curTheme - 1
		if curTheme == 0 then
			curTheme = #colorschemes
		end
		set_colorscheme(curTheme)
	end, {})

	-- resets colorscheme to designated default scheme
	vim.api.nvim_create_user_command("ResetTheme", function()
		curTheme = default
		set_colorscheme(curTheme)
	end, {})

	-- sets background as transparent
	vim.api.nvim_create_user_command("TransparentBackground", function()
		vim.cmd("highlight Normal guibg=none ctermbg=none")
		vim.cmd("highlight NonText guibg=none ctermbg=none")
	end, {})

	-- loads default colorscheme
	vim.cmd(":colorscheme " .. colorschemes[default])
end

return M
