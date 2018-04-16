augroup localvimrc
  autocmd!
  "clears all events so they don't happen twice when reloading vimrc
augroup END

autocmd localvimrc FileType elm nnoremap <leader>ct :AsyncRun ctags -R **/*.elm<cr>
autocmd localvimrc FileType elm nnoremap <leader>pe :ElmFormat<cr>

" ctrl-7 opens the compiler.elmc buffer
nnoremap  :e compiler.elmc<cr>
" this is ctrl-7 on my cygwin setup
nnoremap [1;5w :e compiler.elmc<cr>

" put your cursor on a function without type annotation
" this mapping will copy-paste it from compiler.elmc
nnoremap <leader>st 0mMyiw:buffer compiler.elmc<cr>gg/<c-r>" :<cr>Y`MP

" write the files, run elm-make and update the compiler.elmc buffer
nnoremap <leader>am :wa<cr>:silent make<cr><c-l>
