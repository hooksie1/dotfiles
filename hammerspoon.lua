hs.loadSpoon("ReloadConfiguration")

--  set up vim motions
local keys = { "h", "j", "k", "l" }
directions = {
	h = "left",
	j = "down",
	k = "up",
	l = "right",
}

local function keyCode(key, modifiers)
	modifiers = modifiers or {}
	return function()
		hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
		hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
	end
end

for _, key in ipairs(keys) do
	hs.hotkey.bind({ "cmd", "ctrl" }, key, keyCode(directions[key]), nil, keyCode(directions[key]))
end

-- setup window selections
hs.loadSpoon("AppWindowSwitcher"):bindHotkeys({
	["Ghostty"] = { { "cmd", "ctrl" }, "t" },
	["Zen"] = { { "cmd", "ctrl" }, "z" },
	["Obsidian"] = { { "cmd", "ctrl" }, "o" },
	["Slack"] = { { "cmd", "ctrl" }, "s" },
	["Zed"] = { { "cmd", "ctrl" }, "d" },
})

spoon.ReloadConfiguration:start()
