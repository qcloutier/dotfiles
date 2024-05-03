return {
  {
    "echasnovski/mini.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = function()
      local MiniBase16 = require("mini.base16")
      local MiniHipatterns = require("mini.hipatterns")
      local MiniMap = require("mini.map")

      return {
        base16 = {
          palette = MiniBase16.mini_palette("#000000", "#FFFFFF"),
          -- stylua: ignore
          use_cterm = {
            base00 = 0,  base08 = 1,
            base01 = 18, base09 = 16,
            base02 = 19, base0A = 3,
            base03 = 8,  base0B = 2,
            base04 = 20, base0C = 6,
            base05 = 7,  base0D = 4,
            base06 = 21, base0E = 5,
            base07 = 15, base0F = 17,
          },
        },
        hipatterns = {
          highlighters = {
            hex_color = MiniHipatterns.gen_highlighter.hex_color(),
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
      if vim.env.TERM == "xterm-kitty" and vim.fn.executable("kitten") == 1 then
        local s = vim.fn.system({ "kitten", "@", "get-colors" })
        if vim.v.shell_error == 0 then
          local m = {}
          for k, _, v in s:gmatch("(%S+)(%s+)(%S+)") do
            m[k] = v
          end
          -- stylua: ignore
          opts.base16.palette = {
            base00 = m.color0,  base08 = m.color1,
            base01 = m.color18, base09 = m.color16,
            base02 = m.color19, base0A = m.color3,
            base03 = m.color8,  base0B = m.color2,
            base04 = m.color20, base0C = m.color6,
            base05 = m.color7,  base0D = m.color4,
            base06 = m.color21, base0E = m.color5,
            base07 = m.color15, base0F = m.color17,
          }
          vim.opt.termguicolors = true
        end
      end

      require("mini.base16").setup(opts.base16)
      require("mini.bufremove").setup()
      require("mini.comment").setup()
      require("mini.completion").setup()
      require("mini.cursorword").setup()
      require("mini.hipatterns").setup(opts.hipatterns)
      require("mini.indentscope").setup()
      require("mini.map").setup(opts.map)
      require("mini.pairs").setup()
      require("mini.statusline").setup(opts.statusline)
      require("mini.surround").setup()
      require("mini.tabline").setup(opts.tabline)
      require("mini.trailspace").setup()

      vim.api.nvim_set_hl(0, "Comment", { fg = opts.base16.palette.base03, italic = true })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = opts.base16.palette.base00 })
    end,
    keys = {
      { "ZX", "<Cmd>lua MiniBufremove.delete()<CR>", desc = "Delete buffer" },
      { "Zx", "<Cmd>lua MiniBufremove.delete(0, true)<CR>", desc = "Force delete buffer" },
      { "<Leader>mt", "<Cmd>lua MiniMap.toggle()<CR>", desc = "Toggle the minimap" },
      { "<Leader>mm", "<Cmd>lua MiniMap.toggle_focus()<CR>", desc = "Focus the minimap" },
    },
  },
}
