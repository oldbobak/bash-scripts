"  https://vim.fandom.com/wiki/Example_vimrc
"------------------------------------------------------------
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4

"------------------------------------------------------------
" Enable use of the mouse for all modes
"if has('mouse')
"  set mouse=a
"endif
" Display line numbers on the left
"set number

"------------------------------------------------------------
set background=dark
set paste

"-----------------------------------------------------------
" Enable cursor position restore
" dont forget to make directory ~/vimrc
"if has("autocmd")
"    set viewoptions=cursor,folds
"    au BufWinLeave * mkview
"    au BufWinEnter * silent loadview
"endif

