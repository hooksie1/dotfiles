hs.loadSpoon("ReloadConfiguration")
HYPER = { "cmd", "ctrl" }
HYPERSHIFT = { "cmd", "ctrl", "shift" }
HYPEROPT = { "⌥", "ctrl" }

require("apps")
require("vim")
require("texting")
require("window_movement")
require("clipboard")
require("snippets")
require("window_menus")
require("window_selection")
require("spongebob")

spoon.ReloadConfiguration:start()
