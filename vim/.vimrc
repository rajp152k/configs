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
"-----------------MAPS--------------------------
    "leader maps
    let mapleader = "\<Space>"
    nnoremap <leader>ev :vs $MYVIMRC<Cr>|               "pull up vimrc buffer
    nnoremap <leader>sv :source $MYVIMRC <Cr>|          "source vimrc
    nnoremap <leader>t :ter<Cr>|                        "pull up terminal
    nnoremap <leader>l  :r!date<Cr>kJ|                  "get date and time : logging
    nnoremap  <leader>u vawUw|                          "capitalise word
    nnoremap <leader>h :help |                           "search away
    nnoremap <leader>b <C-O>|                           "jump back to previous location

    let maplocalleader = "\\"

    "file ops
    nnoremap - ddp| "move one line down
    nnoremap _ ddkkp| "move one line up
    noremap <C-s> <esc>:w <Cr>| "just in case
"--------------------PLUGS-------------------------
    call plug#begin('~/.vim/plugged')
    Plug 'https://github.com/scrooloose/nerdtree'
    Plug 'https://github.com/tmhedberg/SimpylFold'
    Plug 'https://github.com/tpope/vim-surround'
    Plug 'https://github.com/ycm-core/YouCompleteMe'
    Plug 'https://github.com/lark-parser/vim-lark-syntax'
    Plug 'https://github.com/plasticboy/vim-markdown'
    Plug 'https://github.com/sillybun/vim-repl'
    Plug 'https://github.com/hylang/vim-hy'
    call plug#end()
"-----------------------POWERLINE-----------------
    python3 from powerline.vim import setup as powerline_setup
    python3 powerline_setup()
    python3 del powerline_setup

    set laststatus=2 " Always display the statusline in all windows
    set showtabline=2 " Always display the tabline, even if there is only one tab
    set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" -------------------------VIM-REPL------------------------
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
    autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
    autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
    autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
    let g:repl_position = 3
"----------------------YCM-------------------------------
    " GoTo def YCM
    let g:ycm_autoclose_preview_window_after_completion=1
    map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
    " to GoBack(YCM uses ^O)
    noremap <C-n> :NERDTreeToggle<CR>
" ------------------------HY -------------------------------
    let g:hy_enable_conceal=1
    let g:hy_conceal_fancy=1
    "
    " yet to figure out the hash-bang
    "au BufReadPost *.hy :r!echo '#! $(which hy)'
    au filetype hy set lisp
    au filetype hy set autoindent
