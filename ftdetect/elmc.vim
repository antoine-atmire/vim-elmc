autocmd BufNewFile,BufRead *.elmc set filetype=elmc

augroup elmcgroup
  autocmd!
  "clears all events so they don't happen twice when reloading 
augroup END

function! GoToCitedSource()
    " Error messages look like this:
    "
    " -- MESSAGE ---------------- File.elm
    "
    " 4| main =
    "
    " The idea is to copy the filename from the header to the current line
    " File.elm:4| main =
    " so the regular gF can work on it

    " go to File.elm and yank it
    execute "normal! 0?---\<cr>WyE"
    " go back to the line and add File.elm: at the start
    execute "normal! ``Pa(\<esc>"
    " use gF, go back and restore the original line, then go back again
    normal! 0gFdf(
endfunction

" make gF work with the line numbers from the error messages
autocmd elmcgroup FileType elmc nnoremap <buffer> gF :call GoToCitedSource()<cr>
" might as well use gf as its easier to type
autocmd elmcgroup FileType elmc nnoremap <buffer> gf :call GoToCitedSource()<cr>

" jump to a line that starts with a digit
autocmd elmcgroup FileType elmc nnoremap <buffer> ]] /\n\n\s*\d/2<cr>:let @/=''<cr>
autocmd elmcgroup FileType elmc nnoremap <buffer> [[ ---?\n\n\s*\d?2<cr>:let @/=''<cr>
