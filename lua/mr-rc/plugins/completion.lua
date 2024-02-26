return {
  "hrsh7th/nvim-cmp", -- completion engine
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-path',
    "L3MON4D3/LuaSnip", -- Snippets engine
  },
  config = function ()
    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip/loaders/from_vscode").lazy_load()

    local cmp = require('cmp');
    cmp.setup {
      completion = {
        completeopt = 'menu,menuone,preview,noselect',
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-1),
        ['<C-f>'] = cmp.mapping.scroll_docs(1),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),

      formatting = {
        fields = { "abbr", "kind" },
        -- format = function(_, vim_item)
        --   vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        --   return vim_item
        -- end
      },

      sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = 'path' },
      },

      window = {
        documentation = cmp.config.window.bordered(),
      },
    }
  end

}
