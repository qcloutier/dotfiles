if vim.env.TERM ~= "xterm-kitty" or vim.fn.executable("kitten") ~= 1 then
  vim.notify("kitty is required; skipping theme load", vim.log.levels.WARN)
  return
end

local s = vim.fn.system({ "kitten", "@", "get-colors" })
if vim.v.shell_error ~= 0 then
  vim.notify("kitten: " .. s, vim.log.levels.ERROR)
  return
end

local m = {}
for k, _, v in s:gmatch("(%S+)(%s+)(%S+)") do
  m[k] = v
end

require("mini.base16").setup({
  -- stylua: ignore
  palette = {
    base00 = m.color0,  base08 = m.color1,
    base01 = m.color18, base09 = m.color16,
    base02 = m.color19, base0A = m.color3,
    base03 = m.color8,  base0B = m.color2,
    base04 = m.color20, base0C = m.color6,
    base05 = m.color7,  base0D = m.color4,
    base06 = m.color21, base0E = m.color5,
    base07 = m.color15, base0F = m.color17,
  },
})

vim.api.nvim_set_hl(0, "Comment", { fg = m.color8, italic = true })
