MiniDeps.later(function()
  MiniDeps.add({
    source = "nvim-treesitter/nvim-treesitter",
    checkout = "v0.10.0",
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
      "gotmpl",
      "gowork",
      "graphql",
      "hcl",
      "helm",
      "json5",
      "lua",
      "markdown",
      "markdown_inline",
      "query",
      "terraform",
      "vim",
      "vimdoc",
      "yaml",
    },
    highlight = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
    },
  })
  vim.filetype.add({
    extension = {
      gotmpl = "gotmpl",
    },
    pattern = {
      [".*/templates/.*%.tpl"] = "helm",
      [".*/templates/.*%.ya?ml"] = "helm",
      ["helmfile.*%.ya?ml"] = "helm",
    },
  })
end)
