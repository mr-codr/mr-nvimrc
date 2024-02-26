return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  config = function ()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        component_separators = '',
        section_separators = '',
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {
          -- {
          --   'buffers',
          --   max_length = vim.o.columns,
          --   symbols = {
          --     alternate_file = '',
          --   }
          -- },
        },
        lualine_b = {
          -- {
          --   'buffers',
          --   max_length = vim.o.columns,
          --   symbols = {
          --     alternate_file = '',
          --   }
          -- },
        },
        lualine_c = {
          {
            'buffers',
            max_length = vim.o.columns,
            symbols = {
              alternate_file = '',
            }
          },
        },
        lualine_x = { },
        lualine_y = { },
        lualine_z = { },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }
  end
}
