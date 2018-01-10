let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 0
nnoremap <leader>pe :ElmFormat<cr>

" ctrl-7 opens the compiler.elmc buffer
nnoremap  :e compiler.elmc<cr>

" put your cursor on a function without type annotation
" this mapping will copy-paste it from compiler.elmc
nnoremap <leader>st 0mMyiw:buffer compiler.elmc<cr>gg/<c-r>" :<cr>Y`MP

" write the files, run elm-make and update the compiler.elmc buffer
nnoremap <leader>am :wa<cr>:silent make<cr><c-l>
