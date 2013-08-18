

" if exists('loaded_annotate')
"    unlet loaded_annotate
" endif

let s:cpo_save = &cpo
set cp&vim

if !exists('loaded_annotate')

   let loaded_annotate = 'yes'
   let Annotate_title = "__Annotate__"
   let Annotate_file  = "/tmp/__Annotate__"

   " Call a function when loading the annotate window.
   " autocmd BufFilePost __Annotate__ call s:Annotate_Vim_Session_Load()

   " Define a user command to manage the annotate window
   command! -nargs=0 -bar AnnotateToggle call s:Annotate_Window_Toggle()

endif

function! s:Annotate_Window_Toggle()

   let winnum = bufwinnr(g:Annotate_title)
   if winnum != -1
      call s:Annotate_Window_Close()
      return
   endif

   call s:Annotate_Window_Open()
endfunction

function! s:Annotate_Warning_Msg(msg)
   echohl WarningMsg
   echomsg a:msg
   echohl None
endfunction

function! s:Annotate_Window_Close()
   let winnum = bufwinnr(g:Annotate_title)
   if winnum == -1
      call s:Annotate_Warning_Msg('Error: Annotate window is not open')
      return
   endif
   if winnr() == winnum
      " Already in the annotate window; remove scrollbinding in annotate, close
      " it, and return
      set noscrollbind
      if winbufnr(2) != -1
         bd!
         " If a window other than the annotate window is open, only close the
         " annotate window
      endif
   else
      "Go to the annotate window, close it, and return to the original window
      let curbufnr=bufnr('%')
      exe winnum . 'wincmd w'
      "Remove scrollbinding in annotate window
      set noscrollbind
      bd!
      " Jump back to the original window only if we are not already in that
      " window
      let winnum = bufwinnr(curbufnr)
      if winnr() != winnum
         exec winnum . 'wincmd w'
      endif
   endif

   set noscrollbind
endfunction

function! s:Annotate_Window_Open()
   setlocal noscb

   " Get the current cursor position
   let cur_pos  = getpos('.')
   let cur_buf  = cur_pos[0]
   let cur_lnum = cur_pos[1]
   let cur_col  = cur_pos[2]

   " Get the top of the window's position
   normal H
   let cur_top = getpos('.')[1]

   normal gg

   " Get file information
   let curbuf_name = bufname('%')
   let curbuf_path = expand("%:p:h")

   "Run the annotate command
   let command = '40vnew ' . g:Annotate_file . ' | r !bash -c "cd ' . curbuf_path . '; cvs annotate ' . curbuf_name . '2>/dev/null "'
   echo "Running '" . command . "'"

   silent! exec command

   " Delete the first (blank) line of the annotation buffer
   setlocal noscrollbind
   normal ggdd

   " Make this a scratch buffer
   setl buftype=nofile
   setl noswapfile
   setl bufhidden=wipe
   setl nobuflisted

   " Turn scollbinding on and modifications off for the annotation buffer
   setlocal scrollbind
   setlocal nomodifiable

   " Return to the source buffer
   exe 'wincmd 1'

   " Bind and sync scrolling
   setlocal scb
   normal :syncbind

   " Set the top of the screen to what it was before
   exec "normal " . cur_top . "zt"

   " Return the cursor to the correct position
   call setpos('.', cur_pos)

endfunction
