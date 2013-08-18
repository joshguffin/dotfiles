set guioptions-=mT

"
" Remember the cursor's position when re-opening a file
"
set viminfo='10,\"100,:20,%,n/home/guffin/.viminfo
set nospell

set cindent
set autoindent
set cino=g0t0i3(0

"-------------------------------------------------------------------------------
"    F5   -  open quickfix error window
"    F6   -  close quickfix error window
"    F7   -  display previous error
"    F8   -  display next error
"  S-Tab  -  Fast switching between buffers (see below)
"    C-q  -  Leave the editor with Ctrl-q (see below)
"-------------------------------------------------------------------------------
"
nmap  <silent> <F5>    :exe ":ptag ".expand("<cword>")<CR>
map   <silent> <F6>    :copen<CR>
map   <silent> <F7>    :cclose<CR>
map   <silent> <F8>    :cp<CR>
map   <silent> <F9>    :cn<CR>
"
imap  <silent> <F5>    <Esc>:exe ":ptag ".expand("<cword>")<CR>
imap  <silent> <F6>    <Esc>:copen<CR>
imap  <silent> <F7>    <Esc>:cclose<CR>
imap  <silent> <F8>    <Esc>:cp<CR>
imap  <silent> <F9>    <Esc>:cn<CR>

if has('cscope')
   if has('quickfix')
      set cscopequickfix=s-,c-,d-,i-,t-,e-
   endif
endif

set tags=$CPPROOT/ctags

Rainbow (
exe "so ".fnameescape(substitute(&rtp,',.*$','',''))."/after/syntax/c/rainbow.vvim"

map ,h :call HeaderSourceSwap()<CR>

if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  if filereadable("$CPPROOT/cscope.out")
     cs add $CPPROOT/cscope.out
  elseif $CSCOPE_DB != ""
     cs add $CSCOPE_DB
  endif
endif

if has('ctags')
   map <C-LeftMouse> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
   map <C-RightMouse> <C-t>
endif

fun! HeaderSourceSwap()
   let extension = expand("%:e")
   let root = expand("%:r")
   let alternate = ""
   let isHeader = 0

   let save_spr = &splitright

   " Get the correct extension
   if extension == "cpp" || extension == "ch"
      let alternate = root . ".h"
      set splitright
   else
      let alternate = root . ".ch"
      if !filereadable(alternate)
         let alternate = root . ".cpp"
      endif
      set nosplitright
   endif

   let command = "vsp " . alternate
   exec command
   let splitright = save_spr
endfun
