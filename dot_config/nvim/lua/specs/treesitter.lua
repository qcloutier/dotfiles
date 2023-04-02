return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- stylua: ignore
      ensure_installed = {
        "bash", "c", "css", "dockerfile", "fish", "go",
        "gomod", "graphql", "hcl", "help", "html", "ini",
        "java", "javascript", "json", "json5", "lua", "make",
        "markdown", "proto", "python", "query", "terraform",
        "toml", "tsx", "typescript", "vim", "yaml",
      },
      highlight = { enable = true },
      incremental_selection = { enable = true },
      indent = { enable = true },
    },
    main = "nvim-treesitter.configs",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    event = { "BufReadPost", "BufNewFile" },
  },
}
