This is a plugin to build a certain workflow when working on an elm project. 

Features:
- bindings to navigate the compiler output
- better syntax highlighting of the cited code
- jump to the source of the cited code
- insert type annotations for functions

This also contains mappings I use for all my elm projects, because I'm the only
one using this plugin anyway :-)

It assumes that a `compiler.elmc` file contains the output of the elm compiler.
One method of keeping the elmc file up to date is to use this example Makefile
and the corresponding mapping: `<leader>am` (defined in ftdetect/elm.vim)

```
index.html: *.elm
	TZ=UTC-2 date +"%Y-%m-%d %H:%M:%S" > compiler.elmc
	time elm-make Main.elm --yes --warn --debug >> compiler.elmc 2>&1
```
