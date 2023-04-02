return {
  {
    "NvChad/nvim-colorizer.lua",
    init = function()
      vim.opt.termguicolors = true
    end,
    config = true,
    cmd = "ColorizerToggle",
    keys = {
      { "<Leader>cr", "<Cmd>ColorizerReloadAllBuffers<CR>", desc = "Reload colorizer" },
      { "<Leader>ct", "<Cmd>ColorizerToggle<CR>", desc = "Toggle colorizer" },
    },
  },
}
