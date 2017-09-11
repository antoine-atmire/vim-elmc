This is a plugin to build a certain workflow when working on an elm project. It
assumes that a `compiler.elmc` file contains the output of the elm compiler.

One method of keeping the elmc file up to date is to use this example Makefile
and the corresponding mapping: `<leader>am` (defined in ftdetect/elm.vim)

```
compiler.elmc: Main.elm
    elm-make Main.elm --warn > compiler.elmc 2>&1
```
todo: make a wildcard for all \*.elm files in this Makefile
