"""""""""""""
" Be iMproved
"""""""""""""
if has('vim_starting')
	set nocompatible " Be iMproved
endif

" Install vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"


call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'tell-k/vim-autopep8'
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/nginx.vim'
Plug 'tpope/vim-markdown'
Plug 'ingydotnet/yaml-vim'
Plug 'Shougo/unite.vim'
Plug 'bling/vim-airline'
Plug 'elzr/vim-json'

"""""""""
" theming
"""""""""
Plug 'nathanaelkane/vim-indent-guides'
Plug 'guns/xterm-color-table.vim'
Plug 'apriendeau/pencil'
Plug 'apriendeau/vim-colorline'


" Required:
call plug#end()

" Required:
filetype plugin indent on

""""""""""""""""
" Basic Settings
""""""""""""""""
set background=dark
set clipboard=unnamed
set mouse=a
set tabstop=4
set noexpandtab
set shiftwidth=0
set laststatus=2
set backspace=indent,eol,start
let g:autoclose_on = 0


""""""""""""""""
" Theme Settings
""""""""""""""""
let g:airline_theme='colorline'
let g:airline_powerline_fonts = 1
set colorcolumn=120
syntax on
color pencil
set number
set relativenumber
set splitright

"""""""""""""""""
" Temporary files
"""""""""""""""""
set backup
set backupdir=~/.backups,~/.tmp,~/tmp,/var/tmp,/tmp " where to put backup
" where to put swap files
set directory=~/.backups,~/.tmp,~/tmp,/var/tmp,/tmp
"do not backup when editing files in these directories
set backupskip=/tmp/*,/private/tmp/*
"create backup when saving a file,for when vim crashes trying to save a file
set writebackup
" autocmd FocusLost * :wa

""""""""""""
" golang
""""""""""""
" Set link for vim-go
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)

"au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

"au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)

let g:go_fmt_command = "goimports"

let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']
" let g:go_list_type = "quickfix"

let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


""""""""""""
" python
""""""""""""
au FileType python set tabstop=4
    \ | set softtabstop=4
    \ | set shiftwidth=4
    \ | set textwidth=119
    \ | set expandtab
    \ | set autoindent
    \ | set fileformat=unix


let g:autopep8_max_line_length=119

let g:syntastic_python_checkers=['flake8']

"""""""""""""
" markdown
"""""""""""""
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'go']

" Turn off Matching paren highlighting because its annoying.
let loaded_matchparen = 0

""""""""""""""""""
" Vertical splits
""""""""""""""""""
noremap <Leader>v :vsp<CR>
noremap <Leader>h :sp<CR>

""""""""""""
" Split Nav
""""""""""""
nmap <C-k> :wincmd k<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-h> :wincmd h<CR>
nmap <C-l> :wincmd l<CR>
nnoremap <C-S-Right> <esc>$
nnoremap <C-S-Left> <esc>^

nnoremap <Leader>/ <C-_>

map <Leader><cc> <C-_><C-_>

"""""
"tabs
"""""
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt
map <C-4> 4gt
map <C-5> 5gt
map <C-6> 6gt
map <C-7> 7gt
map <C-8> 8gt
map <C-9> 9gt

map <C-0> :tablast<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>


""""""""""
" Leader
""""""""""
let mapleader="\\"
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set guicursor+=i:blinkwait0

""""""""""""
" Nerdtree
""""""""""""
let NERDTreeAutoDeleteBuffer=1
let g:NERDTreeMouseMode=2
let NERDTreeIgnore = ['^\.git$', 'node_modules', "\.pyc$", ".DS_Store"]
let NERDTreeShowHidden=1

""""""""""""""""
" indent-guides
""""""""""""""""
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

"""""""""""
" undotree
"""""""""""
if has('persistent_undo')
	set undofile                  " Save undo history to file
	set undodir=~/.vim/tmp/undo/  " undo files in folder
	set undolevels=100000         " Maximum number of undos
	set undoreload=100000         " Save complete files for undo on reload if it has less lines than this
endif

noremap <silent> <Leader>j :UndotreeToggle<cr>

""""""""""
" deoplete
""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#complete_method = 'omnifunc'

"""""""
" json
"""""""
let g:vim_json_syntax_conceal = 0

"""""""""
" grepper
"""""""""
nnoremap <leader>g :Grepper!<cr>
let g:grepper = {}
let g:grepper.tools = ['pt', 'grep', 'git', 'ag']
let g:grepper.next_tool = '<leader>g'

"""""""""
" airline
"""""""""
let airline#extensions#default#section_use_groupitems = 0

"""""""""
" preview
"""""""""
set completeopt-=preview

" map files
au BufRead,BufNewFile *.map
	\ | setfiletype yaml
	\ | set syntax=yaml

au FileType map set tabstop=2
	\ | set expandtab

au Filetype go set tabstop=4

" Vim file settings
au BufNewFile,BufRead vim_* set filetype=vim

" associate Utopiafile with json filetype syntax
au BufNewFile,BufReadPost Utopiafile set filetype=json

" Javascript
au FileType javascript set expandtab
	\ | set tabstop=2

" Json
au FileType json set expandtab
	\ | set tabstop=2

" HCL
au BufRead,BufNewFile *.hcl setfiletype terraform

" yaml
au FileType yaml set shiftwidth=2|set tabstop=2

"dotenv
au BufRead,BufNewFile .env* set syntax=sh

""""""""""""
" WhiteSpace
""""""""""""
function! s:StripWhiteSpaces()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction

autocmd BufWritePre * StripWhiteSpace
command! -range=% StripWhiteSpaces :silent call <SID>StripWhiteSpaces()
