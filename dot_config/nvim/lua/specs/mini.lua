return {
  {
    "echasnovski/mini.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    init = function()
      vim.opt.termguicolors = true
    end,
    opts = function()
      local MiniMap = require("mini.map")
      return {
        base16 = {
          use_cterm = true,
          -- stylua: ignore
          palette = {
            base00 = "#262626", base08 = "#F66151",
            base01 = "#303030", base09 = "#E66100",
            base02 = "#4F4F4F", base0A = "#FFA348",
            base03 = "#77767B", base0B = "#5BC8AF",
            base04 = "#B0AFAC", base0C = "#62A0EA",
            base05 = "#C0BFBC", base0D = "#7D8AC7",
            base06 = "#DEDDDA", base0E = "#DC8ADD",
            base07 = "#FCFCFC", base0F = "#CDAB8F",
          },
        },
        map = {
          integrations = {
            MiniMap.gen_integration.builtin_search(),
            MiniMap.gen_integration.diagnostic(),
            MiniMap.gen_integration.gitsigns(),
          },
          symbols = {
            encode = MiniMap.gen_encode_symbols.dot("4x2"),
          },
          window = {
            show_integration_count = false,
          },
        },
        statusline = { set_vim_settings = false },
        tabline = { tabpage_section = "right" },
      }
    end,
    config = function(_, opts)
      require("mini.base16").setup(opts.base16)
      require("mini.bufremove").setup()
      require("mini.comment").setup()
      require("mini.completion").setup()
      require("mini.cursorword").setup()
      require("mini.indentscope").setup()
      require("mini.map").setup(opts.map)
      require("mini.pairs").setup()
      require("mini.statusline").setup(opts.statusline)
      require("mini.surround").setup()
      require("mini.tabline").setup(opts.tabline)
      require("mini.trailspace").setup()

      vim.api.nvim_set_hl(0, "Comment", { fg = opts.base16.palette.base03, italic = true })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = opts.base16.palette.base00 })
      vim.api.nvim_set_hl(0, "MiniTablineFill", { bg = opts.base16.palette.base01 })
    end,
    keys = {
      { "ZX", "<Cmd>lua MiniBufremove.delete()<CR>", desc = "Delete buffer" },
      { "Zx", "<Cmd>lua MiniBufremove.delete(0, true)<CR>", desc = "Force delete buffer" },
      { "<Leader>mt", "<Cmd>lua MiniMap.toggle()<CR>", desc = "Toggle the minimap" },
      { "<Leader>mm", "<Cmd>lua MiniMap.toggle_focus()<CR>", desc = "Focus the minimap" },
    },
  },
}
