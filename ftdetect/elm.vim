let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 0
nnoremap <leader>pe :ElmFormat<cr>

" put your cursor on a function without type annotation
" this mapping will copy-paste it from compiler.elmc
nnoremap <leader>st 0mMyiw:buffer compiler.elmc<cr>gg/<c-r>" :<cr>Y`MP
