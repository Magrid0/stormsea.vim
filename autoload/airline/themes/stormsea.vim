let s:save_cpo = &cpo
set cpo&vim

" stormsea airline theme (iceberg.vim/autoload/airline/themes/iceberg.vim style)
" Each color: [guifg, guibg, ctermfg, ctermbg]
function! s:build_palette() abort
  let col_base     = ['#C2D3DB', '#0A0E16', 252, 232]
  let col_edge     = ['#0A0E16', '#93BEDB', 232, 110]
  let col_gradient = ['#C2D3DB', '#1E2942', 252, 236]
  let col_nc       = ['#8D9FAE', '#131A29', 247, 234]
  let col_error    = ['#0A0E16', '#C9757E', 232, 174]
  let col_warning  = ['#0A0E16', '#D6C48D', 232, 186]
  let col_insert   = ['#0A0E16', '#8AB7A9', 232, 109]
  let col_replace  = ['#0A0E16', '#D09172', 232, 173]
  let col_visual   = ['#0A0E16', '#4E9CC7', 232, 74]

  let p = {}
  let p.inactive = airline#themes#generate_color_map(col_nc, col_nc, col_nc)
  let p.normal = airline#themes#generate_color_map(col_edge, col_gradient, col_base)
  let p.insert = airline#themes#generate_color_map(col_insert, col_gradient, col_base)
  let p.replace = airline#themes#generate_color_map(col_replace, col_gradient, col_base)
  let p.visual = airline#themes#generate_color_map(col_visual, col_gradient, col_base)
  let p.terminal = airline#themes#generate_color_map(col_insert, col_gradient, col_base)

  let p.accents = { 'red': ['#C9757E', '', 174, ''] }

  let p.inactive.airline_error = col_error
  let p.insert.airline_error = col_error
  let p.normal.airline_error = col_error
  let p.replace.airline_error = col_error
  let p.visual.airline_error = col_error

  let p.inactive.airline_warning = col_warning
  let p.insert.airline_warning = col_warning
  let p.normal.airline_warning = col_warning
  let p.replace.airline_warning = col_warning
  let p.visual.airline_warning = col_warning

  let p.normal.airline_term = col_base
  let p.terminal.airline_term = col_base
  let p.visual.airline_term = col_base

  return p
endfunction

let g:airline#themes#stormsea#palette = s:build_palette()

let &cpo = s:save_cpo
unlet s:save_cpo
