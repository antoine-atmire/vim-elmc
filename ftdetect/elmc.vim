autocmd BufNewFile,BufRead *.elmc set filetype=elmc

" make gF work with the line numbers from the error messages
nnoremap gF = ?---<cr>WyE<c-o>Pa:<esc>0gFdf:
" might as well use gf as its easier to type
nmap gf gF

" jump to a line that starts with a digit
nnoremap ]] /\n\n\d/2<cr>
nnoremap [[ ?\n\n\d?2<cr>
