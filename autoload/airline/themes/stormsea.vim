let s:save_cpo = &cpo
set cpo&vim

" stormsea airline theme (iceberg.vim/autoload/airline/themes/iceberg.vim style)
" Each color: [guifg, guibg, ctermfg, ctermbg]
function! s:build_palette() abort
  let col_base     = ['#D3E2E9', '#05080D', 254, 232]
  let col_edge     = ['#05080D', '#93BEDB', 232, 110]
  let col_gradient = ['#D3E2E9', '#182435', 254, 235]
  let col_nc       = ['#9DADB9', '#0D1420', 145, 233]
  let col_error    = ['#05080D', '#C9757E', 232, 174]
  let col_warning  = ['#05080D', '#D6C48D', 232, 186]
  let col_insert   = ['#05080D', '#6FC3E8', 232, 81]
  let col_replace  = ['#05080D', '#D09172', 232, 173]
  let col_visual   = ['#05080D', '#4E9CC7', 232, 74]

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
