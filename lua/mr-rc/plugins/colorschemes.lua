return {
  -- "rebelot/kanagawa.nvim",
  "folke/tokyonight.nvim",
  lazy = false,
  config = function ()
    vim.cmd('colorscheme tokyonight-night')
    -- vim.cmd('colorscheme kanagawa')
  end,
  priority = 1000,
}
