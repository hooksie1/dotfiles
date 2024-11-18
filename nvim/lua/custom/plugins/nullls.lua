return {
  {
    'nvimtools/none-ls.nvim',
    opts = function()
      local nls = require 'null-ls'
      return {
        sources = {
          nls.builtins.formatting.goimports,
          nls.builtins.diagnostics.regal,
        },
      }
    end,
  },
}
