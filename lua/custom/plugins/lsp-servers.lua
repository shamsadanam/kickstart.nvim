return {
  'neovim/nvim-lspconfig',
  opts = {
    servers = {
      vtsls = {
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                {
                  name = '@vue/typescript-plugin',
                  location = vim.fn.stdpath('data')
                    .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
                  languages = { 'vue' },
                  configNamespace = 'typescript',
                },
              },
            },
          },
        },
      },
      tailwindcss = {},
      emmet_ls = {},
      eslint = {},
    },
    install = {
      'tailwindcss-language-server',
      'vue-language-server',
      'emmet-language-server',
      'eslint-lsp',
    },
  },
}
