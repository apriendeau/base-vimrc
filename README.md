# base-vimrc

A basic vimrc for teaching with some base plugins for python and go.

## Config Setup

To install the vimrc, from inside of this directory run: `cp vimrc ~/.vimrc`

## vim-plug

We are going to use [vim-plug](https://github.com/junegunn/vim-plug). Before anything, run the command below.

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

To install plugins: `:PlugInstall`
To update plugins: `:PlugUpdate`
To update vim-plug: `:PlugUpgrade`

## Modes

There three main modes of vim. Normal, Insert and Visual are key.

* Normal is the base mode of things. You will run commands through normal mode.
    * to return to normal mode from insert or visual mode, press `esc`
* Insert is where you can insert characters into a file
    * To enter insert mode from vim, press `i`
* Visual/visual block is where you can select/modify multiple lines
    * To enter visual mode: press `v`


## Helpful commands

Every command is ran with `:` or the colon in normal mode.

1. quit: `q`
2. write: `w`
3. exit: `x`
4. force: `!` Ex (quit without saving): `:q!`
5. Search: `/`
6. Search and Replace: `%s/{regex}/{replacement}/{modifiers}`:W

## NERDTree
To open NERDTree: Press `\` then `tab`

When opening files, you have options: press `enter` 


## Themes

[themes](http://vimcolors.com/)
`color {theme_name}`

[airline-themes](https://github.com/vim-airline/vim-airline/wiki/Screenshots)
`let g:airline_theme='colorline'`
