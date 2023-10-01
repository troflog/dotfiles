-- Pull in the wezterm API
local wezterm = require 'wezterm'
-- This table will hold the configuration.
local config = {}
-- In newer versions of wezterm, use the config_builder which will help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

--Fonts 
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 9

--Theme
config.color_scheme = 'tokyonight'

-- Looks
-- Remove title bar
config.window_decorations = "RESIZE"

--Tab bar
-- tab_bar flase renders it in a retro aesthetic using the main terminal font.
config.use_fancy_tab_bar= false

--Shortcuts
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
