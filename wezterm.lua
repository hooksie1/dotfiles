local wezterm = require("wezterm")

local act = wezterm.action

local config = wezterm.config_builder()

config.color_scheme = "Tokyo Night"

config.font = wezterm.font("JetBrains Mono")

config.keys = {
	{
		key = "y",
		mods = "CTRL",
		action = act.ActivateKeyTable({
			name = "tabs",
			one_shot = false,
		}),
	},
	{
		key = "p",
		mods = "CTRL",
		action = act.ActivateKeyTable({
			name = "activate_pane",
			one_shot = false,
		}),
	},
	{
		key = "i",
		mods = "CTRL",
		action = act.ActivateKeyTable({
			name = "split_panes",
			timeout_milliseconds = 1000,
		}),
	},
	{
		key = "n",
		mods = "CTRL",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},
}

config.key_tables = {
	tabs = {
		{ key = "h", action = act.ActivateTabRelative(-1) },
		{ key = "l", action = act.ActivateTabRelative(1) },
		{ key = "n", action = act.SpawnTab("CurrentPaneDomain") },
		{
			key = "r",
			action = act.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{ key = "Enter", action = "PopKeyTable" },
	},
	activate_pane = {
		{ key = "h", action = act.ActivatePaneDirection("Left") },
		{ key = "l", action = act.ActivatePaneDirection("Right") },
		{ key = "j", action = act.ActivatePaneDirection("Down") },
		{ key = "k", action = act.ActivatePaneDirection("Up") },
		{ key = "Enter", action = "PopKeyTable" },
	},
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Enter", action = "PopKeyTable" },
	},
	split_panes = {
		{ key = "h", action = act.SplitVertical },
		{ key = "v", action = act.SplitHorizontal },
	},
}

--config.default_prog = { "/bin/zsh", "-l", "-c", "/opt/homebrew/bin/zellij" }
--
function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end

	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)
	if tab.is_active then
		return {
			{ Background = { Color = "#2b2042" } },
			{ Text = " " .. title .. " " },
		}
	end

	return title
end)

return config
