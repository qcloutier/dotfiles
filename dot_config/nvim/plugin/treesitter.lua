MiniDeps.later(function()
  MiniDeps.add({
    source = "nvim-treesitter/nvim-treesitter",
    checkout = "v0.9.3",
    hooks = {
      post_checkout = function()
        require("nvim-treesitter.install").update({
          with_sync = true,
        })
      end,
    },
  })
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "c",
      "go",
      "gomod",
      "gosum",
      "gowork",
      "graphql",
      "hcl",
      "json5",
      "lua",
      "markdown",
      "markdown_inline",
      "query",
      "terraform",
      "vim",
      "vimdoc",
    },
    highlight = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
    },
  })
end)
