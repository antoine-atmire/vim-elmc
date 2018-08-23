set softtabstop=4
set shiftwidth=4
set expandtab

augroup elmgroup
  autocmd!
  "clears all events so they don't happen twice when reloading 
augroup END


" use <c-v> if you need to insert these literally
autocmd elmgroup FileType elm inoremap <buffer> ; <space>-><space>
autocmd elmgroup FileType elm inoremap <buffer> $ <bar>><space>
autocmd elmgroup FileType elm inoremap <buffer> # <<bar><space>

nnoremap <leader>ct :silent !ctags -R **/*.elm<cr><c-l>
autocmd elmgroup FileType elm nnoremap <buffer> <leader>pe :ElmFormat<cr>

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

autocmd elmgroup FileType elm nnoremap <buffer> <leader>st :call InsertTypeAnnotation()<cr>
autocmd elmgroup FileType elm nnoremap <buffer> ]] /\n\n--/e<cr>zt:let @/=''<cr>
autocmd elmgroup FileType elm nnoremap <buffer> [[ ---?\n\n--?e<cr>zt:let @/=''<cr>

" write the files, run elm-make and update the compiler.elmc buffer
autocmd elmgroup FileType elm nnoremap <leader>am :wa<cr>:edit compiler.elmc<cr>ggdG:silent read! elm make Main.elm --warn --debug<cr>:e#<cr>
autocmd elmgroup FileType elm nnoremap <leader>aj :wa<cr>:edit compiler.elmc<cr>ggdG:silent read! elm make Main.elm --warn --debug --output=app.js<cr>:e#<cr>
