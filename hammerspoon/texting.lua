local people = require("people")

local function sendMessage()
	local chooser = hs.chooser.new(function(chooser)
		if chooser == nil then
			hs.alert.show("Cancelled")
			return
		end

		local action, message =
			hs.dialog.textPrompt("Send an iMessage to " .. chooser.subText, "Message to send", "", "Send", "Cancel")

		if action == "Cancel" then
			return
		end

		hs.messages.iMessage(chooser.text, message)
	end)
	chooser:choices(people)
	chooser:show()
end

hs.hotkey.bind(HYPER, "s", sendMessage, nil, nil)
