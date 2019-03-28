set nocompatible               " be iMproved

" Start plug
call plug#begin('~/.config/nvim/plugged')

" Navigation
Plug 'scrooloose/nerdtree'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Utilities
Plug 'Lokaltog/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'akhaku/vim-java-unused-imports'
Plug 'alvan/vim-closetag'
Plug 'arthurxavierx/vim-caser'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'brooth/far.vim'
Plug 'chrisbra/Colorizer'
Plug 'chrisbra/NrrwRgn'
Plug 'danro/rename.vim'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'epeli/slimux'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-smartinput'
Plug 'kana/vim-textobj-user'
Plug 'kassio/neoterm'
Plug 'lambdalisue/suda.vim'
Plug 'luochen1990/rainbow'
Plug 'markonm/traces.vim'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'scrooloose/nerdcommenter'
Plug 'sgur/vim-editorconfig'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'simnalamburt/vim-mundo'
Plug 'slashmili/alchemist.vim'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-yoink'
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wesQ3/vim-windowswap'

" Programming Syntax
Plug 'fatih/vim-go'
Plug 'hsanson/vim-android'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ryym/vim-riot'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'

" Pazzass and Themes
Plug 'chriskempson/base16-vim'
Plug 'mhartington/oceanic-next'
Plug 'itchyny/lightline.vim'
Plug 'powerman/vim-plugin-AnsiEsc'

call plug#end()

filetype plugin indent on     " required!

" Setting vim for true colors
if (has("termguicolors"))
  set termguicolors
endif

" Setting colorscheme
colorscheme OceanicNext

" Set default clipboard register
set clipboard =unnamed

" Settings for search stuff
set hlsearch
set ignorecase
set incsearch
set inccommand=split
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
set shiftwidth  =2
set smarttab
set softtabstop =2
set tw          =500

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
set complete    =.,b,t,i,]
set completeopt =menuone,noselect,preview

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
let g:indentLine_char            = '│'
let g:indentLine_fileTypeExclude = ['text']

" Yankstack settings
let g:yankstack_map_keys =0

" NERDTree settings
let g:NERDTreeIgnore      = ['^tags$']
let g:NERDTreeNaturalSort =1

" Enable rainbow parentheses to be available
let g:rainbow_active =1

" JSX extension settings
let g:jsx_ext_required =0

" Language server configs
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'ruby': ['solargraph', 'stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ }

" deoplete.nvim config
let g:deoplete#enable_at_startup            = 1

call deoplete#custom#option({
      \ 'auto_complete_delay': 0,
      \ 'auto_refresh_delay': 10,
      \ 'buffer': { 'require_same_filetype': 0 },
      \ 'ignore_sources': { 'ruby': ['omni'] },
      \ 'min_pattern_length': 1,
      \ 'omni': { 'functions': {} },
      \ })

" Close deoplete doc preview window after completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Ultisnips config
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-d>"

" Airline config
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive' ],
      \             [ 'filename' ] ],
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
      \ 'component_expand': {},
      \ 'component_type': {}
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

"!!! REPORT !!!
function! LightLineReadonly()
  if &readonly
    return "👁 "
  else
    return " "
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '  '._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return (&readonly ? "X " : '') .
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

" Yoink configs
let g:yoinkIncludeDeleteOperations = 1

" Some keybinding

" traversing history without arrow key
cmap <C-P> <Up>
cmap <C-N> <Down>

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

" Yoink  bindings
nmap <C-N> <plug>(YoinkPostPasteSwapBack)
nmap <C-P> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" True cut bindings
nnoremap <leader>d d
xnoremap <leader>d d

nnoremap <leader>dd dd
nnoremap <leader>D D
