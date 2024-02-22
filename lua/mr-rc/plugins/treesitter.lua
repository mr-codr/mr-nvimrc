return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "lua",
        "angular",
        "html",
        "css",
        "scss",
        "typescript",
        "javascript",
        "json",
        -- "yaml",
        "xml",
        "csv",
        "dockerfile",
        "gitignore",
        "markdown"
      },
      sync_install = false,
      ignore_install = { "" }, -- List of parsers to ignore installing
      autopairs = { enable = true },
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      }
    }
  end
}
