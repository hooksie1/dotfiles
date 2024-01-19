return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "shellcheck",
        "stylua",
        "gofumpt",
        "gopls",
        "golines",
        "black",
        "zls",
        "ansible-lint",
        "ansible-language-server",
        "html-lsp",
        "php-stan",
      })
    end,
  },
}
