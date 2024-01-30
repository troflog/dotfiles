-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action
-- This table will hold the configuration.
local config = {}
-- In newer versions of wezterm, use the config_builder which will help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end
--Border
config.window_frame = {
  border_left_width = '0.2cell',
  border_right_width = '0.2cell',
  border_bottom_height = '0.1cell',
  border_top_height = '0.1cell',
  border_left_color = 'grey',
  border_right_color = 'grey',
  border_bottom_color = 'grey',
  border_top_color = 'grey',
}
--Fonts 
wezterm.font_with_fallback({  'JetBrains Mono',"JuliaMono", "Symbols Nerd Font" })
config.font_size = 9

--Theme
config.color_scheme = 'tokyonight'
--Inital size
config.initial_cols = 83
config.initial_rows = 35
-- Looks
-- Remove title bar
config.window_decorations = "RESIZE"

--Tab bar
-- tab_bar flase renders it in a retro aesthetic using the main terminal font.
config.use_fancy_tab_bar= false


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

--- Key mappings 

--Set leader key
config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = 't',
    mods = 'SHIFT|ALT',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = "RightArrow",
    mods = "LEADER",
    action = wezterm.action.AdjustPaneSize{'Right',5},
  },
  {
    key = "LeftArrow",
    mods = "LEADER",
    action = wezterm.action.AdjustPaneSize{'Left',5},
  },
  {
    key = "UpArrow",
    mods = "LEADER",
    action = wezterm.action.AdjustPaneSize{'Up',5},
  },
  {
    key = "DownArrow",
    mods = "LEADER",
    action = wezterm.action.AdjustPaneSize{'Down',5},
  },
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
    bind_if(is_outside_vim, 'h', 'ALT', wezterm.action.ActivatePaneDirection('Left')),
    bind_if(is_outside_vim, 'l', 'ALT', wezterm.action.ActivatePaneDirection('Right')),
    bind_if(is_outside_vim, 'k', 'ALT', wezterm.action.ActivatePaneDirection('Up')),
    bind_if(is_outside_vim, 'j', 'ALT', wezterm.action.ActivatePaneDirection('Down')),-- resize panes
    -- split_nav('resize', 'h'),
    -- split_nav('resize', 'j'),
    -- split_nav('resize', 'k'),
    -- split_nav('resize', 'l')
    --
}
--Remote test
config.ssh_domains = {
  {
    -- This name identifies the domain
    name = 'mininet',
    -- The hostname or address to connect to. Will be used to match settings
    -- from your ssh config file
    remote_address = '192.168.56.2',
    -- The username to use on the remote host
    username = 'mininet',
  },
}
return config
