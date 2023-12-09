return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "muniftanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          visible = true,
        },
        use_libuv_file_watcher = true,
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.b.miniindentscope_disable = true
          end,
        },
        {
          event = "neo_tree_popup_buffer_enter",
          handler = function()
            vim.b.minicompletion_disable = true
          end,
        },
      },
    },
    cmd = "Neotree",
    keys = {
      { "<Leader>ef", "<Cmd>Neotree float<CR>", desc = "Show file browser float" },
      { "<Leader>et", "<Cmd>Neotree toggle left<CR>", desc = "Toggle file browser split" },
    },
  },
}
