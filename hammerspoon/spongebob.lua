local function spongebob(input)
	local spongebobed = {}
	local toggle = true

	for i = 1, #input do
		local c = input:sub(i, i)
		if c:match("%a") then
			if toggle then
				if c:match("%l") then
					table.insert(spongebobed, c:upper())
				else
					table.insert(spongebobed, c:lower())
				end
			else
				table.insert(spongebobed, c)
			end
			toggle = not toggle
		else
			table.insert(spongebobed, c)
		end
	end

	return table.concat(spongebobed)
end
hs.hotkey.bind(HYPER, "b", function()
	local spongebobed = spongebob(hs.pasteboard.getContents())
	hs.pasteboard.setContents(spongebobed)
end)
