KEYS = { "g", "z", "o", "s", "d" }
APPS = {
    g = "com.mitchellh.ghostty",
    z = "app.zen-browser.zen",
    o = "md.obsidian",
    s = "com.tinyspeck.slackmacgap",
    d = "dev.zed.Zed",
}

local function activate(name)
    local apps = hs.application.applicationsForBundleID(name)
    local app = apps[1]
    app:activate()
end

for _, key in ipairs(KEYS) do
    hs.hotkey.bind(HYPER, key, function()
        activate(APPS[key])
    end)
end
