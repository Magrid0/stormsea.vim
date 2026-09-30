" stormsea.vim
" A Vim colorscheme inspired by dark Atlantic water, cold steel-blue sky,
" sea-foam highlights.
"
" Compatible with: Vim 7.0+ / Neovim, gui + termguicolors + 256-color
" terminals, airline, lightline.
"
" Usage:
"   set termguicolors
"   colorscheme stormsea
"
" Options (set before :colorscheme):
"   let g:stormsea_transparent_background = 1  " default 0
"   let g:stormsea_italic_comment = 0          " default 1

" ── Guard ────────────────────────────────────────────────────────────────
" Like iceberg.vim/colors/iceberg.vim:14 and gruvbox/colors/gruvbox.vim:21,
" bail out early on terminals that cannot show the palette.
if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'stormsea'
set background=dark

let s:transparent = get(g:, 'stormsea_transparent_background', 0)
let s:italic_comment = get(g:, 'stormsea_italic_comment', 1) ? 'italic' : 'NONE'

" ── Palette: [guicolors, 256-color] ──────────────────────────────────────
" cterm values are hand-picked 256-color approximations so the scheme works
" with and without 'termguicolors' (iceberg/gruvbox style).
let s:none   = ['NONE', 'NONE']
let s:bg0    = ['#05080D', 232] " abyssal water
let s:bg1    = ['#0D1420', 233] " dark water
let s:bg2    = ['#182435', 235] " wave shadow
let s:bg3    = ['#2C405F', 238] " blue-black
let s:fg0    = ['#D3E2E9', 254] " weathered steel
let s:fg1    = ['#E2EDF2', 255] " sea foam
let s:muted  = ['#9DADB9', 145] " distant haze
let s:blue   = ['#2A5D86', 24]  " deep ocean blue
let s:blue2  = ['#4E9CC7', 74]  " wave blue
let s:cyan   = ['#41A9CC', 38]  " cold surf
let s:cyan2  = ['#93BEDB', 110] " mist-lit blue
let s:azure  = ['#6FC3E8', 81]  " wave-crest azure
let s:foam   = ['#D8E9F0', 195] " crest foam
let s:white  = ['#F0F6F9', 255] " brightest cloud
let s:red    = ['#C9757E', 174] " muted storm red
let s:orange = ['#D09172', 173] " rock/warm accent
let s:yellow = ['#D6C48D', 186] " subdued sand
let s:purple = ['#9CA1C6', 146] " cloud-shadow violet

" ── Highlight helper (tokyonight/gruvbox style) ──────────────────────────
" call s:H(group, fg, bg [, attr [, guisp]])
function! s:H(group, fg, bg, ...) abort
  let l:attr = a:0 >= 1 ? a:1 : 'NONE'
  " tmux cannot do undercurl reliably; fall back like tokyonight
  if l:attr ==# 'undercurl' && executable('tmux') && $TMUX !=# ''
    let l:attr = 'underline'
  endif
  let l:cmd = ['hi', a:group,
        \ 'guifg=' . a:fg[0], 'ctermfg=' . a:fg[1],
        \ 'guibg=' . a:bg[0], 'ctermbg=' . a:bg[1],
        \ 'gui=' . l:attr, 'cterm=' . l:attr, 'term=NONE']
  if l:attr =~# 'underline\|undercurl'
    call add(l:cmd, 'term=' . l:attr)
  endif
  if a:0 >= 2
    call add(l:cmd, 'guisp=' . a:2[0])
  endif
  execute join(l:cmd, ' ')
endfunction

" ── Editor UI ────────────────────────────────────────────────────────────
if s:transparent
  call s:H('Normal', s:fg0, s:none)
  call s:H('NormalFloat', s:fg0, s:bg1)
  call s:H('SignColumn', s:muted, s:none)
  call s:H('FoldColumn', s:muted, s:none)
  call s:H('LineNr', s:muted, s:none)
else
  call s:H('Normal', s:fg0, s:bg0)
  call s:H('NormalFloat', s:fg0, s:bg1)
  call s:H('SignColumn', s:muted, s:bg0)
  call s:H('FoldColumn', s:muted, s:bg0)
  call s:H('LineNr', s:muted, s:bg0)
endif
call s:H('EndOfBuffer', s:bg3, s:none)
call s:H('Terminal', s:fg0, s:bg0)
call s:H('Cursor', s:bg0, s:foam)
hi! link lCursor Cursor
hi! link vCursor Cursor
hi! link iCursor Cursor
hi! link CursorIM Cursor
hi! link TermCursor Cursor
call s:H('TermCursorNC', s:bg0, s:muted)
call s:H('CursorLine', s:none, s:bg1)
hi! link CursorColumn CursorLine
call s:H('ColorColumn', s:none, s:bg2)
call s:H('CursorLineNr', s:foam, s:bg1, 'bold')
call s:H('Folded', s:cyan2, s:bg2)
call s:H('VertSplit', s:bg3, s:bg0)
hi! link WinSeparator VertSplit
call s:H('StatusLine', s:fg1, s:bg3, 'bold')
call s:H('StatusLineNC', s:muted, s:bg1)
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
call s:H('TabLine', s:muted, s:bg1)
call s:H('TabLineFill', s:bg1, s:bg1)
call s:H('TabLineSel', s:white, s:blue, 'bold')
hi! link ToolbarLine TabLineFill
hi! link ToolbarButton TabLineSel
call s:H('Pmenu', s:fg0, s:bg2)
call s:H('PmenuSel', s:white, s:blue)
call s:H('PmenuSbar', s:none, s:bg3)
call s:H('PmenuThumb', s:none, s:blue2)
hi! link PopupSelected PmenuSel
call s:H('WildMenu', s:white, s:blue)
call s:H('Search', s:bg0, s:cyan2)
call s:H('IncSearch', s:bg0, s:foam)
hi! link CurSearch IncSearch
call s:H('Substitute', s:bg0, s:yellow)
call s:H('Visual', s:white, s:blue)
hi! link VisualNOS Visual
call s:H('MatchParen', s:foam, s:bg3, 'bold')
call s:H('NonText', s:bg3, s:none)
hi! link SpecialKey NonText
call s:H('Whitespace', s:bg3, s:none)
call s:H('Conceal', s:muted, s:none)
call s:H('Directory', s:cyan2, s:none)
call s:H('Title', s:foam, s:none, 'bold')
call s:H('Question', s:cyan2, s:none)
hi! link MoreMsg Question
call s:H('ModeMsg', s:foam, s:none, 'bold')
call s:H('ErrorMsg', s:red, s:none, 'bold')
call s:H('WarningMsg', s:yellow, s:none)
call s:H('FloatBorder', s:blue2, s:bg1)
call s:H('NormalNC', s:fg0, s:none)
call s:H('QuickFixLine', s:white, s:bg3)
call s:H('qfFileName', s:cyan2, s:none)
call s:H('qfLineNr', s:muted, s:none)
call s:H('Underlined', s:cyan2, s:none, 'underline')
call s:H('Ignore', s:muted, s:none)

" ── Syntax ───────────────────────────────────────────────────────────────
call s:H('Comment', s:muted, s:none, s:italic_comment)
hi! link SpecialComment Special
call s:H('Constant', s:cyan2, s:none)
call s:H('String', s:azure, s:none)
call s:H('Character', s:azure, s:none)
call s:H('Number', s:cyan2, s:none)
call s:H('Boolean', s:cyan, s:none)
call s:H('Float', s:cyan2, s:none)
call s:H('Identifier', s:fg0, s:none)
call s:H('Function', s:foam, s:none)
call s:H('Statement', s:blue2, s:none)
call s:H('Conditional', s:cyan2, s:none)
call s:H('Repeat', s:blue2, s:none)
call s:H('Label', s:cyan, s:none)
call s:H('Operator', s:fg1, s:none)
call s:H('Keyword', s:cyan2, s:none)
call s:H('Exception', s:red, s:none)
call s:H('PreProc', s:purple, s:none)
call s:H('Include', s:purple, s:none)
call s:H('Define', s:purple, s:none)
call s:H('Macro', s:purple, s:none)
call s:H('PreCondit', s:purple, s:none)
call s:H('Type', s:cyan2, s:none)
call s:H('StorageClass', s:blue2, s:none)
call s:H('Structure', s:cyan2, s:none)
call s:H('Typedef', s:cyan2, s:none)
call s:H('Special', s:orange, s:none)
call s:H('SpecialChar', s:orange, s:none)
call s:H('Tag', s:blue2, s:none)
call s:H('Delimiter', s:muted, s:none)
call s:H('Debug', s:red, s:none)
call s:H('Todo', s:bg0, s:yellow, 'bold')
call s:H('Error', s:red, s:none, 'undercurl', s:red)
call s:H('SpellBad', s:none, s:none, 'undercurl', s:red)
call s:H('SpellCap', s:none, s:none, 'undercurl', s:cyan2)
call s:H('SpellRare', s:none, s:none, 'undercurl', s:purple)
call s:H('SpellLocal', s:none, s:none, 'undercurl', s:azure)

" ── Diffs ────────────────────────────────────────────────────────────────
call s:H('DiffAdd', s:azure, s:bg1)
call s:H('DiffChange', s:cyan2, s:bg1)
call s:H('DiffDelete', s:red, s:bg1)
call s:H('DiffText', s:white, s:blue)
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete
hi! link diffFile Directory
hi! link diffNewFile String
hi! link diffLine Title

" ── Diagnostics / LSP ────────────────────────────────────────────────────
call s:H('DiagnosticError', s:red, s:none)
call s:H('DiagnosticWarn', s:yellow, s:none)
call s:H('DiagnosticInfo', s:cyan2, s:none)
call s:H('DiagnosticHint', s:azure, s:none)
call s:H('DiagnosticSignError', s:red, s:none)
call s:H('DiagnosticSignWarn', s:yellow, s:none)
call s:H('DiagnosticSignInfo', s:cyan2, s:none)
call s:H('DiagnosticSignHint', s:azure, s:none)
call s:H('DiagnosticUnderlineError', s:none, s:none, 'undercurl', s:red)
call s:H('DiagnosticUnderlineWarn', s:none, s:none, 'undercurl', s:yellow)
call s:H('DiagnosticUnderlineInfo', s:none, s:none, 'undercurl', s:cyan2)
call s:H('DiagnosticUnderlineHint', s:none, s:none, 'undercurl', s:azure)
hi! link LspReferenceText CursorLine
hi! link LspReferenceRead CursorLine
hi! link LspReferenceWrite CursorLine
hi! link CocErrorSign DiagnosticSignError
hi! link CocWarningSign DiagnosticSignWarn
hi! link CocInfoSign DiagnosticSignInfo
hi! link CocHintSign DiagnosticSignHint

" ── Git / lint signs ─────────────────────────────────────────────────────
hi! link GitSignsAdd DiffAdd
hi! link GitSignsChange DiffChange
hi! link GitSignsDelete DiffDelete
hi! link GitGutterAdd DiffAdd
hi! link GitGutterChange DiffChange
hi! link GitGutterDelete DiffDelete
hi! link GitGutterChangeDelete DiffChange
hi! link SignifySignAdd DiffAdd
hi! link SignifySignChange DiffChange
hi! link SignifySignDelete DiffDelete
hi! link ALEErrorSign DiagnosticSignError
hi! link ALEWarningSign DiagnosticSignWarn
hi! link ALEInfoSign DiagnosticSignInfo

" ── Completion ───────────────────────────────────────────────────────────
hi! link CmpItemAbbr Normal
hi! link CmpItemAbbrMatch Keyword
hi! link CmpItemKindFunction Function
hi! link CmpItemKindMethod Function

" ── File explorers ───────────────────────────────────────────────────────
hi! link netrwDir Directory
hi! link netrwClassify Directory
hi! link NERDTreeDir Directory
hi! link NERDTreeExecFile String

" ── Common filetypes (iceberg-style links) ───────────────────────────────
hi! link htmlTag Statement
hi! link htmlEndTag Statement
hi! link htmlTagName Tag
hi! link htmlArg Constant
hi! link xmlTag Statement
hi! link xmlEndTag Statement
hi! link xmlTagName Statement
hi! link xmlAttrib Constant
hi! link markdownCode String
hi! link markdownCodeDelimiter String
hi! link markdownHeadingDelimiter Comment
hi! link markdownRule Comment
hi! link markdownUrl Underlined
hi! link pythonBuiltin Identifier
hi! link pythonFunction Function
hi! link vimFunction Function
hi! link vimOption Identifier
hi! link jsFunction Function
hi! link typescriptIdentifier Identifier

" ── Tree-sitter (Vim TS* + Neovim @*) ────────────────────────────────────
hi! link TSComment Comment
hi! link TSConstant Constant
hi! link TSString String
hi! link TSNumber Number
hi! link TSBoolean Boolean
hi! link TSFunction Function
hi! link TSMethod Function
hi! link TSKeyword Keyword
hi! link TSConditional Conditional
hi! link TSRepeat Repeat
hi! link TSType Type
hi! link TSOperator Operator
hi! link TSPunctDelimiter Delimiter
hi! link TSProperty Identifier
hi! link TSField Identifier
hi! link TSVariable Identifier
hi! link TSTag Tag
if has('nvim-0.8')
  hi! link @comment TSComment
  hi! link @constant TSConstant
  hi! link @string TSString
  hi! link @number TSNumber
  hi! link @boolean TSBoolean
  hi! link @function TSFunction
  hi! link @method TSMethod
  hi! link @keyword TSKeyword
  hi! link @conditional TSConditional
  hi! link @repeat TSRepeat
  hi! link @type TSType
  hi! link @operator TSOperator
  hi! link @field TSField
  hi! link @property TSProperty
  hi! link @variable TSVariable
  hi! link @tag TSTag
endif

" ── Terminal ANSI palette (Vim + Neovim, iceberg style) ──────────────────
if has('nvim')
  let g:terminal_color_0  = '#05080D'
  let g:terminal_color_1  = '#C9757E'
  let g:terminal_color_2  = '#6FC3E8'
  let g:terminal_color_3  = '#D6C48D'
  let g:terminal_color_4  = '#2A5D86'
  let g:terminal_color_5  = '#9CA1C6'
  let g:terminal_color_6  = '#41A9CC'
  let g:terminal_color_7  = '#D3E2E9'
  let g:terminal_color_8  = '#9DADB9'
  let g:terminal_color_9  = '#DE929A'
  let g:terminal_color_10 = '#A5DDF5'
  let g:terminal_color_11 = '#E8D6A0'
  let g:terminal_color_12 = '#4A7FA4'
  let g:terminal_color_13 = '#BCC1DC'
  let g:terminal_color_14 = '#7CCDEE'
  let g:terminal_color_15 = '#F0F6F9'
else
  let g:terminal_ansi_colors = ['#05080D', '#C9757E', '#6FC3E8', '#D6C48D', '#2A5D86', '#9CA1C6', '#41A9CC', '#D3E2E9', '#9DADB9', '#DE929A', '#A5DDF5', '#E8D6A0', '#4A7FA4', '#BCC1DC', '#7CCDEE', '#F0F6F9']
endif

delfunction s:H
