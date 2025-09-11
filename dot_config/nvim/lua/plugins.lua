local mini_path = vim.fn.stdpath("data") .. "/site/pack/deps/start/mini.nvim"

if not vim.uv.fs_stat(mini_path) then
  vim.notify("Installing `mini.nvim`...")
  -- stylua: ignore
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/nvim-mini/mini.nvim", mini_path,
  })
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.notify("Installed `mini.nvim`")
end

require("mini.deps").setup()
