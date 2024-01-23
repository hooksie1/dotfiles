return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>/", false },
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find Plugin File",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
      end,
      desc = "grep files",
    },
  },
}
