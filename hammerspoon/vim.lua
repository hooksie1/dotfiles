--  set up vim motions
DIRECTIONS = {
	["h"] = "left",
	["j"] = "down",
	["k"] = "up",
	["l"] = "right",
}

local function keyCode(key, modifiers)
	modifiers = modifiers or {}
	return function()
		hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
		hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
	end
end

for key, direction in pairs(DIRECTIONS) do
	hs.hotkey.bind({ "cmd", "ctrl" }, key, keyCode(direction), nil, keyCode(direction))
end
