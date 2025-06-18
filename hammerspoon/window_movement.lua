-- tables for layouts
local layouts = {
	topLeft = { x = 0, y = 0, w = 0.5, h = 0.5 },
	topRight = { x = 0.5, y = 0, w = 0.5, h = 0.5 },
	bottomLeft = { x = 0, y = 0.5, w = 0.5, h = 0.5 },
	bottomRight = { x = 0.5, y = 0.5, w = 0.5, h = 0.5 },
	leftHalf = { x = 0, y = 0, w = 0.5, h = 1 },
	rightHalf = { x = 0.5, y = 0, w = 0.5, h = 1 },
	bottomHalf = { x = 0, y = 0.5, w = 1, h = 0.5 },
	topHalf = { x = 0, y = 0, w = 1, h = 0.5 },
}

local bindings = {
	["m"] = "bottomLeft",
	[","] = "bottomRight",
	["u"] = "topLeft",
	["i"] = "topRight",
	["Left"] = "leftHalf",
	["Right"] = "rightHalf",
	["Down"] = "bottomHalf",
	["Up"] = "topHalf",
	["Return"] = "maximize",
}

local positions = {
	maximize = function(win)
		win:maximize()
	end,
}

-- moverFunc constructs the functions to move windows from the layouts table
local function moverFunc(unit)
	return function(win)
		win:move(unit, nil, true)
	end
end

-- build functions for positions with layout table and mover
for name, layout in pairs(layouts) do
	positions[name] = moverFunc(layout)
end

-- bind keys in bindings to positions
for key, position in pairs(bindings) do
	hs.hotkey.bind(HYPEROPT, key, function()
		local win = hs.window.focusedWindow()
		if win then
			positions[position](win)
		end
	end)
end
