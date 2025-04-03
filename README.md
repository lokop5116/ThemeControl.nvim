# 🎨 ThemeControl.nvim

A very simple and small plugin to cycle through a list of installed colorschemes. **Written completely in Lua.**

## Features

| **Command** | **Description** |
| :--- | :---: |
| _:CycleThemeForward_ | Goes forward in your list of colorschemes, starts at specified default/ current position |
| _:CycleThemeBackward_ | Goes backward in your list of colorschemes, starts at specified default/ current position |
| _:ResetTheme_ | Resets colorscheme to default and your position |
| _:TransparentBackground_ | Sets background to transparent, is reset in case colorscheme in changed |

## Requirements

- **Neovim** >= 0.7.0

## Installation

Install the plugin using whatever plugin manager.

> [!caution]
> Make sure the listed colourschemes are already installed.

Using [lazy.nvim](https://github.com/folke/lazy.nvim):
```lua
  {
  "lokop5116/ThemeControl.nvim",
  opts = { -- your configuration
    colorschemes = {
      -- list of installed colorschemes you will cycle through
      -- example:
      "carbonfox",
      "tokyonight",
      "rose-pine",
                    }
    default = 1,
    -- index of the colorscheme you want to set as default, loads at startup
    -- set as "carbonfox" in this case
          },
  }
```

## Configuration

<details><summary>Default Options</summary>

<!-- config:start -->

```lua
default = 7,
defaultColors = {
"blue",
"darkblue",
"delek",
"desert",
"elflord",
"evening",
"habamax", -- set as default colorscheme
"industry",
"koehler",
"morning",
"murphy",
"pablo",
"peachpuff",
"ron",
"shine",
"slate",
"torte",
"zellner",
}

```
<!-- config:end -->
