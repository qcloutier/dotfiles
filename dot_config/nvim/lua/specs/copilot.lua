return {
  {
    "github/copilot.vim",
    cmd = "Copilot",
    keys = {
      { "<Leader><Tab>", "<Cmd>Copilot<CR>", desc = "Copilot" },
    },
    event = { "BufReadPre", "BufNewFile" },
  },
}
