-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = 'Catppuccin Mocha'
config.enable_tab_bar = false
config.font = wezterm.font 'NotoMonoNerdFont'

-- Prevents wezterm from crashing, but also makes it pixelated. :(
--config.enable_wayland = false

-- and finally, return the configuration to wezterm
return config
