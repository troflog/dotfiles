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


----Setup Navigator.nvim----
local w = require 'wezterm'
local a = w.action

local function is_inside_vim(pane)
  local tty = pane:get_tty_name()
  if tty == nil then return false end

  local success, stdout, stderr = w.run_child_process
    { 'sh', '-c',
      'ps -o state= -o comm= -t' .. w.shell_quote_arg(tty) .. ' | ' ..
      'grep -iqE \'^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?)(diff)?$\'' }

  return success
end

local function is_outside_vim(pane) return not is_inside_vim(pane) end

local function bind_if(cond, key, mods, action)
  local function callback (win, pane)
    if cond(pane) then
      win:perform_action(action, pane)
    else
      win:perform_action(a.SendKey({key=key, mods=mods}), pane)
    end
  end

  return {key=key, mods=mods, action=w.action_callback(callback)}
end

--Shortcuts
config.keys = {
  -- {
  --   key = "l",
  --   mods = "ALT",
  --   action = wezterm.action.ClearScrollback 'ScrollbackOnly',
  -- },
  {
    key = "\\",
    mods = "ALT",
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = "-",
    mods = "ALT",
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  --Nvim navigator
    bind_if(is_outside_vim, 'h', 'CTRL', a.ActivatePaneDirection('Left')),
    bind_if(is_outside_vim, 'l', 'CTRL', a.ActivatePaneDirection('Right')),
    bind_if(is_outside_vim, 'j', 'CTRL', a.ActivatePaneDirection('Up')),
    bind_if(is_outside_vim, 'k', 'CTRL', a.ActivatePaneDirection('Down')),
}
return config
