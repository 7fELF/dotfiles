filetype plugin indent on
syntax on

"https://github.com/vim/vim/issues/406
let c_no_curly_error = 1

"Remap undo and redo to Ctrl-Z and Ctrl-Y
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>

"number of forgivable mistakes
set undolevels=1000
"do lots of scanning on tab completion
set complete=.,w,b,u,U,t,i,d

"Show line numbers, relative to the cursor position
set relativenumber
"Show the absolute line number at the cursor position
set number

"To display the status line always
set laststatus=2

"Use powerline-font for arrow in status line
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
"Use airline for tabs
let g:airline#extensions#tabline#enabled = 1

set noshowmode

let g:epitech_header = 1
let g:epitech_dont_update_header = 1


set nocompatible
filetype off

set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin("~/.vim_plugins")

" Defaults everyone can agree on
Plug 'tpope/vim-sensible'
" Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
" Go development plugin for Vim
Plug 'fatih/vim-go'
" EditorConfig plugin for Vim
Plug 'editorconfig/editorconfig-vim'
" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'
" Docker syntax
Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
" Use gcc to comment out a line
Plug 'tpope/vim-commentary'
" lean & mean status/tabline for vim that's light as air
Plug 'bling/vim-airline'
" Vastly improved Javascript indentation and syntax support in Vim.
Plug 'pangloss/vim-javascript'
" Syntax checking hacks for vim
Plug 'scrooloose/syntastic'
" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'
" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe'
" Generates config files for YouCompleteMe
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" The ultimate snippet solution for Vim.
Plug 'SirVer/ultisnips'
" UltiSnip Snippets
Plug 'honza/vim-snippets'

call plug#end()


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-b>"

filetype plugin indent on     " required!


" YCM
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" GVim font
set guifont=Hack\ 10
colorscheme default
let g:colors_name = "badwolf"

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
set cursorline

let mapleader = ","

"Custom settings
set nofoldenable    " disable folding
let g:vim_markdown_folding_disabled=1

" search remap
nnoremap / /\v
vnoremap / /\v

" Use case insensitive search except when using capital letters
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

"Window splitting remap
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>q <C-w>s<C-w>j
"Move into splitted windows
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j

" Buffers
nnoremap <leader>T :enew<cr>
nnoremap fr :tabnext<CR>
nnoremap ft :tabprevious<cr>
nnoremap gt :bnext<CR>
nnoremap gr :bprevious<cr>
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

augroup file_types
  autocmd!
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

set title

set noerrorbells
set noswapfile
set nobackup
nnoremap ; :

" Custom maps
set pastetoggle=<leader>p

nnoremap <leader>vi :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
nnoremap <leader>re gg=G

" Arrow keys
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" nnoremap <up> <nop>
" nnoremap <down> <nop>

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

" preserve clipboard on exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))
