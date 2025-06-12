hs.loadSpoon("ReloadConfiguration")
HYPER = { "cmd", "ctrl" }
HYPERWINDOW = { "cmd", "ctrl", "shift" }
HYPERCLIPBOARD = { "alt", "ctrl" }

require("apps")
require("vim")
require("texting")
require("window_movement")
require("clipboard")

spoon.ReloadConfiguration:start()
