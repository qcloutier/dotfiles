return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns
        local bmap = function(opts)
          vim.keymap.set(opts.mode or "n", opts[1], opts[2], { buffer = buffer, desc = opts.desc })
        end
        bmap({ "]h", gs.next_hunk, desc = "Next hunk" })
        bmap({ "[h", gs.prev_hunk, desc = "Previous hunk" })
        bmap({ "<Leader>gs", gs.stage_hunk, desc = "Stage hunk", mode = { "n", "v" } })
        bmap({ "<Leader>gr", gs.reset_hunk, desc = "Reset hunk", mode = { "n", "v" } })
        bmap({ "<Leader>gS", gs.stage_buffer, desc = "Stage buffer" })
        bmap({ "<Leader>gR", gs.reset_buffer, desc = "Reset buffer" })
        bmap({ "<Leader>gu", gs.undo_stage_hunk, desc = "Undo stage hunk" })
        bmap({ "<Leader>gp", gs.preview_hunk, desc = "Preview hunk" })
        bmap({ "<Leader>gb", gs.blame_line, desc = "Blame line" })
        bmap({ "<Leader>gd", gs.diffthis, desc = "Diff this" })
      end,
    },
    event = { "BufReadPre", "BufNewFile" },
  },
}
