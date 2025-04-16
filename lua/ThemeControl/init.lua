-- main module
local M = {}

local utils = require("ThemeControl.utils")
local commands = require("ThemeControl.commands")

function M.setup(opts)
	opts = opts or {}

	-- default colorscheme
	local colorschemes = opts.colorschemes or utils.colors()

	-- keep track of current theme
	local curTheme = (opts.default and opts.default <= #colorschemes) and opts.default or 1

	-- user provided variable must be the index of default scheme in colorschemes
	local default = (opts.default and opts.default <= #colorschemes) and opts.default or 1

	-- creates commands
	commands.create_commands(colorschemes, curTheme, default)

	-- loads default colorscheme
	vim.cmd(":colorscheme " .. colorschemes[default])
end

return M
