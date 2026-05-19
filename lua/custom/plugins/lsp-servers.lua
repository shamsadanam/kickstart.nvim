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

      -- PHP
      intelephense = {
        settings = {
          intelephense = {
            files = { maxSize = 5000000 },
            diagnostics = { enable = true },
          },
        },
      },

      -- SQL
      sqlls = {},

      tailwindcss = {},
      emmet_ls = {},
      eslint = {},
      cssls = {},
      vue_ls = {},
    },
    install = {
      -- LSP servers
      'intelephense',
      'sqlls',
      'tailwindcss-language-server',
      'vue-language-server',
      'emmet-language-server',
      'eslint-lsp',
      'prettier',
      'prettierd',
      'css-lsp',
    },
  },
}
