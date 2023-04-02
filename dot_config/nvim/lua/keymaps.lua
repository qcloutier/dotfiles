local map = vim.keymap.set
map("n", "<C-V>", '"+p', { desc = "Put from system clipboard" })
map("v", "<C-C>", '"+y', { desc = "Yank to system clipboard" })
map({ "i", "n", "v" }, "<C-S>", "<Cmd>write<CR>", { desc = "Write buffer" })
map({ "i", "n" }, "<C-L>", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })
map("n", "<Tab>", "<Cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })
map("t", "<Leader><Esc>", "<C-\\><C-N>", { desc = "Exit terminal mode" })
