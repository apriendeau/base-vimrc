"""""""""""""
" Be iMproved
"""""""""""""
if has('vim_starting')
  set nocompatible " Be iMproved
endif

" Install vim-plug for vim
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
if has("nvim")
  call plug#begin("~/.local/share/nvim/plugged")
else
  call plug#begin('~/.vim/plugged')
endif

Plug 'scrooloose/nerdtree'

"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'vim-scripts/nginx.vim'
Plug 'tpope/vim-markdown'
Plug 'ingydotnet/yaml-vim'

Plug 'Shougo/unite.vim'
Plug 'bling/vim-airline'
Plug 'elzr/vim-json'
" Themes
Plug 'apriendeau/dracula-vim', { 'as': 'dracula' }
Plug 'apriendeau/pencil'
Plug 'apriendeau/vim-colorline'
" typescript
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'roxma/nvim-yarp'
if has("nvim")
  Plug 'ncm2/ncm2'
  " ncm2 requires nvim-yarp
  Plug 'ncm2/ncm2-go'
  Plug 'ncm2/ncm2-ultisnips'
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/vim-hug-neovim-rpc'
  let g:deoplete#enable_at_startup = 1
endif

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
color dracula
let g:dracula_colorterm = 1
set number
set relativenumber
set splitright

""""""""""
" Leader
""""""""""
let mapleader="\\"
if has('nvim')
  let $NVIM_TUI_ENABLE_CURddSOR_SHAPE = 1
else
  set guicursor+=i:blinkwait10
endif
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

"""""""""""""""""""""""
" better mouse support
"""""""""""""""""""""""
if has("mouse_sgr")
  set ttymouse=sgr
end

"""""""""""
" UltiSnip
"""""""""""

  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

if has("nvim")
  "inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
  let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
  let g:UltiSnipsSnippetDirectories=["~/.config/nvim/UltiSnips", "UltiSnips"]
else
  let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
  let g:UltiSnipsSnippetDirectories=["UltiSnips", "~/.vim/UltiSnips"]
endif


"""""""""""""""
" ncm2 (neovim)
"""""""""""""""
if has("nvim")
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
  set completeopt=noinsert,menuone,noselect
endif

""""""""""""""""
" External files
""""""""""""""""
for f in split(glob('~/.vim/vim_*'), '\n')
  execute 'source' f
endfor
