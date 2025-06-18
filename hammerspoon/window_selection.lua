local directions = {
	["l"] = "windowsToEast",
	["h"] = "windowsToWest",
	["j"] = "windowsToSouth",
	["k"] = "windowsToNorth",
}
local function focusDirection(dirFunc)
	local win = hs.window.focusedWindow()
	if not win then
		return
	end

	local candidates = win[dirFunc](win)
	local target = candidates and candidates[1]

	if target then
		target:focus()
	end
end

for key, dir in pairs(directions) do
	hs.hotkey.bind(HYPEROPT, key, function()
		focusDirection(dir)
	end)
end
