return {
  {
    'tpope/vim-dadbod',
    cmd = { 'DB', 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = { 'tpope/vim-dadbod' },
    cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },
    keys = {
      { '<leader>Du', '<Cmd>DBUIToggle<CR>', desc = 'DB UI Toggle' },
      { '<leader>Df', '<Cmd>DBUIFindBuffer<CR>', desc = 'DB UI Find Buffer' },
      { '<leader>Da', '<Cmd>DBUIAddConnection<CR>', desc = 'DB UI Add Connection' },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
}
