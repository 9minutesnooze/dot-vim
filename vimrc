call pathogen#infect()
syntax on
set nu "Absolute line numbers
set cindent
set autoindent
set cursorline
set background=dark
set autoindent                    "Preserve current indent on new lines
set backspace=indent,eol,start    "Make backspaces delete sensibly
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround                    "Indent/outdent to nearest tabstop
set matchpairs+=<:>               "Allow % to bounce between angles too
set iskeyword+=:                  "Perl double colons are valid part of identifiers.

filetype plugin on

"reread .vimrc file after editing
autocmd BufWritePost $HOME/.vimrc source $HOME/.vimrc

" Treat JSON files like JavaScript
autocmd BufNewFile,BufRead *.json set ft=javascript

" use visual bell instead of beeping
set vb

" incremental search
set incsearch

" autoindent
autocmd FileType perl set autoindent|set smartindent
autocmd FileType ruby set autoindent|set smartindent

" show matching brackets
autocmd FileType perl set showmatch
autocmd FileType ruby set showmatch

" Ruby is an oddball in the family, use special spacing/rules
if v:version >= 703
  " Note: Relative number is quite slow with Ruby, so is cursorline
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 norelativenumber nocursorline
else
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2
endif


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
colorscheme ir_black
set guifont=Monaco:h14
let g:airline_theme='dark'

" always show the status bar
set laststatus=2

if version > 702
  set listchars=tab:»·,trail:·
endif
set list

" if system("uname") == "Darwin\n"
"   set clipboard=unnamed
" endif

" save on focus loss
autocmd BufLeave,FocusLost * silent! wall

set runtimepath^=~/.vim/bundle/ctrlp.vim

if !empty(matchstr($MY_RUBY_HOME, 'jruby'))
  let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
endif

