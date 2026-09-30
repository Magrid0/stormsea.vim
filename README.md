# stormsea.vim

A Vim colorscheme inspired by dark Atlantic water, cold steel-blue sky, and
sea-foam highlights. Dark-only, with `termguicolors` + 256-color terminal
support and airline/lightline themes.

## Install

With your existing dead-simple manager (`~/.vim/plugins.vim`):

```vim
call s:ensure('magrid0/stormsea.vim')
```

Or with vim-plug:

```vim
Plug 'magrid0/stormsea.vim'
```

## Usage

```vim
set termguicolors
set background=dark
colorscheme stormsea
```

For airline:

```vim
let g:airline_theme = 'stormsea'
```

For lightline:

```vim
let g:lightline = { 'colorscheme': 'stormsea' }
```

## Options

Set before `:colorscheme stormsea`:

```vim
let g:stormsea_transparent_background = 1  " default 0
let g:stormsea_italic_comment = 0          " default 1
```

## Compatibility

- Vim 7.0+ / Neovim
- GUI, `termguicolors`, and 256-color terminals (each highlight sets
  `guifg/guibg` and `ctermfg/ctermbg`)
- `g:terminal_ansi_colors` (Vim) and `g:terminal_color_*` (Neovim)
- airline + lightline themes included
- LSP diagnostics, GitGutter/Signify/GitSigns, ALE, CoC, nvim-cmp,
  Tree-sitter `TS*` and Neovim 0.8+ `@*` captures
