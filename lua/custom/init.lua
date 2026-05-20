-- ensure UTF-8 encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldenable = true
vim.opt.foldlevel = 99 -- Start with all folds open
vim.opt.foldlevelstart = 99

-- enable clipboard
vim.opt.clipboard = 'unnamedplus'

-- My Keymaps
-- In Normal Mode: Backspace deletes 1 character to the left (like _X)
vim.keymap.set('n', '<BS>', '"_X', { desc = 'Backspace character left without yanking' })

-- In Visual Mode: Backspace deletes whatever text you selected (like _d)
vim.keymap.set('x', '<BS>', '"_d', { desc = 'Delete selection without yanking' })

-- In Normal Mode: Double-tap Backspace to delete the whole line (like _dd)
-- vim.keymap.set('n', '<BS><BS>', '"_dd', { desc = "Double backspace deletes whole line without yanking" })

-- Laravel Blade templates
vim.filetype.add {
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
}

-- Blade parser is configured in nvim-treesitter (init.lua).

local function laravel_goto_view()
  local line = vim.api.nvim_get_current_line()

  -- Match: view('a.b.c') or view("a.b.c") on the current line.
  local view = line:match([[view%s*%(%s*'([^']+)']]) or line:match([[view%s*%(%s*"([^"]+)"]])
  if not view then
    vim.notify("No view('...') found on this line", vim.log.levels.WARN)
    return
  end

  -- Find project root (prefer Laravel's artisan).
  local root_file = vim.fs.find({ 'artisan', 'composer.json', '.git' }, { upward = true })[1]
  local root_dir = root_file and vim.fs.dirname(root_file) or vim.fn.getcwd()

  local rel = 'resources/views/' .. view:gsub('%.', '/') .. '.blade.php'
  local full = root_dir .. '/' .. rel

  if vim.fn.filereadable(full) == 0 then
    vim.notify('View not found: ' .. rel, vim.log.levels.WARN)
    return
  end

  vim.cmd('edit ' .. vim.fn.fnameescape(full))
end

vim.keymap.set('n', 'grv', laravel_goto_view, { desc = 'Laravel: Go to view()' })

-- Use Blade-aware navigation for Livewire/component tags in Blade files.
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'blade',
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    vim.keymap.set('n', 'grd', 'gf', vim.tbl_extend('force', opts, { desc = 'Blade: Go to definition target' }))
    vim.keymap.set('n', 'gri', 'gf', vim.tbl_extend('force', opts, { desc = 'Blade: Go to implementation target' }))
  end,
})

-- Blade comment style for Comment.nvim (gc/gcc)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'blade',
  callback = function() vim.bo.commentstring = '{{-- %s --}}' end,
})
