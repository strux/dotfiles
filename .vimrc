"=========================
" Reminders
"=========================
"
" z<CR> - Top of screen
" z.<CR> - Center of screen

"=========================
" Vundle Plugins
"=========================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-fugitive'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'rking/ag.vim'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'ternjs/tern_for_vim'
  Plugin 'nelstrom/vim-visual-star-search'
  Plugin 'sheerun/vim-polyglot'
  Plugin 'will133/vim-dirdiff'
  Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plugin 'junegunn/fzf.vim'
call vundle#end()            " required
filetype plugin indent on    " required

set relativenumber
set number
set ts=2 sts=2 sw=2 expandtab
set visualbell
set splitright
set hlsearch
set incsearch
set smartcase
set ignorecase " ignore case in search
set autoread
set diffopt=vertical,iwhite
set modelines=1
set laststatus=2 " required for airline
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile " maintain edit history across sessions
set list
set listchars=tab:▸\ ,trail:.
set spell spelllang=en_us
set mouse=a
set nowrap
set clipboard=unnamed
set nofixendofline
" Comma separated patterns to be ignored in globs. Applies to crlp results
set wildignore+=*/generated/*,*/node_modules/*,*/target/*

set shell=/bin/zsh

syntax enable
set background=dark
" might need
" let g:solarized_termcolors=16
silent! colorscheme solarized

"=========================
" Mappings & Configs
"=========================
let mapleader = ","

"-------------------------
" vim
"-------------------------
nmap <leader>v :tabedit ~/.vimrc<CR>
nmap <leader>n :set invnumber<CR>
map <Leader>j :join<CR>
map <leader>p <ESC>:set paste<CR>"*P<ESC>:set nopaste<CR>
map <leader>cp :let @*=@%<CR>
map <Leader>r <ESC>:e!<CR>
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"commane line
map <leader>/ <ESC>^i// <ESC>

" Popup navigation
inoremap <expr> <c-k> pumvisible()?"\<Up>":"\<c-k>"
inoremap <expr> <c-j> pumvisible()?"\<Down>":"\<c-j>"

" Ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"-------------------------
" Bash
"-------------------------
map <Leader>b <ESC>:w<CR>:!bash "%"<CR>

"-------------------------
" Ruby
"-------------------------
map <Leader>ru <ESC>:w<CR>:!ruby "%"<CR>

"-------------------------
" Node
"-------------------------
map <Leader>en <ESC>:w<CR>:!node "%"<CR>

"-------------------------
" FZF
"-------------------------
nmap <C-p> :GFiles --others --cached --exclude-standard<CR>

"-------------------------
" NERDTree
"-------------------------
function! ToggleNERDTreeFind()
    if g:NERDTree.IsOpen()
        execute ':NERDTreeClose'
    else
        execute ':NERDTreeFind'
    endif
endfunction

let NERDTreeIgnore = ['\.DS_Store', '\.idea', '\.git$']
let NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize=40
map <Leader>d :call ToggleNERDTreeFind()<CR>
map <Leader>D :NERDTreeToggle<CR>

"-------------------------
" Fugitive
"-------------------------
map <leader>gs <ESC>:Gstatus<CR>
map <leader>gd <ESC>:Gdiff<CR>
map <leader>gc <ESC>:Gcommit<CR>
map <leader>gb <ESC>:Gblame<CR>
map <leader>gl <ESC>:Glog<CR>
map <leader>gp <ESC>:Git push<CR>
map <leader>gw <ESC>:Gwrite<CR>

"-------------------------
" Auto-complete
"-------------------------
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

set omnifunc=syntaxcomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1


"-------------------------
" Ag
"-------------------------
map <Leader>f <ESC>:tabnew<CR>:Ag -Q ''<Left>
map <Leader>F <ESC>:Ag -Q ''<Left>
map <Leader>fr <ESC>:tabnew<CR>:Ag -G 'reactapps\/' 
map <Leader>fs <ESC>:tabnew<CR>:AgFromSearch<CR>

"-------------------------
" YouCompleteMe
"-------------------------
let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1

"-------------------------
" Buffers, Tabs and Windows
"-------------------------
" Buffers
:nnoremap <Leader>b :buffers<CR>:buffer<Space>

" Tabs
map <C-l> gt
map <C-h> gT
map <Leader>t :tabnew<CR>
map <Leader>q :tabclose<CR>
map <Leader>q! :tabclose!<CR>
map <Leader>wq :windo wq<CR>

" Windows
map <S-k> <C-w><Up>
map <S-j> <C-w><Down>
map <S-h> <C-w><Left>
map <S-l> <C-w><Right>

" Window sizing with ALT+hjkl
map ¬ :vertical resize +5<CR>
map ˙ :vertical resize -5<CR>
map ˚ :resize +5<CR>
map ∆ :resize -5<CR>

"=========================
" Custom Syntax mappings
"=========================
au BufNewFile,BufRead *.soy set filetype=xml
au BufNewFile,BufRead *.vue set filetype=html
au BufNewFile,BufRead *.ts set filetype=javascript

"=========================
" Auto reload .vimrc
"=========================
if has('autocmd')
  " Source .vimrc when I write it.  The nested keyword allows
  " autocommand ColorScheme to fire when sourcing ~/.vimrc.
  au! BufWritePost .vimrc nested source %
endif

"=========================
" ES Lint
"=========================
map <leader>ld <ESC>ggi/* eslint-disable */<CR><ESC>g;g;
map <leader>ldd <ESC>ggddg;g;
map <leader>ldl <ESC>O// eslint-disable-next-line<ESC>j


:command EntryToAttr execute "normal! ^f:d/[^\s]r=f,x:s/'/\"/g"
