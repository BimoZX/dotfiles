set nocompatible               " be iMproved

" Start plug
call plug#begin('~/.config/nvim/plugged')

" Navigation
Plug 'scrooloose/nerdtree'

" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'honza/vim-snippets'

" Utilities
Plug 'Lokaltog/vim-easymotion'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'akhaku/vim-java-unused-imports'
Plug 'alvan/vim-closetag'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'brooth/far.vim'
Plug 'chrisbra/Colorizer'
Plug 'chrisbra/NrrwRgn'
Plug 'danro/rename.vim'
Plug 'epeli/slimux'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-smartinput'
Plug 'kana/vim-textobj-user'
Plug 'kassio/neoterm'
Plug 'luochen1990/rainbow'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'maximbaz/lightline-ale'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'scrooloose/nerdcommenter'
Plug 'simnalamburt/vim-mundo'
Plug 'slashmili/alchemist.vim'
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'wesQ3/vim-windowswap'
"
" Programming Syntax
Plug 'hsanson/vim-android'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ryym/vim-riot'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'

" Pazzass and Themes
Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'powerman/vim-plugin-AnsiEsc'

call plug#end()

filetype plugin indent on     " required!

" Setting vim for true colors
if (has("termguicolors"))
 set termguicolors
endif

" Setting colorscheme
colorscheme base16-oceanicnext

" Settings for search stuff
set clipboard =unnamedplus

" Settings for search stuff
set hlsearch
set ignorecase
set incsearch
set smartcase

" Indentation Settings
set autoindent
set smartindent

" For regex
set magic

" Remove redundant show mode
set noshowmode

" For matching brackets
set mat =2
set showmatch

" Eliminate annoying bells
set noerrorbells
set novisualbell
set t_vb =
set tm   =500

" Enabling syntax highlighting
syntax enable

" Backspace as it were meant to be
set backspace  =eol,start,indent
set whichwrap +=<,>,h,l

" No backup or swap or whatever
set nobackup
set noswapfile
set nowb

" Tabs and spaces and all those related stuff
set expandtab
set lbr
set shiftwidth =2
set smarttab
set tabstop    =2
set tw         =500

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
set modelines =3

" Set Cmd menu and stuff, including ignoring some stuff
set wildignore +=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*
set wildmenu
set wildmode    =list:longest

" Set eol char  a nd stuff
set list
set listchars =eol:«,tab:>-,trail:·,extends:>,precedes:<

" Set status
set laststatus =2

" Set default shell
set shell =/usr/bin/bash

" Completion settings
set complete    =.,b,u,]
set completeopt =menu,preview

" Make vim automatically load externally edited file
set autoread

" Set 5 spaces apart when scrolling
set so =5

" Speed things up
set ttyfast
set updatetime =750

" Markdown syntax highlighting for *.md files
au BufRead,BufNewFile *.md set filetype=markdown

" Set vim to find tags in
set tags +=gems.tags,./.git/tags,./tags,tags;/

" Force ruby path by asdf
let g:ruby_path = system('echo $HOME/.asdf/shims')

" Android SDK absolute path
let g:android_sdk_path = '/opt/android-sdk'

" Persistend Undo (Utopia)
set undodir =~/.config/nvim/undodir
set undofile

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
let g:rainbow_active =1

" JSX extension settings
let g:jsx_ext_required =0

" Deoplete config
let g:deoplete#enable_at_startup            = 1
let g:deoplete#ignore_sources               = {}
let g:deoplete#ignore_sources.ruby          = ['omni']
let g:deoplete#buffer#require_same_filetype = 0
let g:deoplete#omni#functions               = {}
let g:deoplete#omni#functions.ruby          = 'rubycomplete#Complete'

" Neosnippet.vim config
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory ='.config/nvim/plugged/vim-snippets/snippets'

" Airline config
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive' ],
      \             [ 'filename' ],
      \             ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors':   'lightline#ale#errors',
      \   'linter_ok':       'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \    'linter_checking': 'left',
      \    'linter_warnings': 'warning',
      \    'linter_errors': 'error',
      \    'linter_ok': 'left',
      \ }
      \ }
function! LightLineModified()
  if &filetype == "vim-plug" || &filetype == "help" || &readonly
    return ""
  elseif &modified
    return "✎"
  else
    return "✔"
  endif
endfunction

function! LightLineReadonly()
  if &readonly
    return "👁"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != LightLineModified() ? LightLineModified() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]')
endfunction

" Elixir configs
let g:elixir_maxmenu =30

" Colorizer configs
let g:colorizer_auto_filetype  = 'scss,less,css,html'

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames       = "*.html,*.xhtml,*.phtml,*.js,*.jsx"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

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

" Slimux bindings (make it more vim-like)
xmap <leader>r :SlimuxREPLSendSelection<CR>
nmap <leader>rr :SlimuxREPLSendLine<CR>
nmap <leader>rc :SlimuxREPLConfigure<CR>

" Rg bindings
nmap <leader>k :Rg 

" Neosnippet binding
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Yankstack bindings
nmap <C-P> <Plug>yankstack_substitute_older_paste
nmap <C-N> <Plug>yankstack_substitute_newer_paste
