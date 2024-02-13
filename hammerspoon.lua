hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

switcher = hs.window.switcher.new() -- default windowfilter: only visible windows, all Spaces
switcher_space = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter({})) -- include minimized/hidden windows, current Space only
switcher_browsers = hs.window.switcher.new({ "Safari", "Google Chrome" }) -- specialized switcher for your dozens of browser windows :)

local function keyCode(key, modifiers)
	modifiers = modifiers or {}
	return function()
		hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
		hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
	end
end

--vimMode = hs.hotkey.bind({'cmd', 'ctrl'}, "h", function()
--hs.eventtap.keyStroke({}, "left")
--end)

vimMode = hs.hotkey.bind({ "cmd", "ctrl" }, "h", keyCode("left"), nil, keyCode("left"))
vimMode = hs.hotkey.bind({ "cmd", "ctrl" }, "j", keyCode("down"), nil, keyCode("down"))
vimMode = hs.hotkey.bind({ "cmd", "ctrl" }, "k", keyCode("up"), nil, keyCode("up"))
vimMode = hs.hotkey.bind({ "cmd", "ctrl" }, "l", keyCode("right"), nil, keyCode("right"))

local win = hs.window.focusedWindow()
local next = win:screen():next()

--hs.hotkey.bind({"shift", "cmd"}, "h", hs.window.switcher.previousWindow)
--hs.hotkey.bind({"shift", "cmd"}, "l", hs.window.switcher.nextWindow)

local function focusWindowEast()
	hs.window.focusedWindow():focusWindowEast()
end

local function focusWindowWest()
	hs.window.focusedWindow():focusWindowWest()
end

local function focusWindowNorth()
	hs.window.focusedWindow():focusWindowNorth()
end

local function focusWindowSouth()
	hs.window.focusedWindow():focusWindowSouth()
end

hs.hotkey.bind({ "cmd", "shift" }, "l", focusWindowEast)
hs.hotkey.bind({ "cmd", "shift" }, "h", focusWindowWest)
hs.hotkey.bind({ "cmd", "shift" }, "j", focusWindowSouth)
hs.hotkey.bind({ "cmd", "shift" }, "k", focusWindowNorth)
