APPS = {
	["g"] = "com.mitchellh.ghostty",
	["z"] = "app.zen-browser.zen",
	["o"] = "md.obsidian",
	["s"] = "com.tinyspeck.slackmacgap",
	["d"] = "dev.zed.Zed",
	["t"] = "ru.keepcoder.Telegram",
}

local function activate(name)
	local apps = hs.application.applicationsForBundleID(name)
	local app = apps[1]

	if not app then
		hs.alert.show("App not found: " .. name)
	end

	for _, win in ipairs(app:allWindows()) do
		if win:isMinimized() then
			win:unminimize()
		end
	end

	app:activate()
	local win = app:mainWindow()
	if win then
		win:focus()
	end
end

for key, app in pairs(APPS) do
	hs.hotkey.bind(HYPER, key, function()
		activate(app)
	end)
end
