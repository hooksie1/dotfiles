hs.loadSpoon("ReloadConfiguration")
HYPER = { "cmd", "ctrl" }
HYPERSHIFT = { "cmd", "ctrl", "shift" }
HYPERCLIPBOARD = { "alt", "ctrl" }

require("apps")
require("vim")
require("texting")
require("window_movement")
require("clipboard")
require("snippets")
require("window_menus")

spoon.ReloadConfiguration:start()
