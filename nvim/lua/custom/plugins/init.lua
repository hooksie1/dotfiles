-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      auto_open = true,
    },
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function()
      local nls = require 'null-ls'
      return {
        sources = {
          nls.builtins.formatting.goimports,
        },
      }
    end,
  },
  { 'wakatime/vim-wakatime', lazy = false },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = [[<C-t>]],
      start_in_insert = true,
      size = 40,
      hidden = true,
      persist_mode = true,
      direction = 'float',
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        event_handlers = {
          {
            event = 'file_opened',
            handler = function(file_path)
              require('neo-tree.command').execute { action = 'close' }
            end,
          },
        },
      }
    end,
  },
}
