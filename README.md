# base-vimrc

A basic vimrc for teaching with some base plugins for python and go.

https://github.com/junegunn/vim-plug

## Requires vim-plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```


[themes](http://vimcolors.com/)

[airline-themes](https://github.com/vim-airline/vim-airline/wiki/Screenshots)
`let g:airline_theme='colorline'`

## Modes

There three main modes of vim. Normal, Insert and Visual are key.

* Normal is the base mode of things. You will run commands through normal mode.
* Insert is where you can insert characters into a file
* Visual/visual block is where you can select/modify multiple lines


## Helpful commands

Every command is ran with `:` or the colon in normal mode.

1. quit: `q`
2. write: `w`
3. exit: `x`
4. force: `!` Ex (quit without saving): `:q!`
5. Search: `/`
6. Search and Replace: `%s/{regex}/{replacement}/{modifiers}`:W


