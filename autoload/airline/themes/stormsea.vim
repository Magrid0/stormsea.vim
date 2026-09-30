let s:save_cpo = &cpo
set cpo&vim

" stormsea airline theme (iceberg.vim/autoload/airline/themes/iceberg.vim style)
" Each color: [guifg, guibg, ctermfg, ctermbg]
function! s:build_palette() abort
  let col_base     = ['#A6B3BD', '#121621', 249, 233]
  let col_edge     = ['#121621', '#6B90AD', 233, 103]
  let col_gradient = ['#A6B3BD', '#232C40', 249, 236]
  let col_nc       = ['#707F8D', '#1A2030', 245, 235]
  let col_error    = ['#121621', '#A45E63', 233, 131]
  let col_warning  = ['#121621', '#B5A778', 233, 144]
  let col_insert   = ['#121621', '#6F9187', 233, 108]
  let col_replace  = ['#121621', '#B17A63', 233, 137]
  let col_visual   = ['#121621', '#3B789B', 233, 67]

  let p = {}
  let p.inactive = airline#themes#generate_color_map(col_nc, col_nc, col_nc)
  let p.normal = airline#themes#generate_color_map(col_edge, col_gradient, col_base)
  let p.insert = airline#themes#generate_color_map(col_insert, col_gradient, col_base)
  let p.replace = airline#themes#generate_color_map(col_replace, col_gradient, col_base)
  let p.visual = airline#themes#generate_color_map(col_visual, col_gradient, col_base)
  let p.terminal = airline#themes#generate_color_map(col_insert, col_gradient, col_base)

  let p.accents = { 'red': ['#A45E63', '', 131, ''] }

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
