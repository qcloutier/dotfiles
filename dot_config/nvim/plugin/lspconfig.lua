MiniDeps.later(function()
  MiniDeps.add({
    source = "neovim/nvim-lspconfig",
    checkout = "v2.1.0",
  })
  vim.lsp.enable({
    "gopls",
    "jdtls",
    "lua_ls",
    "pylsp",
    "terraformls",
    "ts_ls",
    "yamlls",
  })
  vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.INFO] = " ",
        [vim.diagnostic.severity.HINT] = " ",
      },
    },
  })
end)
