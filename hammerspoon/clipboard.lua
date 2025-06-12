hs.loadSpoon("ClipboardTool")

spoon.ClipboardTool.show_copied_alert = false
spoon.ClipboardTool.paste_on_select = true
spoon.ClipboardTool.show_in_menubar = true
spoon.ClipboardTool.hist_size = 100
spoon.ClipboardTool.frequency = 0.8
spoon.ClipboardTool:bindHotkeys({
	toggle_clipboard = { HYPER, "c" },
})

spoon.ClipboardTool:start()
