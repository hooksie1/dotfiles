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
	topLeftThird = { x = 0, y = 0, w = 1 / 3, h = 0.5 },
	topMiddleThird = { x = 1 / 3, y = 0, w = 1 / 3, h = 0.5 },
	topRightThird = { x = 2 / 3, y = 0, w = 1 / 3, h = 0.5 },
	bottomLeftThird = { x = 0, y = 0.5, w = 1 / 3, h = 0.5 },
	bottomMiddleThird = { x = 1 / 3, y = 0.5, w = 1 / 3, h = 0.5 },
	bottomRightThird = { x = 2 / 3, y = 0.5, w = 1 / 3, h = 0.5 },
}

local function closeFrames(f1, f2)
	local tolerance = 5
	return math.abs(f1.x - f2.x) < tolerance
		and math.abs(f1.y - f2.y) < tolerance
		and math.abs(f1.w - f2.w) < tolerance
		and math.abs(f1.h - f2.h) < tolerance
end

local function toggleLayouts(a, b)
	return function(win)
		local screenFrame = win:screen():frame()
		local currentFrame = win:frame()

		local frameA = hs.geometry.new(a):fromUnitRect(screenFrame)
		local frameB = hs.geometry.new(b):fromUnitRect(screenFrame)

		if closeFrames(currentFrame, frameA) then
			win:move(frameB)
		else
			win:move(frameA)
		end
	end
end

local positions = {
	maximize = function(win)
		win:maximize()
	end,
}

positions["leftToggle"] = toggleLayouts(layouts.topLeft, layouts.topLeftThird)
positions["rightToggle"] = toggleLayouts(layouts.topRight, layouts.topRightThird)

local bindings = {
	["m"] = "bottomLeft",
	[","] = "bottomRight",
	["u"] = "leftToggle",
	["i"] = "rightToggle",
	["Left"] = "leftHalf",
	["Right"] = "rightHalf",
	["Down"] = "bottomHalf",
	["Up"] = "topHalf",
	["Return"] = "maximize",
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
