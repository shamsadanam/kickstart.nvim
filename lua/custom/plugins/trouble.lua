return {
  'folke/trouble.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  cmd = 'Trouble',
  opts = {
    focus = false,
  },
  keys = {
    { '<leader>xx', '<cmd>Trouble diagnostics toggle<CR>', desc = 'Diagnostics (Trouble)' },
    { '<leader>xw', '<cmd>Trouble diagnostics toggle focus=true filter.buf=0<CR>', desc = 'Buffer Diagnostics (Trouble)' },
    { '<leader>xs', '<cmd>Trouble symbols toggle<CR>', desc = 'Symbols (Trouble)' },
    { '<leader>xl', '<cmd>Trouble loclist toggle<CR>', desc = 'Location List (Trouble)' },
    { '<leader>xq', '<cmd>Trouble qflist toggle<CR>', desc = 'Quickfix List (Trouble)' },
  },
}
