-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
return {
  "L3MON4D3/LuaSnip",
  opts = {
    history = true,
    region_check_events = "InsertEnter",
    delete_check_events = "TextChanged",
  },
}
