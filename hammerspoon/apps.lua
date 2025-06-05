APPS = {
	["g"] = "com.mitchellh.ghostty",
	["z"] = "app.zen-browser.zen",
	["o"] = "md.obsidian",
	["s"] = "com.tinyspeck.slackmacgap",
	["d"] = "dev.zed.Zed",
	["t"] = "ru.keepcoder.Telegram",
}

local function activate(name)
	if not hs.application.launchOrFocusByBundleID(name) then
		hs.alert.show("App not found")
	end
end

for key, app in pairs(APPS) do
	hs.hotkey.bind(HYPER, key, function()
		activate(app)
	end)
end
