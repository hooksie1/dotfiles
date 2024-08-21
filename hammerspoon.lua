hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

local function keyCode(key, modifiers)
	modifiers = modifiers or {}
	return function()
		hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
		hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
	end
end

vimMode = hs.hotkey.bind({ "cmd", "ctrl" }, "h", keyCode("left"), nil, keyCode("left"))
vimMode = hs.hotkey.bind({ "cmd", "ctrl" }, "j", keyCode("down"), nil, keyCode("down"))
vimMode = hs.hotkey.bind({ "cmd", "ctrl" }, "k", keyCode("up"), nil, keyCode("up"))
vimMode = hs.hotkey.bind({ "cmd", "ctrl" }, "l", keyCode("right"), nil, keyCode("right"))
