return {
  {
    "folke/which-key.nvim",
    opts = {
      delay = function(ctx)
        return ctx.plugin and 0 or 1000
      end,
      spec = {
        { "<Leader>e", group = "neotree" },
        { "<Leader>f", group = "telescope" },
        { "<Leader>g", group = "gitsigns" },
        { "<Leader>m", group = "minimap" },
        { "<Leader>t", group = "toggleterm" },
      },
    },
  },
}
