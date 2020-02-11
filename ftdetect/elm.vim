" settings to play well with elm-format
set softtabstop=4
set shiftwidth=4
set expandtab

augroup elmgroup
  autocmd!
  "clears all events so they don't happen twice when reloading 
augroup END


" insert mode shortcuts to type faster
" use <c-v> if you need to insert these literally
autocmd elmgroup FileType elm inoremap <buffer> ; <space>-><space>
autocmd elmgroup FileType elm inoremap <buffer> $ <bar>><space>
autocmd elmgroup FileType elm inoremap <buffer> # <<bar><space>

" ctags
nnoremap <leader>ct :silent !ctags -R **/*.elm<cr><c-l>
"nnoremap <leader>ct :silent !ctags ~/.elm/0.19.1/packages/**/*.elm<cr>:silent !ctags -a -R **/*.elm<cr><c-l>

" I like to format on command, not on save
autocmd elmgroup FileType elm nnoremap <buffer> <leader>pe :ElmFormat<cr>

" Alternative mapping when you like to keep exposing (..)
function! ExposeAll()
    execute "normal! gg 2Ea exposing (..) \<esc>d}"
endfunction
autocmd elmgroup FileType elm nnoremap <buffer> <leader>pr mM:call ExposeAll()<cr>:ElmFormat<cr>:call ExposeAll()<cr>`M

" put your cursor on a function without type annotation
" this mapping will get the annotation from elm repl
function! InsertTypeAnnotation()
    " yank the function name
    normal! 0"fyiw
    " write:
    " import  exposing(function)
    " function
    execute "normal! O\<cr>\<cr>import  exposing(\<c-r>f)\<cr>\<c-r>f\<cr>"
    " insert the Module name
    " import Module exposing(function)
    normal! ggwyiw''--elp
    " execute elm repl
    execute "normal! vip:!elm repl --no-colors\<cr>"
    " clean up output
    execute "normal! 3ddv/:\<cr>hh\"fP+2dd-"
endfunction
autocmd elmgroup FileType elm nnoremap <buffer> <leader>st :call InsertTypeAnnotation()<cr>

" navigate section comments
autocmd elmgroup FileType elm nnoremap <buffer> ]] /\n\n--/e<cr>zt:let @/=''<cr>
autocmd elmgroup FileType elm nnoremap <buffer> [[ ---?\n\n--?e<cr>zt:let @/=''<cr>

" pretty cases -> turns a comma separated list in case statements
autocmd elmgroup FileType elm nmap <buffer> <leader>pc ^dt,Op==<<A ->wx<leader>pc

" I'm using the fahrenheit colorscheme btw
autocmd elmgroup FileType elm highlight! link elmType Type

" But I used to use gruvbox before that
" autocmd vimrc FileType elm highlight! link elmType GruvBoxYellow
" autocmd vimrc FileType elm highlight! link elmTypedef GruvBoxRed
" autocmd vimrc FileType elm highlight! link elmImport GruvBoxRed


" These are specific to the workflow that this plugin is about
" write the files, run elm-make and update the compiler.elmc buffer
autocmd elmgroup FileType elm nnoremap <leader>am :wa<cr>:edit compiler.elmc<cr>ggdG:silent read! elm make src/Main.elm --debug<cr>:e#<cr>
autocmd elmgroup FileType elm nnoremap <leader>aj :wa<cr>:edit compiler.elmc<cr>ggdG:silent read! elm make src/Main.elm --debug --output=app.js<cr>:e#<cr>
nnoremap <leader>6 :e compiler.elmc<cr>6gg

" experiment for a better autocomplete
" it works, but having the . in 'iskeyword' is annoying
"
" setup <c-x><c-k> to complete library functions from a specific module
" setlocal iskeyword+=.
" setlocal dictionary=~/.elm/0.19.0/dictionary
" autocmd elmgroup FileType elm nnoremap <leader>ak :!~/dotfiles/bin/elm-dictionary.zsh > ~/.elm/0.19.0/dictionary<cr>
