"Tmux color issue 
set term=screen-256color

"--------------Mappings and Plugless configs---------
let mapleader = "\<Space>"
set relativenumber
set encoding=utf-8

syntax enable
set ts=4
set autoindent
set shiftwidth=4
set showmatch

" Enable folding
"  use zc for folding and zo for unfolding 
set foldmethod=indent
set foldlevel=99

" nerdtree toggle remap=============================
map <C-n> :NERDTreeToggle<CR>

" --------------------Plugs-------------------------
" ==================================================
call plug#begin('~/.vim/plugged')
" --------------------Features changes---------------
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/tmhedberg/SimpylFold'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/ycm-core/YouCompleteMe'
Plug 'https://github.com/lark-parser/vim-lark-syntax'
Plug 'https://github.com/plasticboy/vim-markdown'
Plug 'https://github.com/sillybun/vim-repl'
Plug 'https://github.com/goerz/jupytext.vim'
" --------------------Visual changes---------------
"=================================================

call plug#end()

"Powerline=========================================== 
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2

"jupytext.vim -- use in conjunction with vim-repl
let g:jupytext_fmt='py'

" vim-repl===========================================
let g:repl_program = {
			\	'python': ['ipython'],
			\	'default': ['bash'],
			\	'markdown':['ipython']
			\	}

let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
let g:repl_output_copy_to_register = "t"
nnoremap <leader>r :REPLToggle<Cr>
nnoremap <leader>e :REPLSendSession<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3

"YCM=================================================
" GoTo def YCM
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" to GoBack(YCM uses ^O)
nnoremap <leader>b <C-O>
" End
