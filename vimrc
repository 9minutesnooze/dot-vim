call pathogen#infect()
syntax on
set nu "Absolute line numbers
set cindent
set autoindent

set background=dark

set autoindent                    "Preserve current indent on new lines
" set textwidth=78                  "Wrap at this column
set backspace=indent,eol,start    "Make backspaces delete sensibly

set expandtab
set tabstop=2
set shiftwidth=2
set shiftround                    "Indent/outdent to nearest tabstop

set matchpairs+=<:>               "Allow % to bounce between angles too

set iskeyword+=:                  "Perl double colons are valid part of
                                  "identifiers.

" set columns=85
" set number

set statusline=%<%f%h%m%r%=%{&ff}\ %l,%c%V\ %P

filetype plugin on

"reread .vimrc file after editing
autocmd BufWritePost $HOME/.vimrc source $HOME/.vimrc

" Treat JSON files like JavaScript
autocmd BufNewFile,BufRead *.json set ft=javascript

" use visual bell instead of beeping
set vb

" incremental search
set incsearch

" syntax highlighting
" set bg=light

" autoindent
autocmd FileType perl set autoindent|set smartindent
autocmd FileType ruby set autoindent|set smartindent

" show matching brackets
autocmd FileType perl set showmatch
autocmd FileType ruby set showmatch

" check perl code with :make
"autocmd FileType perl set makeprg=perl\ -c\ %\ $*
"autocmd FileType perl set errorformat=%f:%l:%m
"autocmd FileType perl set autowrite

" dont use Q for Ex mode
map Q :q

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F11>
set diffopt+=iwhite
" colorscheme
colorscheme ir_black

set laststatus=2
let g:Powerline_symbols = 'fancy'

if version > 702
  set listchars=tab:»·,trail:·
endif
set list

set guifont=Monaco:h14

if system("uname") == "Darwin\n"
  set clipboard=unnamed
endif

