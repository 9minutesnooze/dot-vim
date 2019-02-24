" avoid deprecation warnings from popping up in YCM
" https://github.com/vim/vim/issues/3117#issuecomment-402622616
if has('python3')
  silent! python3 1
endif

call pathogen#infect()
call pathogen#helptags()
syntax on
set nu "Absolute line numbers
set cindent
set autoindent
" cursorline causes yuuuuge slowdowns due to high cpu usage on ruby & go
" https://github.com/vim/vim/issues/282 for details
"set cursorline
set background=dark
set autoindent                    "Preserve current indent on new lines
set backspace=indent,eol,start    "Make backspaces delete sensibly
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround                    "Indent/outdent to nearest tabstop
set matchpairs+=<:>               "Allow % to bounce between angles too
set iskeyword+=:                  "Perl double colons are valid part of identifiers.
set rtp+=/usr/local/bin/fzf
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/.git/*,*.swp
set swapfile
set dir=~/.vim/swp//
set backupdir=~/.vim/backup//
set colorcolumn=80 "show a line at column 80

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F11>
set diffopt+=iwhite

filetype plugin on

"reread .vimrc file after editing
autocmd BufWritePost $HOME/.vimrc source $HOME/.vimrc

" Treat JSON files like JavaScript
autocmd BufNewFile,BufRead *.json set ft=javascript

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4 filetype=go nolist nocindent smartindent
au BufNewFile,BufRead *.md setlocal linebreak
au BufNewFile,BufRead *.md setlocal spell spelllang=en_us
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_fmt_command = 'goimports'
let go_def_mapping_enabled = 0

" YouCompleteMe
" let YouCompleteMe handle <leader>gd
nnoremap <leader>gd :YcmCompleter GoTo<CR>
let g:ycm_goto_buffer_command = 'new-tab'

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
autocmd FileType markdown set linebreak

" Ruby is an oddball in the family, use special spacing/rules
if v:version >= 703
  " Note: Relative number is quite slow with Ruby, so is cursorline
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 norelativenumber nocursorline

  " Use the old vim regex engine (version 1, as opposed to version 2, which was
  " introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
  " slower with the new regex engine.
  " set re=1
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

if has('gui_running')
"  colorscheme solarized
"  set background=light
  colorscheme molokai
  set nomacligatures
  set guifont=Fira\ Code\ Retina:h14
"  set guifont=Hack:h14
else
  colorscheme ir_black
  set background=dark
  let g:airline_theme='dark'
endif

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


if !empty(matchstr($MY_RUBY_HOME, 'jruby'))
  let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
endif

let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_disabled = 1

function! SetOutsideMode()
  colorscheme solarized
  set bg=light
endfunction

function! SetInsideMode()
  colorscheme molokai
  set bg=dark
endfunction

function! ToggleDisplayMode()
  if !exists('w:outside_mode')
    let w:outside_mode = 0
  endif

  if w:outside_mode == 0
    call SetOutsideMode()
    let w:outside_mode = 1
  else
    call SetInsideMode()
    let w:outside_mode = 0
  endif
endfunction

" toggle background w/ \bg
nnoremap <leader>bg :call ToggleDisplayMode()<cr>

if executable('/usr/local/bin/rg')
  let g:ackprg = '/usr/local/bin/rg --vimgrep --no-heading'
  set grepprg=/usr/local/bin/rg\ --color=never
  let g:ctrlp_user_command = '/usr/local/bin/rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" ripgrep for word under cursor
nnoremap <leader>rg :Ack<cr>
