return {
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")
      wk.setup()
      wk.register({
        c = { name = "colorizer" },
        e = { name = "neotree" },
        f = { name = "telescope" },
        g = { name = "gitsigns" },
        m = { name = "minimap" },
        t = { name = "toggleterm" },
      }, { prefix = "<Leader>" })
    end,
  },
}
