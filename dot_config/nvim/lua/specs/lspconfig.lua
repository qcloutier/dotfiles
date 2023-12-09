return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "onsails/lspkind.nvim",
    },
    opts = {
      servers = {
        gopls = {},
        jdtls = {},
        pylsp = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
            },
          },
        },
        terraformls = {},
        tsserver = {},
      },
      mappings = {
        global = {
          { "[d", vim.diagnostic.goto_prev, desc = "Move to previous diagnostic" },
          { "]d", vim.diagnostic.goto_next, desc = "Move to next diagnostic" },
          { "<space>e", vim.diagnostic.open_float, desc = "Show diagnostics in a floating window" },
          { "<space>q", vim.diagnostic.setloclist, desc = "Add diagnostics to the location list" },
        },
        buffer = {
          { "gd", vim.lsp.buf.definition, desc = "Jump to definition" },
          { "gD", vim.lsp.buf.declaration, desc = "Jump to declaration" },
          { "gi", vim.lsp.buf.implementation, desc = "List implementations" },
          { "gr", vim.lsp.buf.references, desc = "List references" },
          { "K", vim.lsp.buf.hover, desc = "View information" },
          { "<C-K>", vim.lsp.buf.signature_help, desc = "Show signature help" },
          { "<Space>ca", vim.lsp.buf.code_action, desc = "Select a code action" },
          { "<Space>f", vim.lsp.buf.format, desc = "Format current buffer" },
          { "<Space>rn", vim.lsp.buf.rename, desc = "Rename all references" },
          { "<Space>D", vim.lsp.buf.type_definition, desc = "Jump to type definition" },
          { "<Space>wa", vim.lsp.buf.add_workspace_folder, desc = "Add workspace folder" },
          { "<Space>wr", vim.lsp.buf.remove_workspace_folder, desc = "Remove workspace folder" },
          {
            "<Space>wl",
            function()
              print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            desc = "List workspace folders",
          },
        },
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for k, v in pairs(opts.servers) do
        lspconfig[k].setup(v)
      end
      for _, v in pairs(opts.mappings.global) do
        vim.keymap.set("n", v[1], v[2], { desc = v.desc })
      end
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          for _, v in pairs(opts.mappings.buffer) do
            vim.keymap.set("n", v[1], v[2], { desc = v.desc, buffer = ev.buf })
          end
        end,
        desc = "Set buffer-local mappings for the LSP client",
      })
      require("lspkind").init()
      for type, icon in pairs({ Error = "󰅚 ", Warn = "󰀪 ", Info = "󰋽 ", Hint = "󰌶" }) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
    end,
    event = { "BufReadPre", "BufNewFile" },
  },
}
