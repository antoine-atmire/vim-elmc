" nnoremap <leader>ct :AsyncRun ctags -R **/*.elm<cr>
nnoremap <leader>pe :ElmFormat<cr>

nnoremap <leader>6 :e compiler.elmc<cr>

" put your cursor on a function without type annotation
" this mapping will copy-paste it from compiler.elmc
function! InsertTypeAnnotation()
    " move to start of the line and set the M mark
    normal! 0mM
    " yank the function name
    normal! yiw
    " go to the compiler output
    edit compiler.elmc
    " look for the first occurrence of the function name followed by " :"
    execute "normal! gg/\<c-r>\" :\<cr>"
    " yank the whole line, go back to M and paste above
    normal! Y`MP
endfunction

nnoremap <leader>st :call InsertTypeAnnotation()<cr>

" write the files, run elm-make and update the compiler.elmc buffer
nnoremap <leader>am :w<cr>:terminal ++curwin elm-make --warn Main.elm<cr>
