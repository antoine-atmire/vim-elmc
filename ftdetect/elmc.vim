autocmd BufNewFile,BufRead *.elmc set filetype=elmc

" make gF work with the line numbers from the error messages
nnoremap gF = ?---<cr>WyE<c-o>Pa:<esc>0gFdf:
" might as well use gf as its easier to type
nmap gf gF
