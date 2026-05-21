return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = 'VeryLazy',
  init = function()
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  opts = {
    provider_selector = function(_, filetype, _)
      local ts_filetypes = {
        typescriptreact = true,
        javascriptreact = true,
        html = true,
        vue = true,
      }
      if ts_filetypes[filetype] then return { 'treesitter', 'indent' } end
      return { 'lsp', 'indent' }
    end,
    fold_virt_text_handler = function(virt_text, lnum, end_lnum, width, truncate)
      local new_virt_text = {}
      local first_line = vim.trim(vim.fn.getline(lnum))
      local line_count = end_lnum - lnum
      local suffix = ('   %d '):format(line_count)
      local suf_width = vim.fn.strdisplaywidth(suffix)
      local target_width = math.max(width - suf_width, 0)

      local open_tag = first_line:match '^<([%w:_%-]+)'
      local display_text = first_line
      if open_tag then display_text = '<' .. open_tag .. '>' end

      if display_text ~= '' then
        local text = truncate(display_text, target_width)
        table.insert(new_virt_text, { text, 'Folded' })
      else
        local cur_width = 0
        for _, chunk in ipairs(virt_text) do
          local chunk_text = chunk[1]
          local chunk_width = vim.fn.strdisplaywidth(chunk_text)
          if cur_width + chunk_width <= target_width then
            table.insert(new_virt_text, chunk)
            cur_width = cur_width + chunk_width
          else
            chunk_text = truncate(chunk_text, target_width - cur_width)
            table.insert(new_virt_text, { chunk_text, chunk[2] })
            cur_width = target_width
            break
          end
        end
      end

      local cur_width = 0
      for _, chunk in ipairs(new_virt_text) do
        cur_width = cur_width + vim.fn.strdisplaywidth(chunk[1])
      end
      if cur_width < target_width then suffix = (' '):rep(target_width - cur_width) .. suffix end
      table.insert(new_virt_text, { suffix, 'MoreMsg' })
      return new_virt_text
    end,
  },
}
