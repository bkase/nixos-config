{}:
{
  config = ''
    set nocompatible

    set modelines=0

    " directory
    set directory=/home/bkase/.vim

    " disable backups (and swap)
    set nobackup
    set nowritebackup
    set noswapfile

    " wrap searches
    set wrapscan

    " tab and indentation
    set tabstop=2
    set softtabstop=2
    set noexpandtab
    set smarttab
    set shiftwidth=2
    set backspace=indent,eol,start
    set autoindent
    set smartindent
    set hidden
    set wildmenu
    set wildmode=list:longest
    set ttyfast
    set cursorline
    set laststatus=2
    set relativenumber
    set undofile
    set nopaste

    " show commands
    set showcmd

    " yank to paste buffer
    set clipboard=unnamedplus

    " show line and column position of cursor
    set ruler

    " status bar
    set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%p%%:\ %c,%l/%L]\
    "set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
    set laststatus=2
    set cmdheight=1

    " textwidth
    "set textwidth=80

    " formatting options
    set formatoptions=c,q,r,t

    " line numbers
    set number

    " search
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase

    " syntax highlighting
    filetype plugin on
    syntax on

    " enable mouse
    set mouse=a

    " set colorscheme
    colorscheme solarized
    "colorscheme dawn

    "allows sudo with :w!!
    cmap w!! %!sudo tee > /dev/null %

    " auto indent
    filetype plugin indent on

    " leader key to ,
    let mapleader=","

    " maintain more context around cursor
    set scrolloff=3

    " Quickly edit/reload the vimrc file
    nmap <silent> <leader>ev :e $MYVIMRC<CR>
    nmap <silent> <leader>sv :so $MYVIMRC<CR>

    " VERY useful remap
    nnoremap ; :
    nnoremap j gj
    nnoremap k gk
    "nnoremap s l
    "nnoremap l s
    "vnoremap s l
    nnoremap <up> <nop>
    nnoremap <down> <nop>
    nnoremap <left> <nop>
    nnoremap <right> <nop>
    inoremap <up> <nop>
    inoremap <down> <nop>
    inoremap <left> <nop>
    inoremap <right> <nop>

    " fix regex so it's like perl/python
    nnoremap / /\v
    vnoremap / /\v

    " clear highlights with ,<space>
    nnoremap <leader><space> :noh<cr>

    " map tab to %
    nnoremap <tab> %

    " hides buffers instead of closing them
    set hidden

    set history=1000   " remember more commands and search history
    set undolevels=1000 " use many levels of undo
    set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.so
    "set title "terminal title

    " Shows spaces as you're writing
    "set list
    "set listchars=tab:>.trail:.,extends:#,nbsp:.

    set pastetoggle=<F2>

    " Help key annoyance
    inoremap <F1> <ESC>
    nnoremap <F1> <ESC>
    vnoremap <F1> <ESC>

    " auto-save on leaving focus
    au FocusLost * :wa

    " remove trailing whitespace
    nnoremap <leader>W :%s/\s\+$//<cr>:let @/=\'\'<CR>

    " reselect things just pasted
    nnoremap <leader>v V`]

    " quick exit from insert
    inoremap jj <ESC>

    " open a new split and go to it ,w
    nnoremap <leader>w <C-w>v<c-w>l

    " remap for C-moving windowsing
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

    " Tex-Live grep fix
    set grepprg=grep\ -nH\ $*

    " Python stuff
    autocmd BufRead,BufNewFile *.py set ai
    autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class

    " indent-guides config
    set ts=2 sw=2 et
    let g:indent_guides_guide_size = 1
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=darkgrey
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey ctermbg=grey

    "tagbar config
    nmap <leader>t :TagbarToggle<CR>

    "fuzzyfinder config
    nnoremap <leader>f :FufFile<CR>
    nnoremap <leader>b :FufBuffer<CR>

    "LaTeX
    "Compile to pdf
    let g:Tex_CompileRule_dvi = 'pdflatex $*'
    "auto recompile upon save
    autocmd BufWritePost *.tex execute "normal ,ll"
    "custom folds
    let g:Tex_FoldedEnvironments = 'question,verbatim,comment,eq,gather,itemize,align,figure,table,thebibliography,keywords,abstract,titlepage'
    "awesome macros
    autocmd BufRead,BufNewFile *.tex call IMAP('`s', '\sum_{<++>}^{<++>}<++>', 'tex')
    autocmd BufRead,BufNewFile *.tex call IMAP('`m', '\mathbb{<++>}<++>', 'tex')
    autocmd BufRead,BufNewFile *.tex call IMAP('`v', '\verb~<++>~<++>', 'tex')
    autocmd BufRead,BufNewFile *.tex call IMAP('`l', '\lambda', 'tex')

    "make sig files have proper highlighting
    autocmd BufRead,BufNewFile *.sig set filetype=sml
    autocmd BufRead,BufNewFile sources.cm set filetype=sml
    autocmd BufRead,BufNewFile *.ispc set filetype=ispc
    autocmd BufRead,BufNewFile *todo.txt set filetype=todo.txt

    "make haskell files override 'K' functionality
    autocmd FileType haskell nnoremap K :call Haddock()
    autocmd ShellCmdPost *.hs redraw!
    let g:haddock_browser = '/usr/bin/lynx'

    "fix the bad search color with solarized
    "hi Search ctermbg=7
    "make solarized dark the default
    set bg=dark

    "Scala tagbar configuration
    let g:tagbar_type_scala = {
        \ 'ctagstype' : 'Scala',
        \ 'kinds'     : [
            \ 'p:packages:1',
            \ 'V:values',
            \ 'v:variables',
            \ 'T:types',
            \ 't:traits',
            \ 'o:objects',
            \ 'a:aclasses',
            \ 'c:classes',
            \ 'r:cclasses',
            \ 'm:methods'
        \ ]
    \ }
    "Start Tagbar for Scala files
    autocmd BufRead,BufNewFile *.scala execute "normal ,t"

    "airline
    let g:airline_theme='solarized'
    " remove separators
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '◀'
    " remove unused modes
    let g:airline_section_x=""
    " put filetype in fifth section
    let g:airline_section_y="%y"
    " make Esc happen without waiting for timeoutlen
    " fixes airline delay
    "augroup FastEscape
    "autocmd!
    "au InsertEnter * set timeoutlen=0
    "au InsertLeave * set timeoutlen=1000
    "augroup END

    let g:javascript_conceal=1

    " better markdown
    augroup markdown
        au!
        au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
    augroup END

    " Ctrl-P
    nnoremap gt :bnext<CR>
    nnoremap gT :bprevious<CR>
    nnoremap gd :BD<CR>

    " Golang wants REAL TABS
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
  '';
}
