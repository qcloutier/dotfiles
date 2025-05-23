vim.keymap.set({ "n", "v" }, "<C-C>", '"+y', {
  desc = "Yank to system clipboard",
})
vim.keymap.set("n", "<C-V>", '"+p', {
  desc = "Put from system clipboard",
})
vim.keymap.set("n", "ZX", "<Cmd>lua MiniBufremove.delete()<CR>", {
  desc = "Delete buffer",
})
vim.keymap.set("n", "d<Space>", "<Cmd>lua MiniTrailspace.trim()<CR>", {
  desc = "Trim trailing whitespace",
})

vim.keymap.set("t", "<Leader><Esc>", "<C-\\><C-N>", {
  desc = "Exit terminal mode",
})
vim.keymap.set("n", "<Leader>et", "<Cmd>Neotree toggle left<CR>", {
  desc = "Toggle file browser split",
})
vim.keymap.set("n", "<Leader>f=", "<Cmd>Pick spellsuggest<CR>", {
  desc = "Show spelling suggestions",
})
vim.keymap.set("n", "<Leader>ff", "<Cmd>Pick files<CR>", {
  desc = "Find files in workdir",
})
vim.keymap.set("n", "<Leader>fg", "<Cmd>Pick grep_live<CR>", {
  desc = "Live grep in workdir",
})
vim.keymap.set("n", "<Leader>gK", "<Cmd>lua MiniGit.show_at_cursor()<CR>", {
  desc = "Git data at cursor",
})
vim.keymap.set("n", "<Leader>mf", "<Cmd>lua MiniMap.toggle_focus()<CR>", {
  desc = "Focus the minimap",
})
vim.keymap.set("n", "<Leader>mt", "<Cmd>lua MiniMap.toggle()<CR>", {
  desc = "Toggle the minimap",
})
