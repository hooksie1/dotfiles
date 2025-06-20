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

hs.hotkey.bind(HYPEROPT, "a", function()
	help = string.format("Applications \n\n")

	local keys = {}
	for k in pairs(APPS) do
		table.insert(keys, k)
	end

	table.sort(keys)

	for _, key in ipairs(keys) do
		help = help .. string.format("%s -> %s\n", key, APPS[key])
	end
	hs.alert.show(help)
end)
