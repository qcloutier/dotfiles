if vim.fn.has("nvim-0.11") ~= 1 then
  vim.notify("Neovim is out-of-date; skipping config load", vim.log.levels.WARN)
  return
end

require("autocmds")
require("keymaps")
require("options")
require("plugins")
