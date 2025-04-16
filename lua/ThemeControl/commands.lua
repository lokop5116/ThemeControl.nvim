local M = {}

function M.set_colorscheme(index, colorschemes)
	vim.cmd(":colorscheme " .. colorschemes[index])
end

function M.create_commands(colorschemes, curTheme, default)
	-- creates command to cycle forward
	vim.api.nvim_create_user_command("CycleThemeForward", function()
		curTheme = curTheme % #colorschemes + 1
		M.set_colorscheme(curTheme, colorschemes)
	end, {})

	-- creates command to cycle backward
	vim.api.nvim_create_user_command("CycleThemeBackward", function()
		curTheme = curTheme - 1
		if curTheme == 0 then
			curTheme = #colorschemes
		end
		M.set_colorscheme(curTheme, colorschemes)
	end, {})

	-- resets colorscheme to designated default scheme
	vim.api.nvim_create_user_command("ResetTheme", function()
		curTheme = default
		M.set_colorscheme(curTheme, colorschemes)
	end, {})

	-- sets background as transparent
	vim.api.nvim_create_user_command("TransparentBackground", function()
		vim.cmd("highlight Normal guibg=none ctermbg=none")
		vim.cmd("highlight NonText guibg=none ctermbg=none")
	end, {})
end

return M
