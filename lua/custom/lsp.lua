-- Register Vue and TypeScript LSP servers after plugins load
vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('CustomLspServers', { clear = true }),
  callback = function()
    local vue_plugin_path = vim.fn.stdpath('data')
      .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'
    vim.lsp.config('vtsls', {
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              {
                name = '@vue/typescript-plugin',
                location = vue_plugin_path,
                languages = { 'vue' },
                configNamespace = 'typescript',
              },
            },
          },
        },
      },
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    })
    vim.lsp.enable('vtsls')
    vim.lsp.config('vue_ls', {})
    vim.lsp.enable('vue_ls')
  end,
})
