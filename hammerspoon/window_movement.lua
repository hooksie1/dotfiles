local positions = {
    topLeft = function(win)
        win:move({ x = 0, y = 0, w = 0.5, h = 0.5 })
    end,
    topRight = function(win)
        win:move({ x = 0.5, y = 0, w = 0.5, h = 0.5 })
    end,
    bottomLeft = function(win)
        win:move({ x = 0, y = 0.5, w = 0.5, h = 0.5 })
    end,
    bottomRight = function(win)
        win:move({ x = 0.5, y = 0.5, w = 0.5, h = 0.5 })
    end,
    leftHalf = function(win)
        win:move({ x = 0, y = 0, w = 0.5, h = 1 })
    end,
    rightHalf = function(win)
        win:move({ x = 0.5, y = 0, w = 0.5, h = 1 })
    end,
    maximize = function(win) win:maximize() end,
}

local keys = {
    ["j"] = positions.bottomLeft,
    ["k"] = positions.bottomRight,
    ["u"] = positions.topLeft,
    ["i"] = positions.topRight,
    ["Left"] = positions.leftHalf,
    ["Right"] = positions.rightHalf,
    ["Return"] = positions.maximize,
}

for key, position in pairs(keys) do
    hs.hotkey.bind(HYPER, key, function()
        local win = hs.window.focusedWindow()
        if not win then return end
        position(win)
    end)
end
