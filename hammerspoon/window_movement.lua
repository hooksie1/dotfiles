local positions = {
    topLeft = { x = 0, y = 0, w = 0.5, h = 0.5 },
    topRight = { x = 0.5, y = 0, w = 0.5, h = 0.5 },
    bottomLeft = { x = 0, y = 0.5, w = 0.5, h = 0.5 },
    bottomRight = { x = 0.5, y = 0.5, w = 0.5, h = 0.5 },
    maximize = function(win) win:maximize() end,
}

local keys = {
    ["j"] = positions.bottomLeft,
    ["k"] = positions.bottomRight,
    ["u"] = positions.topLeft,
    ["i"] = positions.topRight,
    ["Return"] = positions.maximize,
}

for key, position in pairs(keys) do
    hs.hotkey.bind(HYPER, key, function()
        local win = hs.window.focusedWindow()
        if not win then return end

        if type(position) == "function" then
            position(win)
        elseif type(position) == "table" then
            win:move(position, nil, true, 0)
        end
    end)
end
