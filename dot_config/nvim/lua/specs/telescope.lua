return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      defaults = {
        path_display = { "truncate" },
        prompt_prefix = "   ",
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
        },
        selection_strategy = "reset",
        sorting_strategy = "ascending",
      },
    },
    cmd = "Telescope",
    keys = {
      { "<Leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find files in workdir" },
      { "<Leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "Live grep in workdir" },
      { "<Leader>fh", "<Cmd>Telescope help_tags<CR>", desc = "Search help tags" },
    },
  },
}
