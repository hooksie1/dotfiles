local APPS = {
	{ key = "1", app = "com.mitchellh.ghostty" },
	{ key = "2", app = "app.zen-browser.zen" },
	{ key = "3", app = "md.obsidian" },
	{ key = "4", app = "com.tinyspeck.slackmacgap" },
	{ key = "5", app = "dev.zed.Zed" },
	{ key = "6", app = "ru.keepcoder.Telegram" },
}

local function activate(name)
	if not hs.application.launchOrFocusByBundleID(name) then
		hs.alert.show("App not found")
	end
end

for _, v in ipairs(APPS) do
	hs.hotkey.bind(HYPEROPT, v.key, function()
		activate(v.app)
	end)
end

hs.hotkey.bind(HYPEROPT, "a", function()
	help = string.format("Applications \n\n")

	table.sort(APPS, function(a, b)
		return a.key < b.key
	end)

	for _, v in ipairs(APPS) do
		help = help .. string.format("%s -> %s\n", v.key, v.app)
	end
	hs.alert.show(help)
end)
