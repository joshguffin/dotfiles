set nocompatible

set grepprg=grep\ -nH\ $*

set autochdir
set autoread              " read open files again when changed outside Vim
set autowrite             " write a modified buffer on each :next , ...
set browsedir  =current   " which directory to use for the file browser
set incsearch             " use incremental search
set nowrap                " do not wrap lines
set novisualbell          " visual bell instead of beeping
set ruler                 " don't show a ruler
set hlsearch              " don't highlight all search results
set nostartofline backspace=2
set timeout timeoutlen=6000 ttimeoutlen=2000
set listchars=trail:-,tab:>-
set mouse=a
set shell=bash
set foldcolumn=1
set nobackup
set nowritebackup
set noswapfile

set formatoptions=tcroqv
set comments=nb:>               " rejustify quoted text correctly

map ,rw  :%s/\s\+$//e

nmap <RightMouse> <Insert>
imap <RightMouse> <ESC>

noremap K 

autocmd BufEnter * silent! call BufEnterCommands()

fun! BufEnterCommands()
   " some plugins ignore autochdir
   lcd %:p:h

   " File type settings
   let fextension = expand("%:e")
   if (strlen(fextension) > 0)
      if (fextension == "php")
         set shiftwidth=4
         set ts=4
         set tw=120
         set colorcolumn=120
         set ft=php
         set fdm=syntax
         set fdl=5
         set cindent
         set autoindent
         set cino=g0t0i3(0
      elseif (fextension == "py")
         set colorcolumn=80
         set ft=python
         set omnifunc=pythoncomplete#Complete
      elseif (fextension == "html")
         set tw=120
         set colorcolumn=120
      elseif (fextension == "tex")
         so /home/guffin/.vim/latex-commands.vimrc
         set spell
      elseif ( fextension == "cpp" || fextension == "c" || fextension == "hpp" || fextension == "ch" || fextension == "h" )
         set ft=cpp
         set fdm=syntax
         set fdl=5
         set colorcolumn=80
         so /home/guffin/.vim/cpp-commands.vimrc
      endif

endif

endfun

"
"-------------------------------------------------------------------------------
" Fast switching between tabs
"-------------------------------------------------------------------------------
"
map <tab> gt
map <s-tab> gT

map <a-1> :1tabn<CR>
map <a-2> :2tabn<CR>
map <a-3> :3tabn<CR>
map <a-4> :4tabn<CR>
map <a-5> :5tabn<CR>
map <a-6> :6tabn<CR>
map <a-7> :7tabn<CR>
map <a-8> :8tabn<CR>
map <a-9> :9tabn<CR>
map <a-0> :tablast<CR>

set wildmenu
set wildignore=*.bak,*.o,*.e,*~,*.log,*.aux,*.bbl,*.P,*.d

" Disable highlighting of beginning brackets when on end brackets, which
" slows vim down quite a bit when scrolling.
"
" Can also be set with NoMatchParen/DoMatchParen
let loaded_matchparen = 1
set noignorecase
map <C-K> {gq}                  " Map justify to ctrl-k


" /----------------------------------------------------------------------------------------------\
"  Gui-specific settings
"
if has("gui_running")
    set t_Co=256
    set t_AB=<ESC>[4%p1%dm
    set t_AF=<ESC>3%p1%dm
    set guifont=Monospace\ 11
    "set term=xterm-256color
    map <C-left>  :tabprevious
    map <C-right> :tabnext
    map <C-up>    :set guioptions+=m
    map <C-down>  :set guioptions-=m
    " 152 = xterm pointer (in /usr/X11R6/include/X11/cursorfont.h)
    set mouseshape="i:152,r:152,s:updown,sd:cross,m:no,ml:up-arrow,v:rightup-arrow,ve:beam"
    " make shift+insert work as a copy
    map! <S-Insert> <Middlemouse>

    " hide the menu/toolbar
    set guioptions-=m
    set guioptions-=T

    " use console dialogues instead of popups
    set guioptions+=c
    set sh=bash
    "color zenburn
    "color rainbow_sea
    map ,xt :!bash -ic "gnome-terminal . &" <C-L><C-L>
    map ,ex :!bash -ic "nautilus . &" <C-L><C-L>
else
    color desert
    set sh=bash
endif
" \----------------------------------------------------------------------------------------------/

map ,pp "+p

"
" \------------------------------------------------------------------------------------------------------------------------/



" /--------------------------------------------------\
"  Spelling
"
execute 'nnoremap ,si :w:!aspell -t -c %:e'
"vmap sp y:!echo <C-r>" \| aspell -t<CR>
" \--------------------------------------------------/

let highlight_sedtabs = 0
syntax on
syntax sync minlines=200
set expandtab
set ts=4
set sw=4
set tw=120
set nospell
set number

let g:syntastic_check_on_open=1


map   <silent> <F2>    :TlistToggle<CR>
map   <silent> <F3>    :NERDTreeToggle<CR>
imap  <silent> <F2>    <Esc>:TlistToggle<CR>
imap  <silent> <F3>    <Esc>:NERDTreeToggle<CR>

imap <silent> <F11> <Esc>:set guioptions-=mT<CR>
imap <silent> <F12> <Esc>:set guioptions+=mT<CR>


" Enable rainbow parentheses
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound

"call rainbow_parentheses#activate()
