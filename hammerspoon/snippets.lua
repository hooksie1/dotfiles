local snippetStorage = os.getenv("HOME") .. "/.config/hammerspoon/snippets.json"

local function loadSnippets()
	local file = io.open(snippetStorage, "r")
	if not file then
		return {}
	end
	local content = file:read("*a")
	file:close()
	return hs.json.decode(content) or {}
end

local function saveSnippets(snippets)
	local file = io.open(snippetStorage, "w")
	file:write(hs.json.encode(snippets))
	file:close()
end

local function snippetPrompt()
	local action, name = hs.dialog.textPrompt("New Snippet", "Enter Snippet Name", "", "OK", "Cancel")
	if action == "Cancel" then
		return
	end

	local action, snippet = hs.dialog.textPrompt("New Snippet", "Enter Snippet Content", "", "OK", "Cancel")
	if action == "Cancel" then
		return
	end

	local snippets = loadSnippets()
	table.insert(snippets, { text = name, subText = snippet })
	saveSnippets(snippets)
	hs.alert.show("Snippet saved!")
end

local function showSnippetChooser()
	local snippets = loadSnippets()
	local chooser = hs.chooser.new(function(choice)
		if choice then
			hs.pasteboard.setContents(choice.subText)
			hs.alert.show("Snippet copied to clipboard")
		end
	end)
	chooser:choices(snippets)
	chooser:show()
end

hs.hotkey.bind(HYPER, "n", snippetPrompt)
hs.hotkey.bind(HYPER, "s", showSnippetChooser)
