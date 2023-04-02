return {
  {
    "akinsho/toggleterm.nvim",
    opts = {
      open_mapping = "<Leader>tt",
      shade_terminals = true,
    },
    cmd = "ToggleTerm",
    keys = {
      {
        "<Leader>tf",
        "<Cmd>exe v:count1 . 'ToggleTerm direction=float'<CR>",
        desc = "Toggle floating terminal",
      },
      {
        "<Leader>ts",
        "<Cmd>exe v:count1 . 'ToggleTerm direction=horizontal size=25'<CR>",
        desc = "Toggle horizontal terminal",
      },
      {
        "<Leader>tv",
        "<Cmd>exe v:count1 . 'ToggleTerm direction=vertical size=120'<CR>",
        desc = "Toggle vertical terminal",
      },
    },
  },
}
