local function showTitle()
	local window = hs.window.focusedWindow()
	hs.alert.show(window:application():title())
end

hs.hotkey.bind({ "cmd", "ctrl" }, "y", showTitle, nil, nil)

hs.urlevent.bind("someAlert", function(eventName, params)
	for k, v in pairs(params) do
		hs.alert.show(k .. " = " .. v)
	end
end)
