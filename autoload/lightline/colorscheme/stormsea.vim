let s:save_cpo = &cpo
set cpo&vim

" stormsea lightline theme (iceberg.vim/autoload/lightline/colorscheme style)
" Each color: [guifg, guibg, ctermfg, ctermbg]
function! s:build_palette() abort
  let p = {
        \ 'normal':   {},
        \ 'inactive': {},
        \ 'insert':   {},
        \ 'replace':  {},
        \ 'visual':   {},
        \ 'tabline':  {}}

  let col_base     = ['#A6B3BD', '#121621', 249, 233]
  let col_edge     = ['#121621', '#6B90AD', 233, 103]
  let col_gradient = ['#A6B3BD', '#232C40', 249, 236]
  let col_nc       = ['#707F8D', '#1A2030', 245, 235]
  let col_tabfill  = ['#707F8D', '#1A2030', 245, 235]
  let col_normal   = ['#121621', '#6B90AD', 233, 103]
  let col_error    = ['#121621', '#A45E63', 233, 131]
  let col_warning  = ['#121621', '#B5A778', 233, 144]
  let col_insert   = ['#121621', '#6F9187', 233, 108]
  let col_replace  = ['#121621', '#B17A63', 233, 137]
  let col_visual   = ['#121621', '#3B789B', 233, 67]
  let col_tabsel   = ['#121621', '#6B90AD', 233, 103]

  let p.normal.middle = [col_base]
  let p.normal.left = [col_normal, col_gradient]
  let p.normal.right = [col_edge, col_gradient]
  let p.normal.error = [col_error]
  let p.normal.warning = [col_warning]

  let p.insert.left = [col_insert, col_gradient]
  let p.replace.left = [col_replace, col_gradient]
  let p.visual.left = [col_visual, col_gradient]

  let p.inactive.middle = [col_nc]
  let p.inactive.left = [col_nc, col_nc]
  let p.inactive.right = [col_nc, col_nc]

  let p.tabline.middle = [col_tabfill]
  let p.tabline.left = [col_tabfill]
  let p.tabline.tabsel = [col_tabsel]
  let p.tabline.right = copy(p.normal.right)

  return p
endfunction

let g:lightline#colorscheme#stormsea#palette = s:build_palette()

let &cpo = s:save_cpo
unlet s:save_cpo
