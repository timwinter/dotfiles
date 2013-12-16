" ~/.vimrc
set nocompatible
set ignorecase
" Map 'q' to quit (in command mode)
"map q :q<CR>
"map w :w<CR>

" Map <Alt-Backspace> to delete word in Insert mode
imap <Esc><BS> <C-W>
imap <A-BS> <C-W>

" Map <Alt-Backspace> to delete word in Normal mode
"map  <Esc><BS> <Esc>db

" Map Control-S to Save
noremap <C-S> :w<CR>
imap <C-s> <Esc>:w<CR>a


if has("syntax")
	set background=dark
	syntax on
	let c_minlines = 500
endif

" Don't wrap the lines if they go off the edge
set nowrap

" Show tabs as 4 spaces
set tabstop=4
set shiftwidth=4
set noexpandtab
set modeline
set showcmd			" Show (partial) command in status line. 
set showmatch		" Show matching brackets. 
set ignorecase		" Do case insensitive matching 
set incsearch		" Incremental search 
set hlsearch		" Highlight search results 
set ruler			" Show the cursor position at all times 
set nobackup		" Don't keep back files
