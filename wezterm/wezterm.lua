-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- Text

-- In newer versions of wezterm, use the config_builder which will help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 9
-- For example, changing the color scheme:
config.color_scheme = 'tokyonight'
-- Remove title bar
config.window_decorations = "RESIZE"
config.keys = {
  {
    key = "\\",
    mods = "ALT",
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = "-",
    mods = "ALT",
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  }
}
-- and finally, return the configuration to wezterm
return config
