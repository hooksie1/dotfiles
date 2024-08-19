local wezterm = require("wezterm")

local act = wezterm.action

local config = wezterm.config_builder()

config.color_scheme = "Tokyo Night"

config.default_prog = { "/bin/zsh", "-l", "-c", "/opt/homebrew/bin/zellij" }

return config
