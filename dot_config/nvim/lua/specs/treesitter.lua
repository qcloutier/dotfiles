return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- stylua: ignore
      ensure_installed = {
        "c", "lua", "query", "vim", "vimdoc",
        "go", "gomod", "gosum", "gowork",
        "graphql", "hcl", "json5", "terraform",
      },
      highlight = { enable = true },
      incremental_selection = { enable = true },
    },
    main = "nvim-treesitter.configs",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    event = { "BufReadPost", "BufNewFile" },
  },
}
