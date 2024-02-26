return {
  'echasnovski/mini.indentscope',
  version = '*',
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    local s = require('mini.indentscope');
    s.setup({
      draw = {
        delay = 0,
        animation = s.gen_animation.none(),
      },
      symbol = '▏',
    })
  end,
}
