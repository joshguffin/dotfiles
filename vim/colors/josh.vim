" Vim color file
" Last Change:	2010 Oct 18

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "josh"
"hi Normal		guifg=white guibg=black
hi Normal       guifg=#f0f0f8 guibg=#343478
hi NonText		guifg=brown
hi comment		guifg=green
hi constant		guifg=cyan	
hi identifier	guifg=cyan	gui=NONE
hi statement	guifg=lightblue	gui=NONE
hi preproc		guifg=Pink2
hi type			guifg=seagreen	
hi special		guifg=yellow
"hi ErrorMsg		guifg=Black	guibg=Red
"hi WarningMsg	guifg=Black	guibg=Green
hi Todo			guifg=Black	guibg=orange

"Cursor
hi Cursor       gui=NONE guifg=#ffffff guibg=#d86020
hi lCursor      gui=NONE guifg=#ffffff guibg=#e000b0
hi CursorIM     gui=NONE guifg=#ffffff guibg=#e000b0

"hi Search		guibg=lightslateblue
"hi IncSearch	gui=NONE guibg=steelblue
hi LineNr		guifg=darkgrey
hi title		guifg=darkgrey
"hi StatusLineNC	gui=NONE guifg=lightblue guibg=darkblue
"hi StatusLine	gui=bold	guifg=cyan	guibg=blue
hi label		guifg=gold2
hi operator		guifg=orange
hi clear Visual
hi Visual		term=reverse cterm=reverse gui=reverse


" Diff
hi DiffText     gui=UNDERLINE guifg=#ffff00 guibg=#000000
hi DiffChange   gui=NONE guifg=#ffffff guibg=#000000
hi DiffDelete   gui=NONE guifg=#60ff60 guibg=#000000
hi DiffAdd      gui=NONE guifg=#60ff60 guibg=#000000

"hi DiffChange   guibg=darkgreen
"hi DiffText		guibg=olivedrab
"hi DiffAdd		guibg=slateblue
"hi DiffDelete   guibg=coral

"Folds
hi Folded       gui=NONE guifg=#ffffff guibg=#0080a0
hi FoldColumn   gui=NONE guifg=#9090ff guibg=#3c3c88
hi cIf0			guifg=gray



" Search
hi IncSearch    gui=UNDERLINE,BOLD guifg=#ffffff guibg=#c030ff
hi Search       gui=BOLD guifg=#f0e0ff guibg=#b020ff

" Messages
hi ErrorMsg     gui=BOLD guifg=#ffffff guibg=#f000a0
hi WarningMsg   gui=BOLD guifg=#ffffff guibg=#f000a0
hi ModeMsg      gui=BOLD guifg=#00e0ff guibg=NONE
hi MoreMsg      gui=BOLD guifg=#00ffff guibg=#6060ff
hi Question     gui=BOLD guifg=#00f0d0 guibg=NONE

" Split area
hi StatusLine   gui=NONE guifg=#000000 guibg=#d0d0e0
hi StatusLineNC gui=NONE guifg=#606080 guibg=#d0d0e0
hi VertSplit    gui=NONE guifg=#606080 guibg=#d0d0e0
hi WildMenu     gui=NONE guifg=#000000 guibg=#ff90ff


" Syntax group
hi Comment      gui=NONE guifg=#b0b0c8 guibg=NONE
hi Constant     gui=NONE guifg=#60ffff guibg=NONE
hi Identifier   gui=NONE guifg=#c0c0ff guibg=NONE
hi Ignore       gui=NONE guifg=#303080 guibg=NONE
hi PreProc      gui=NONE guifg=#ffb0ff guibg=NONE
hi Special      gui=NONE guifg=#ffd858 guibg=NONE
hi Todo         gui=BOLD,UNDERLINE guifg=#ff70e0 guibg=NONE
hi Underlined   gui=UNDERLINE,BOLD guifg=#f0f0f8 guibg=NONE
"hi Error        gui=BOLD guifg=#ffffff guibg=#f000a0
hi Error		guibg=Red
hi Type         gui=NONE guifg=green  guibg=NONE
hi Statement    gui=NONE guifg=lightblue  guibg=NONE
