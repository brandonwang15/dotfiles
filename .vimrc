filetype plugin indent on
syntax on

" draw a column at character # 80 when editing
set colorcolumn=80

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h%=\ \ \ Line:\ %l/%L:%c\ (%p%%)
set hidden
"set nowrap
hi WhiteSpaceError ctermbg=red guibg=red
"match WhiteSpaceError /^\s\+$\|\S\+\zs\s\+$/
" Helper Function for getting the current directory
function! CurDir()
	let curdir = substitute(getcwd(), $HOME, "~", "g")
	return curdir
endfunction
" Helper Function for determining if we are in 'PASTE MODE'
function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	else
		return ''
	endif
endfunction
"color twilight256
set number
set expandtab
set shiftwidth=2
set smartindent
set autoindent
" Needed for copying and pasting between tmux windows
"set clipboard=unnamed
"set backspace=2
set mouse=a

" bdnwang personal started Aug 18

" set textwrapping by file type
autocmd BufNew, BufRead *.md setlocal textwidth=80
autocmd bufreadpre *.txt setlocal textwidth=80
autocmd bufnew *.txt setlocal textwidth=80

" jk takes you out of insert mode 
ino jk <esc>
cno jk <c-c>

vno v <esc>

" map ctrl-d to dd
nnoremap <c-d> dd
inoremap <c-d> <esc>ddi

" upper case current word in insert mode and normal mode
inoremap <c-u> <esc>vwUi
nnoremap <c-u> vwU<esc>

" set space as vim leader key
let mapleader = " "
nnoremap <leader>d dd

" map ctrl-e and ctrl-a to $ and ^
inoremap <c-e> <esc>$a
inoremap <c-a> <esc>^i
nnoremap <c-e> $
nnoremap <c-a> ^

" *E*dit my *v*imrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" *S*ource my *v*imrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" fix python indenting comments to left
autocmd BufRead *.py inoremap # X<c-h>#<space>

" on re-open, remember last cursor position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
