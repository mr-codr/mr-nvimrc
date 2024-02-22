return {
  {
    'numToStr/Comment.nvim',
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    },
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    init = function ()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },
}
