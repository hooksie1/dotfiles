APPS = {
	["1"] = "com.mitchellh.ghostty",
	["2"] = "app.zen-browser.zen",
	["3"] = "md.obsidian",
	["4"] = "com.tinyspeck.slackmacgap",
	["5"] = "dev.zed.Zed",
	["6"] = "ru.keepcoder.Telegram",
}

local function activate(name)
	if not hs.application.launchOrFocusByBundleID(name) then
		hs.alert.show("App not found")
	end
end

for key, app in pairs(APPS) do
	hs.hotkey.bind(HYPEROPT, key, function()
		activate(app)
	end)
end
