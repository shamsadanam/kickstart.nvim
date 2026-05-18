# Adding an LSP server

Edit `lua/custom/plugins/lsp-servers.lua`, add two things:

1. Server config in the `servers` table
2. Mason package name in the `install` list

```lua
return {
  'neovim/nvim-lspconfig',
  opts = {
    servers = {
      -- existing servers...

      -- new server (config name from :help lspconfig)
      my_lsp = {
        settings = { ... },  -- optional
        filetypes = { ... }, -- optional (auto-detected by default)
      },
    },
    install = {
      -- existing packages...
      'my-lsp-mason-package-name',
    },
  },
}
```

Run `:Mason` to find package names, or `:help lspconfig` for config options. No `init.lua` changes needed.

# Adding a new plugin

Create a new file in `lua/custom/plugins/` (e.g., `my-plugin.lua`). It's auto-imported by lazy.nvim.

```lua
return {
  'username/repo',          -- required: GitHub repo
  event = 'VimEnter',       -- optional: when to load
  dependencies = { ... },   -- optional
  opts = { ... },           -- calls require('...').setup(opts)
  config = function(_, opts) -- optional: manual setup
    require('...').setup(opts)
    -- extra config, keymaps, etc.
  end,
}
```

Minimal example:
```lua
return { 'folke/todo-comments.nvim', event = 'VimEnter', opts = {} }
```

See `lua/custom/plugins/bufferline.lua` for a real example with keymaps.
