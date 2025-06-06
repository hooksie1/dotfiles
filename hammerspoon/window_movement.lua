local function mover(unit)
	return function(win)
		win:move(unit, nil, true)
	end
end

local layouts = {
	topLeft = { x = 0, y = 0, w = 0.5, h = 0.5 },
	topRight = { x = 0.5, y = 0, w = 0.5, h = 0.5 },
	bottomLeft = { x = 0, y = 0.5, w = 0.5, h = 0.5 },
	bottomRight = { x = 0.5, y = 0.5, w = 0.5, h = 0.5 },
	leftHalf = { x = 0, y = 0, w = 0.5, h = 1 },
	rightHalf = { x = 0.5, y = 0, w = 0.5, h = 1 },
}

local positions = {
	maximize = function(win)
		win:maximize()
	end,
}

local bindings = {
	["j"] = "bottomLeft",
	["k"] = "bottomRight",
	["u"] = "topLeft",
	["i"] = "topRight",
	["Left"] = "leftHalf",
	["Right"] = "rightHalf",
	["Return"] = "maximize",
}

-- build functions for positions with layout table and mover
for name, layout in pairs(layouts) do
	positions[name] = mover(layout)
end

-- bind keys in bindings to positions
for key, position in pairs(bindings) do
	hs.hotkey.bind(HYPER, key, function()
		local win = hs.window.focusedWindow()
		if win then
			positions[position](win)
		end
	end)
end
