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

  let col_base     = ['#D3E2E9', '#05080D', 254, 232]
  let col_edge     = ['#05080D', '#93BEDB', 232, 110]
  let col_gradient = ['#D3E2E9', '#182435', 254, 235]
  let col_nc       = ['#9DADB9', '#0D1420', 145, 233]
  let col_tabfill  = ['#9DADB9', '#0D1420', 145, 233]
  let col_normal   = ['#05080D', '#93BEDB', 232, 110]
  let col_error    = ['#05080D', '#C9757E', 232, 174]
  let col_warning  = ['#05080D', '#D6C48D', 232, 186]
  let col_insert   = ['#05080D', '#6FC3E8', 232, 81]
  let col_replace  = ['#05080D', '#D09172', 232, 173]
  let col_visual   = ['#05080D', '#4E9CC7', 232, 74]
  let col_tabsel   = ['#05080D', '#93BEDB', 232, 110]

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
