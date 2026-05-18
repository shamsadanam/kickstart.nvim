# AGENTS.md — Neovim Config (kickstart.nvim fork)

## First launch

```sh
nvim
```

`lazy.nvim` auto-installs on first run, then installs all plugins. No manual setup.

## Architecture

- **`init.lua`** — main entry point. Inline plugin specs for most plugins.
- **`lua/custom/init.lua`** — loaded early by `require("custom.init")` (called before lazy setup). Adds treesitter-based folding (`foldmethod=expr`) and forces `clipboard=unnamedplus`.
- **`lua/custom/plugins/`** — auto-imported by `{ import = 'custom.plugins' }` in init.lua. Currently contains `neo-tree.lua` and an empty `init.lua`. Add new plugin specs here.
- **`lua/kickstart/plugins/`** — optional plugins require'd individually in init.lua (debug, indent_line, lint, autopairs). Not auto-loaded.

## Plugin manager

- `lazy.nvim` at `~/.local/share/nvim/lazy/lazy.nvim`
- `:Lazy` — status, `:Lazy update` — update all
- `:Mason` — install/manage LSP servers, linters, formatters

## Formatting

- **stylua** for Lua formatting, CI-checked via GitHub Actions on PRs
- Config (`.stylua.toml`): 160 col width, single quotes, no parentheses, always collapse simple statements
- `:ConformInfo` — check formatter status
- `<leader>f` — format buffer, auto-format on save for whitelisted filetypes (none whitelisted by default)

## Keymaps (notable)

| Key | Action |
|-----|--------|
| `<space>` | Leader |
| `<Esc>` | Clear search highlight |
| `<C-h/j/k/l>` | Window navigation |
| `<leader>sh/sf/sg` | Telescope: help/files/grep |
| `grr/gri/grd/grt` | LSP: refs/impl/def/typedef |
| `grn` | LSP rename |
| `gra` | LSP code action |
| `<leader>f` | Format |
| `\` | Toggle NeoTree (right side) |
| `<leader>b` | Toggle debug breakpoint |
| `<F5>` | Start/continue debug |

## Notable config

- Leader is `<space>` (set before lazy.nvim loads)
- Nerd Font enabled (`vim.g.have_nerd_font = true`)
- Clipboard syncs with system (`unnamedplus`)
- Colorscheme: `tokyonight-night`
- Completions: `blink.cmp` (Lua fuzzy matcher, not Rust)
- Treesitter auto-installs missing parsers on file open

## Lockfile

- `lazy-lock.json` is **ignored** in this repo (upstream kickstart convention)
- Personal forks should **un-ignore** it (`lazy-lock.json` in `.gitignore` is commented; uncomment to track)

## Key files

| Path | Purpose |
|------|---------|
| `init.lua` | Entry point, most plugin config |
| `lua/custom/init.lua` | Folding + clipboard overrides |
| `lua/custom/plugins/neo-tree.lua` | NeoTree file explorer |
| `lua/kickstart/plugins/gitsigns.lua` | Gitsigns hunk keymaps |
| `lua/kickstart/plugins/debug.lua` | DAP debugger (Go) |
| `lua/kickstart/health.lua` | `:checkhealth` for kickstart |
| `.stylua.toml` | Lua formatter config |
