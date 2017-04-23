set nocompatible               " be iMproved

" Start plug
call plug#begin('~/.config/nvim/plugged')

" Navigation
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

" Snippets
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Utilities
Plug 'rking/ag.vim'
Plug 'epeli/slimux'
Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-smartinput'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'Yggdroot/indentLine'
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'xolox/vim-misc'
Plug 'simnalamburt/vim-mundo'
Plug 'airblade/vim-gitgutter'
Plug 'Lokaltog/vim-easymotion'
Plug 'oblitum/rainbow'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'tpope/vim-endwise'
Plug 'danro/rename.vim'
Plug 'benekastah/neomake'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kassio/neoterm'
Plug 'alvan/vim-closetag'
Plug 'jremmen/vim-ripgrep'
Plug 'slashmili/alchemist.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'chrisbra/NrrwRgn'

" Programming Syntax
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'juvenn/mustache.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-rails'
Plug 'kchmck/vim-coffee-script'
Plug 'wlangstroth/vim-racket'
Plug 'digitaltoad/vim-pug'
Plug 'vim-ruby/vim-ruby'
Plug 'elixir-lang/vim-elixir'
Plug 'mxw/vim-jsx'
Plug 'Quramy/vim-js-pretty-template'
Plug 'posva/vim-vue'
Plug 'joker1007/vim-ruby-heredoc-syntax'
Plug 'thinca/vim-ref'
Plug 'isRuslan/vim-es6'

" Pazzass and Themes
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'w0ng/vim-hybrid'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim'
Plug 'Lokaltog/vim-distinguished'
Plug 'morhetz/gruvbox'
Plug 'gilgigilgil/anderson.vim'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim'
Plug 'powerman/vim-plugin-AnsiEsc'

call plug#end()

filetype plugin indent on     " required!

" Setting vim for true colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Gruvbox colorscheme config
"let g:gruvbox_contrast_dark = 'hard'

" Setting colorscheme
colorscheme OceanicNext

" Setting background
set background=dark

" Settings for search stuff
set ignorecase
set smartcase
set hlsearch
set incsearch

" Indentation Settings
set smartindent
set autoindent

" For regex
set magic

" For matching brackets
set showmatch
set mat=2

" Eliminate annoying bells
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enabling syntax highlighting
syntax enable

" Backspace as it were meant to be
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" No backup or swap or whatever
set nobackup
set nowb
set noswapfile

" Tabs and spaces and all those related stuff
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set lbr
set tw=500

set ai
set si
set wrap

" Set buffer to hidden
set hidden

" Set line number
set number
set ruler

" Making console title with filename
set title

" Modeline settings
set modeline
set modelines=3

" Set Cmd menu and stuff, including ignoring some stuff
set wildmenu
set wildmode=list:longest
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*

" Set eol char  a nd stuff
set list
set listchars=eol:«,tab:>-,trail:·,extends:>,precedes:<

" Set status
set laststatus=2

" Set default shell
set shell=/usr/bin/bash

" Completion settings
set complete=.,b,u,]
set completeopt=menu,preview

" Make vim automatically load externally edited file
set autoread

" Set 5 spaces apart when scrolling
set so=5

" Speed things up
set ttyfast

" Markdown syntax highlighting for *.md files
au BufRead,BufNewFile *.md set filetype=markdown

" Set vim to find tags in
set tags+=gems.tags,./.git/tags,./tags,tags;/

" Force ruby path by rbenv
let g:ruby_path = system('echo $HOME/.rbenv/shims')

" Persistend Undo (Utopia)
set undofile
set undodir=~/.vim/undodir

" Cursor settings
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
elseif empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

" Extension settings

" Macros matchit.vim
runtime macros/matchit.vim

" indentLine settings
let g:indentLine_char='│'
let g:indentLine_fileTypeExclude = ['text']

" Yankstack settings
let g:yankstack_map_keys=0

" NERDTree settings
let g:NERDTreeIgnore=['^tags$']

" Enable rainbow parentheses to be available
let g:rainbow_active = 1

" JSX extension settings
let g:jsx_ext_required = 0

" Deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ruby = ['omni']
let g:deoplete#buffer#require_same_filetype = 0
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.ruby = 'rubycomplete#Complete'

" Airline config
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "🔒"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ''._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

" Neomake configs
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1
let g:neomake_elixir_enabled_makers = ['credo', 'elixirc']
let g:neomake_elixir_elixirc_maker = {
        \ 'args': ['%:p', '--ignore-module-conflict', '--app', 'mix', '--app', 'ex_unit', '-pa', '_build/dev/lib/\*/ebin', '-o', '/tmp'],
        \ 'errorformat':
        \ '** %s %f:%l: %m,' .
        \ '%f:%l: warning: %m'
        \ }

let g:neomake_elixir_mix_maker = {
      \ 'args': ['compile'],
      \ 'errorformat':
      \ '** %s %f:%l: %m,' .
      \ '%f:%l: warning: %m'
      \ }

let g:neomake_ruby_enabled_makers = ['jruby', 'mri']

" Elixir configs
let g:elixir_maxmenu = 30

" Colorizer configs
let g:colorizer_auto_filetype='scss,less,css,html'

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"

" Some keybinding

" traversing history without arrow key
cmap <C-P> <Up>
cmap <C-N> <Down>

" Save with sudo
cmap w!! w !sudo tee > /dev/null %

" Supertab-esque completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Quicksave
nmap <Leader>w :w<CR>

" FZF bindings
nmap <Leader>s :Files<CR>
nmap <Leader>a :Buffers<CR>

" Deleting search highlight
nmap <Leader>nn :noh<CR>

" NERDTree shortcut
nmap <Leader>op :NERDTreeToggle<CR>

" Binding for color_highlight
nmap <Leader>ct :ColorToggle<CR>

" SnipMate bindings
imap <C-J> <ESC>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
imap <C-K> <ESC>a<Plug>snipMateBack
smap <C-K> <Plug>snipMateBack
imap <C-L> <ESC>a<Plug>snipMateShow

" Slimux bindings (make it more vim-like)
xmap <leader>r :SlimuxREPLSendSelection<CR>
nmap <leader>rr :SlimuxREPLSendLine<CR>
nmap <leader>rc :SlimuxREPLConfigure<CR>

" Ag bindings
nmap <leader>k :Ag

" Yankstack bindings
nmap <C-P> <Plug>yankstack_substitute_older_paste
nmap <C-N> <Plug>yankstack_substitute_newer_paste

" Events config

" Automatic syntax check
autocmd! BufWritePost * Neomake
autocmd FileType javascript,javascript.jsx JsPreTmpl html
