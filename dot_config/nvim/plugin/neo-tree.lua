MiniDeps.later(function()
  MiniDeps.add({
    source = "nvim-neo-tree/neo-tree.nvim",
    checkout = "3.35",
    depends = {
      {
        source = "muniftanjim/nui.nvim",
        checkout = "0.4.0",
      },
      {
        source = "nvim-lua/plenary.nvim",
      },
    },
  })
  require("neo-tree").setup({
    close_if_last_window = true,
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
    default_component_configs = {
      diagnostics = {
        highlights = {
          hint = "DiagnosticHint",
          info = "DiagnosticInfo",
          warn = "DiagnosticWarn",
          error = "DiagnosticError",
        },
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
      },
      use_libuv_file_watcher = true,
    },
  })
end)
