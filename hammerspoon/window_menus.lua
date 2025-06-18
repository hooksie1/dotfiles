local function unwrapChildren(children)
	if #children == 1 and type(children[1]) == "table" and children[1][1] then
		return children[1]
	end
	return children
end

local function addMenuItem(results, path)
	table.insert(results, {
		text = table.concat(path, " > "),
		menuPath = path,
	})
end

local function flattenMenuItems(items, path, results)
	results = results or {}
	path = path or {}

	for _, item in ipairs(items) do
		if item["AXTitle"] and item["AXEnabled"] ~= false then
			local newPath = hs.fnutils.copy(path)
			table.insert(newPath, item["AXTitle"])

			if item["AXChildren"] then
				local children = unwrapChildren(item["AXChildren"])
				flattenMenuItems(children, newPath, results)
			else
				addMenuItem(results, newPath)
			end
		end
	end

	return results
end

hs.hotkey.bind(HYPER, "m", function()
	local win = hs.window.focusedWindow()
	if not win then
		return
	end

	local app = win:application()
	local menu = app:getMenuItems()
	if not menu then
		hs.alert.show("No Menu items")
		return
	end
	local items = flattenMenuItems(menu)
	hs.chooser
		.new(function(choice)
			if choice then
				app:selectMenuItem(choice.menuPath)
			end
		end)
		:choices(items)
		:searchSubText(true)
		:placeholderText("Select a menu item")
		:show()
end)
