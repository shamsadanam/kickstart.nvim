-- enable basic folding

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldenable = true
vim.opt.foldlevel = 99 -- Start with all folds open
vim.opt.foldlevelstart = 99

-- enable clipboard
vim.opt.clipboard = 'unnamedplus'

-- My Keymaps
-- In Normal Mode: Backspace deletes 1 character to the left (like _X)
vim.keymap.set('n', '<BS>', '"_X', { desc = "Backspace character left without yanking" })

-- In Visual Mode: Backspace deletes whatever text you selected (like _d)
vim.keymap.set('x', '<BS>', '"_d', { desc = "Delete selection without yanking" })

-- In Normal Mode: Double-tap Backspace to delete the whole line (like _dd)
-- vim.keymap.set('n', '<BS><BS>', '"_dd', { desc = "Double backspace deletes whole line without yanking" })


