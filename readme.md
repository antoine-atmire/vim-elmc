This is a plugin to build a certain workflow when working on an elm project. 

Features:
- bindings to navigate the compiler output
- better syntax highlighting of the cited code
- jump to the source of the cited code
- insert type annotations for functions

This also contains mappings I use for all my elm projects, because I'm the only one using this plugin anyway :-)
- `<leader>am` compiles src/Main.elm to index.html, creates the `compiler.elmc` buffer and puts the output of `elm-make` there.
- `<leader>aj` does the sames but makes a app.js instead of index.html file.
- `<leader>6` takes you to the first error of `compiler.elmc` on a line where `gf` can be used to go to the source file.
- `[[` and `]]` jump to section comments in .elm files and errors in the .elmc buffer
- there a few more, just take a look in the files in ftplugin/

