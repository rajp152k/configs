"-----------------SETTINGS---------------------- 
set relativenumber
set number
set encoding=utf-8
syntax enable
set ts=4
set expandtab 
set autoindent
set shiftwidth=4
set showmatch

" Enable folding
"  use zc for folding and zo for unfolding 
set foldmethod=indent
set foldlevel=99
"Tmux color issue 
set term=screen-256color
"-----------------MISC--------------------------
"SCROLLING POPUPS
"https://vi.stackexchange.com/questions/21924/how-can-i-hide-and-scroll-popup-window-in-coc-nvim-in-vim/21927#21927
"corresponding functions in ~/.vim/autoload/misc/popup.vim

nnoremap <expr> <C-d> misc#popup#scroll_cursor_popup(1) ? '<esc>' : '<C-d>'  
nnoremap <expr> <C-u> misc#popup#scroll_cursor_popup(0) ? '<esc>' : '<C-u>'  
"-----------------MAPS--------------------------
"leader maps
let mapleader = "\<Space>"
let maplocalleader = "\\"
inoremap jk <esc>|                                  "static escape
inoremap <esc> <nop>|                               "old habits
inoremap <c-[> <nop>|                               "old habits die hard
nnoremap <leader>ev :vs $MYVIMRC<Cr>|               "pull up vimrc buffer
nnoremap <leader>sv :source $MYVIMRC <Cr>|          "source vimrc
nnoremap <leader>t :ter<Cr>|                        "pull up terminal
nnoremap <leader>l  :r!date<Cr>kJ|                  "get date and time : logging
nnoremap <leader>p :pyx 
nnoremap  <leader>u vawUw|                          "capitalise word
nnoremap <leader>h :help |                           "search away
nnoremap <leader>b <c-O>|                           "jump back to previous location
nnoremap H ^|                                       "beginning of the line
nnoremap L $|                                       "end of the line

let maplocalleader = "\\"

"operator pending maps
onoremap in( :<c-u> normal! f(vi(<cr>
onoremap in) :<c-u> normal! f(vi(<cr>
onoremap il( :<c-u> normal! F(vi(<cr>
onoremap il) :<c-u> normal! F(vi(<cr>

onoremap in{ :<c-u> normal! f{vi{<cr>
onoremap in} :<c-u> normal! f{vi{<cr>
onoremap il{ :<c-u> normal! F{vi{<cr>
onoremap il} :<c-u> normal! F{vi{<cr>

"file ops
nnoremap - ddp| "move one line down
nnoremap _ ddkkp| "move one line up
noremap <C-s> <esc>:w <Cr>| "just in case
"-----------------AUTOCMDS----------------------

"----------------ABBREVS------------------------
iab ot to
iab beign being 
iab teh the
iab hte the
iab ph rajp152k|                "print handle
iab pw https://rajpatil.dev|    "print websit
"--------------------PLUGS----------------------
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/tmhedberg/SimpylFold'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/ycm-core/YouCompleteMe'
Plug 'https://github.com/lark-parser/vim-lark-syntax'
Plug 'https://github.com/plasticboy/vim-markdown'
Plug 'https://github.com/sillybun/vim-repl'
Plug 'https://github.com/hylang/vim-hy'
Plug 'https://github.com/vim-scripts/LargeFile'
call plug#end()
"-----------------------POWERLINE---------------
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" -------------------------VIM-REPL-------------
let g:repl_program = {
            \	'python': ['ipython'],
            \	'default': ['bash'],
            \	'markdown':['ipython'],
            \	'racket': ['racket'],
            \   'hy':   ['hy --repl-output-fn=hy.contrib.hy-repr.hy-repr']
            \	}

let g:repl_exit_commands = {
            \   'python': 'quit()',
            \   'bash': 'exit',
            \   'zsh': 'exit',
            \   'default': 'exit',
            \   'racket' : ',exit',
            \   'hy': '(exit)'
            \   }

let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
let g:repl_output_copy_to_register = "t"
nnoremap <leader>r :REPLToggle<Cr>
let g:repl_position = 3
"----------------------YCM----------------------
" GoTo def YCM
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" to GoBack(YCM uses ^O)
"doc hover, toggle
let g:ycm_auto_hover="CursorHold"
nmap <leader>D <plug>(YCMHover)
let g:ycm_complete_in_strings=1
"----------------------NERDTREE-----------------
nnoremap <C-n> :NERDTreeToggle <Cr>
" ------------------------HY -------------------
let g:hy_enable_conceal=1
let g:hy_conceal_fancy=1
"
" yet to figure out the hash-bang
"au BufReadPost *.hy :r!echo '#! $(which hy)'
au filetype hy set lisp
au filetype hy set autoindent
" ---------------------PYTHON-------------------
augroup py_basics:
    autocmd Filetype python nnoremap <buffer> <localleader>i ggOimport 
    autocmd Filetype python nnoremap <buffer> <localleader>c I#<esc>
    autocmd Filetype python nnoremap <buffer> <localleader>u ^x<esc>
    autocmd Filetype python nnoremap <buffer> <localleader>d lbi__<esc>ea__
augroup end
" ---------------------C/C++-------------------
augroup cfam_basics:
    autocmd Filetype c,cpp nnoremap <buffer> <localleader>i ggO#include <><left>
    autocmd Filetype c,cpp nnoremap <buffer> <localleader>c I//<esc>
    autocmd Filetype c,cpp nnoremap <buffer> <localleader>u ^2x<esc>
augroup end
" ----------------MARKDOWN---------------------
au BufRead,BufNew *.md set spell
augroup markdown_basics:
    autocmd Filetype markdown nnoremap <buffer> <localleader>n A  <cr>
augroup end

" ---------------BINARY------------------------
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup end
