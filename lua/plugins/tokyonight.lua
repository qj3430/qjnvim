return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      style = "night",
      on_highlights = function(hl, c)
        hl.LineNr = { fg = c.orange }
        hl.LineNrAbove = { fg = c.blue }
        hl.LineNrBelow = { fg = c.magenta }
        hl.Visual = { bg = '#4B6B88'}
      end
    })
    vim.cmd.colorscheme "tokyonight"
  end
}
