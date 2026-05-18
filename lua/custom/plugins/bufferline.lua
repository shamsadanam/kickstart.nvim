return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  init = function()
    -- Force Neovim to always show the top tabline space
    vim.opt.termguicolors = true
    vim.opt.showtabline = 2
  end,
  opts = {
    options = {
      mode = 'buffers',
      always_show_bufferline = true,
    },
  },
  config = function(_, opts)
    require('bufferline').setup(opts)

    -- Navigation
    vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next Tab' })
    vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous Tab' })

    -- Creating & Closing Tabs
    vim.keymap.set('n', '<leader>tn', '<Cmd>enew<CR>', { desc = 'New Empty Tab' })
    -- Close current tab cleanly using native Neovim command
    vim.keymap.set('n', '<leader>tc', '<Cmd>bdelete<CR>', { desc = 'Close Current Tab' })

    -- Force close current tab (discards unsaved changes)
    vim.keymap.set('n', '<leader>tC', '<Cmd>bdelete!<CR>', { desc = 'Force Close Current Tab' })
    -- Advanced Tab Cleanup
    vim.keymap.set('n', '<leader>to', '<Cmd>BufferLineCloseOthers<CR>', { desc = 'Close All Other Tabs' })
    vim.keymap.set('n', '<leader>tl', '<Cmd>BufferLineCloseRight<CR>', { desc = 'Close All Tabs to the Right' })
    vim.keymap.set('n', '<leader>th', '<Cmd>BufferLineCloseLeft<CR>', { desc = 'Close All Tabs to the Left' })

    -- Quick Pinning (keeps important files at the front)
    vim.keymap.set('n', '<leader>tp', '<Cmd>BufferLineTogglePin<CR>', { desc = 'Toggle Pin Tab' })
  end,
}
