return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {},
        zls = {},
        v_analyzer = {
          default_config = {
            filetypes = { "v" },
          }
        },
        rls = {},
        lua_ls = {},
      },
    },
  },
  {
    "kitagry/regols",
    default_config = {
      cmd = { 'regols' },
      filetypes = { 'rego' }
    }
  }
}
