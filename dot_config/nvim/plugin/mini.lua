local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

add({
  source = "nvim-mini/mini.nvim",
  checkout = "v0.16.0",
})

now(function()
  vim.cmd("colorscheme base16")
end)

now(function()
  require("mini.icons").setup()
  later(MiniIcons.mock_nvim_web_devicons)
  later(MiniIcons.tweak_lsp_kind)
end)

now(function()
  require("mini.notify").setup()
  vim.notify = MiniNotify.make_notify()
end)

now(function()
  require("mini.statusline").setup()
end)

now(function()
  require("mini.tabline").setup({
    tabpage_section = "right",
  })
end)

later(function()
  require("mini.bufremove").setup()
end)

later(function()
  local miniclue = require("mini.clue")
  miniclue.setup({
    clues = {
      { mode = "n", keys = "<Leader>e", desc = "+Explore" },
      { mode = "n", keys = "<Leader>f", desc = "+Find" },
      { mode = "n", keys = "<Leader>g", desc = "+Git" },
      { mode = "n", keys = "<Leader>m", desc = "+Map" },
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.windows(),
      miniclue.gen_clues.z(),
    },
    triggers = {
      { mode = "n", keys = "<Leader>" },
      { mode = "x", keys = "<Leader>" },
      { mode = "i", keys = "<C-x>" },
      { mode = "n", keys = "g" },
      { mode = "x", keys = "g" },
      { mode = "n", keys = "'" },
      { mode = "n", keys = "`" },
      { mode = "x", keys = "'" },
      { mode = "x", keys = "`" },
      { mode = "n", keys = '"' },
      { mode = "x", keys = '"' },
      { mode = "i", keys = "<C-r>" },
      { mode = "c", keys = "<C-r>" },
      { mode = "n", keys = "<C-w>" },
      { mode = "n", keys = "z" },
      { mode = "x", keys = "z" },
    },
  })
end)

later(function()
  require("mini.completion").setup()
end)

later(function()
  require("mini.cursorword").setup()
end)

later(function()
  require("mini.diff").setup({
    view = {
      style = "sign",
      signs = {
        add = "┃",
        change = "┃",
        delete = "_",
      },
    },
  })
end)

later(function()
  require("mini.extra").setup()
end)

later(function()
  require("mini.git").setup()
end)

later(function()
  local hipatterns = require("mini.hipatterns")
  hipatterns.setup({
    highlighters = {
      fixme = {
        pattern = "FIXME",
        group = "MiniHipatternsFixme",
      },
      hack = {
        pattern = "HACK",
        group = "MiniHipatternsHack",
      },
      todo = {
        pattern = "TODO",
        group = "MiniHipatternsTodo",
      },
      note = {
        pattern = "NOTE",
        group = "MiniHipatternsNote",
      },
      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })
end)

later(function()
  local indentscope = require("mini.indentscope")
  indentscope.setup({
    draw = {
      animation = indentscope.gen_animation.none(),
    },
    options = {
      try_as_border = true,
    },
    symbol = "┆",
  })
end)

later(function()
  local minimap = require("mini.map")
  minimap.setup({
    integrations = {
      minimap.gen_integration.builtin_search(),
      minimap.gen_integration.diagnostic(),
      minimap.gen_integration.diff(),
    },
    symbols = {
      encode = minimap.gen_encode_symbols.dot("4x2"),
    },
    window = {
      show_integration_count = false,
    },
  })
end)

later(function()
  require("mini.pairs").setup()
end)

later(function()
  local paste = vim.paste
  require("mini.pick").setup()
  vim.paste = function(...)
    if MiniPick.is_picker_active() then
      return vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-r>+", true, true, true), "n", true)
    end
    return paste(...)
  end
end)

later(function()
  require("mini.surround").setup()
end)

later(function()
  require("mini.trailspace").setup()
end)
