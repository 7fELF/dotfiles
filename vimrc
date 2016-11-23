filetype plugin indent on
syntax on

"Remap undo and redo to Ctrl-Z and Ctrl-Y
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>

"number of forgivable mistakes
set undolevels=1000
"write swap file to disk every 100 chars
set updatecount=100
"do lots of scanning on tab completion
set complete=.,w,b,u,U,t,i,d
set textwidth=80

"Show line numbers, relative to the cursor position
set relativenumber
"Show the absolute line number at the cursor position
set number

"GNU Style indentation for Epitech
function! GnuIndent()
  setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
  setlocal shiftwidth=0
  setlocal tabstop=8
endfunction

"Use GnuIndent for C and C++
au FileType c,cpp call GnuIndent()

"To display the status line always
set laststatus=2

"Use powerline-font for arrow in status line
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
"Use airline for tabs
let g:airline#extensions#tabline#enabled = 1

set noshowmode

let g:epitech_header = 1

map <C-n> :NERDTreeToggle<CR>
set runtimepath^=~/.vim/bundle/ctrlp.vim

set nocompatible
filetype off

set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
 " required!
 Plugin 'gmarik/Vundle.vim'


 Plugin 'tpope/vim-fugitive'
 Plugin 'groenewege/vim-less'
 Plugin 'editorconfig/editorconfig-vim'
 Plugin 'airblade/vim-gitgutter'
 Plugin 'kien/ctrlp.vim'
 Plugin 'scrooloose/NERDTree'
 Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
 Plugin 'tpope/vim-commentary'
 Plugin 'fatih/vim-go'
 Plugin 'bling/vim-airline'
 Plugin 'pangloss/vim-javascript'
 Plugin 'scrooloose/syntastic'
 Plugin 'terryma/vim-multiple-cursors'

 " ...
 call vundle#end()            " required
 filetype plugin indent on     " required!

 set guifont       = "Menlo:12"
 colorscheme default
 let g:colors_name = "badwolf"
 set background    = "dark"

 set modelines=0
 syntax enable
 set nu
 set ruler

 " remap arrow keys
 noremap <Down> gj
 noremap <Up> gk

 " copy
 vnoremap <C-c> "*y


 set wildignore+=*.pdf,*.o,*.obj,*.jpg,*.png

 " Command T settings
 let g:CommandTInputDebounce = 200
 let g:CommandTFileScanner = "watchman"
 let g:CommandTWildIgnore = &wildignore . ",**/bower_components/*" . ",**/node_modules/*" . ",**/vendor/*"
 let g:CommandTMaxHeight = 30
 let g:CommandTMaxFiles = 500000

 " CtrlP settings
 "
 let g:ctrlp_map = '<leader>t'
 let g:ctrlp_cmd = 'CtrlP'
 let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard']  " Windows

 " Syntastic

 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*

 let g:syntastic_always_populate_loc_list = 1
 let g:syntastic_loc_list_height = 5
 let g:syntastic_auto_loc_list = 0
 "let g:syntastic_check_on_open = 1
 let g:syntastic_check_on_wq = 0
 let g:syntastic_javascript_checkers = ['eslint']

 let g:syntastic_error_symbol = '❌'
 let g:syntastic_style_error_symbol = '⁉️'
 let g:syntastic_warning_symbol = '⚠️'
 let g:syntastic_style_warning_symbol = '💩'

 highlight link SyntasticErrorSign SignColumn
 highlight link SyntasticWarningSign SignColumn
 highlight link SyntasticStyleErrorSign SignColumn
 highlight link SyntasticStyleWarningSign SignColumn

 "Some tips from http://stevelosh.com/blog/2010/09/coming-home-to-vim/"

 set tabstop=4
 set shiftwidth=2
 set softtabstop=4
 set expandtab

 set encoding=utf-8
 set scrolloff=3
 set autoindent
 set showmode
 set showcmd
 set hidden
 set wildmenu
 set wildmode=list:longest,full
 set ttyfast
 set backspace=indent,eol,start
 set laststatus=2
 " set relativenumber
 set cursorline


 let mapleader = ","

 "Custom settings
 set nofoldenable    " disable folding
 let g:vim_markdown_folding_disabled=1

 " search remap
 nnoremap / /\v
 vnoremap / /\v
 set ignorecase
 set smartcase
 set gdefault
 set incsearch
 set showmatch
 set hlsearch
 " clear search
 nnoremap <leader><space> :noh<cr>

 " match the next brace
 nnoremap <tab> %
 vnoremap <tab> %
 set wrap
 set formatoptions=qrn1
 set linebreak

 " remap movement to move by column layout
 nnoremap j gj
 nnoremap k gk

 "User customizations"

 " Strips whitespace
 nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

 " Select pasted text
 nnoremap <leader>v V`]

 "Window splitting remap"
 nnoremap <leader>w <C-w>v<C-w>l
 nnoremap <leader>q <C-w>s<C-w>j
 "Move into splitted windows
 nnoremap <C-h> <C-w>h
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l
 nnoremap <C-j> <C-w>j

 " Buffers
 nnoremap <leader>T :enew<cr>
 nnoremap gr :tabnext<CR>
 nnoremap gt :tabprevious<cr>
 nnoremap gd :bdelete<cr>
 nnoremap <leader>bl :ls<CR>



 " badwolf settings
 let g:badwolf_darkgutter = 1
 let g:badwolf_tabline = 2
 let g:badwolf_css_props_highlight = 1
 let g:badwolf_html_link_underline = 1

 " Airline settings
 let g:airline#extensions#tabline#enabled =1
 let g:airline_powerline_fonts=1
 nnoremap <leader>d :NERDTreeToggle<CR>
 nnoremap <leader>f :NERDTreeFind<CR>

 augroup file_types
   autocmd!
   autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
   autocmd BufRead,BufNewFile *.md set filetype=markdown
   autocmd BufRead,BufNewFile *.txt set filetype=markdown
   autocmd BufRead,BufNewFile *.module set filetype=php
   autocmd BufRead,BufNewFile *.install set filetype=php
   autocmd BufRead,BufNewFile *.test set filetype=php
   autocmd BufRead,BufNewFile *.inc set filetype=php
   autocmd BufRead,BufNewFile *.profile set filetype=php
   autocmd BufRead,BufNewFile *.view set filetype=php
   autocmd BufNewFile,BufRead *.less set filetype=less
   autocmd BufRead,BufNewFile *.js set ft=javascript syntax=javascript
   autocmd BufRead,BufNewFile *.ts set ft=typescript syntax=typescript
   autocmd BufRead,BufNewFile *.es6 set ft=javascript syntax=javascript
   autocmd BufRead,BufNewFile *.json set ft=json syntax=javascript
   autocmd BufRead,BufNewFile *.twig set ft=htmldjango
   autocmd BufRead,BufNewFile *.rabl set ft=ruby
   autocmd BufRead,BufNewFile *.jade set ft=jade
 augroup END

 " Whitespace fixes
 highlight ExtraWhitespace ctermbg=red guibg=red
 match ExtraWhitespace /\s\+$/

 augroup whitespace
   autocmd!
   autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
   autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
   autocmd InsertLeave * match ExtraWhitespace /\s\+$/
   autocmd BufWinLeave * call clearmatches()
 augroup END

 set undolevels=20
 set title

 set noerrorbells
 set noswapfile
 set nobackup
 nnoremap ; :


 " Tabular
 nnoremap <leader>a= :Tabularize /=<CR>
 vnoremap <leader>a= :Tabularize /=<CR>
 nnoremap <leader>a: :Tabularize /:\zs<CR>
 vnoremap <leader>a: :Tabularize /:\zs<CR>

 " Custom maps
 set pastetoggle=<leader>p
 nnoremap <leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

 nnoremap <leader>vi :vsplit $MYVIMRC<cr>
 nnoremap <leader>sv :source $MYVIMRC<cr>
 vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
 nnoremap <leader>re gg=G

 " Save
 noremap  <silent> <C-S> :update<CR>
 vnoremap <silent> <C-S> <C-C>:update<CR>
 inoremap <silent> <C-S> <C-O>:update<CR>

 " Arrow keys
 "nnoremap <left> <nop>
 "nnoremap <right> <nop>
 "nnoremap <up> <nop>
 "nnoremap <down> <nop>

 "inoremap <left> <nop>
 "inoremap <right> <nop>
 "inoremap <up> <nop>
 "inoremap <down> <nop>

 set fileformat=unix
 set fileformats=unix,dos

 hi Comment guifg=#5D5D5D

 "disable visual bells
 autocmd GUIEnter * set vb t_vb= " for your GUI
 autocmd VimEnter * set vb t_vb=

 autocmd BufWritePre * %s/\s\+$//e
