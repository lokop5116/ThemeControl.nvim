-- main module
local M = {}

-- list of all default colorschemes, in case list of colorschemes is not provided it cycles through these
local defaultColors = {
	"blue",
	"darkblue",
	"delek",
	"desert",
	"elflord",
	"evening",
	"habamax",
	"industry",
	"koehler",
	"morning",
	"murphy",
	"pablo",
	"peachpuff",
	"ron",
	"shine",
	"slate", -- set as default when no default given
	"torte",
	"zellner",
}

function M.setup(opts)
	opts = opts or {}

	local curTheme = 0 --keep track of current theme

	-- default colorscheme
	-- user provided variable must be the index of default scheme in colorschemes
	local default = opts.default or 7

	local colorschemes = opts.colorschemes or defaultColors

	-- if a user provided list is found
	-- sets curTheme as 1 otherwise sets it at position of "slate" in defaultColors
	if colorschemes == defaultColors then
		curTheme = 7
	else
		-- if user does not specify default index, goes to 1
		curTheme = default or 1
	end

	-- creates command to cycle forward
	vim.api.nvim_create_user_command("CycleThemeForward", function()
		curTheme = curTheme % #colorschemes + 1
		vim.cmd(":colorscheme " .. colorschemes[curTheme])
	end, {})

	-- creates command to cycle backward
	vim.api.nvim_create_user_command("CycleThemeBackward", function()
		curTheme = curTheme - 1
		if curTheme == 0 then
			curTheme = #colorschemes
		end
		vim.cmd(":colorscheme " .. colorschemes[curTheme])
	end, {})

	-- resets colorscheme to designated default scheme
	vim.api.nvim_create_user_command("ResetTheme", function()
			curTheme = default
		vim.cmd(":colorscheme " .. colorschemes[curTheme])
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
