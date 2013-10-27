
"
"-------------------------------------------------------------------------------
" additional mapping : complete a classical C multi-line comment:
"                      '/*<CR>' =>  /*
"                                    * |
"                                    */
"-------------------------------------------------------------------------------
inoremap  <buffer>  /*<CR>  /*<CR><CR>/<Esc>kA<Space>
"
"-------------------------------------------------------------------------------
" additional mapping : {<CR> always opens a block
"-------------------------------------------------------------------------------
inoremap  <buffer>  {<CR>    {<CR>}<Esc>O


set fdm=syntax
set fdl=5
set colorcolumn=80
so /home/guffin/.vim/cpp-commands.vimrc


if exists("g:did_C_ftplugin")
  finish
endif
let g:did_C_ftplugin = 1

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

