" Windows:  $VIM/_vimrc (original)
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'git@github.com:rking/ag.vim.git'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'

call plug#end()

set nocompatible


set background=dark
colors  industry

let g:xml_syntax_folding = 1
syntax on
filetype plugin on
set nofoldenable
"bmi syntax
au BufRead,BufNewFile *.bmi set filetype=bmi
au BufRead,BufNewFile *.bml set filetype=bmi

"edit large files
let g:SaveUndoLevels = &undolevels
let g:BufSizeThreshold = 1000000
if has("autocmd")
    " Store preferred undo levels
    au VimEnter * let g:SaveUndoLevels = &undolevels
    " Don't use a swap file for big files
    au BufReadPre * if getfsize(expand("<afile>")) >= g:BufSizeThreshold | setlocal noswapfile | endif
    " Upon entering a buffer, set or restore the number of undo levels
    au BufEnter   * if getfsize(expand("<afile>")) < g:BufSizeThreshold | let &undolevels=g:SaveUndoLevels | else | set undolevels=-1 | set ft=none | endif
endif 




set spell
set rnu
"history and backup
set history=50
set backup
set backupdir=C:\Users\Colin\.vim
set directory=~/.vim/tmp
set viminfo='10,\"100,:50,%,n~/.viminfo
set directory=~/.vim-swap/

"tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
"end tabs
set formatoptions=t
"set textwidth=70
set encoding=utf-8
set termencoding=latin1
set hlsearch
"set guifont=courier_new:h10
set guifont=Lucida_Sans_Typewriter:h16:cANSI:qDRAFT
set visualbell
set noerrorbells
"editor
set number
set ruler
set autoindent
set smartindent
set whichwrap=<,>,h,l
set backspace=2
set wildmenu
" matching brackets
set showmatch
set matchtime=3
"gui only
set guioptions=bgmrL


" shortcuts
let mapleader = ","
map <leader>a G$vgg"+y
map <leader>c "+y
map <leader>p "+p
map <leader>n :NERDTreeFind<CR>
map <leader>v :tabnew C:/Users/mwheeler/.vimrc<CR>
map <leader>i :tabnew C:/Users/mwheeler/vimwiki/index.wiki<CR>
map <leader>I :tabnew C:/Users/mwheeler/_doc/bmwiki/index.wiki<CR>
map <leader>d !!date /T<CR>
map <leader>h :%s/></><C-v><C-m></g<CR>
map <leader>j :%s/\~/<C-v><C-m>\~/g<CR>
map <leader>l :g/^\s*$/d<CR>
map <leader>m :%s/<fo:block>/<fo:block>fbtvc/g<CR>:%s/fbtvc/\=INC(1)/g<CR>
"map <leader>- :silent! let &guifont = substitute(&guifont, ':h\zs\d\+', '\=eval(submatch(0)-1)', '')<CR>
"map <leader>= :silent! let &guifont = substitute(&guifont, ':h\zs\d\+', '\=eval(submatch(0)+1)', '')<CR>
vnoremap * y/<C-R>"<CR> 

nnoremap <silent> <F8> :!gcc -o %< % && %<<CR> 
nnoremap <silent> <F9> :!g++ -o %< % && %<<Cr>

inoremap { {<CR><BS>}<Esc>ko
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap [ []<Esc>i

" vim -b : edit binary using xxd-format!
augroup Binary
	au!
	au BufReadPre  *.bin let &bin=1
	au BufReadPost *.bin if &bin | %!xxd
	au BufReadPost *.bin set ft=xxd | endif
	au BufWritePre *.bin if &bin | %!xxd -r
	au BufWritePre *.bin endif
	au BufWritePost *.bin if &bin | %!xxd
	au BufWritePost *.bin set nomod | endif
augroup END
colorscheme gruvbox
