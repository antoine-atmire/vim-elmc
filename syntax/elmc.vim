if exists("b:current_syntax")
	finish
endif

syntax keyword elmcKeyword Hint
highlight link elmcKeyword Keyword

" syntax keyword elmcWarnings WARNINGS
" highlight link elmcWarnings Todo

" syntax keyword elmcErrors ERRORS
" highlight link elmcErrors Error

syntax match elmcHeader "\v--.*$"
highlight link elmcHeader Statement

syntax match elmcPointer "\^"
highlight link elmcPointer Constant

let b:current_syntax = "elmc"
