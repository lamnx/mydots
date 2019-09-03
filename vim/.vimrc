call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'bling/vim-airline'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'posva/vim-vue'
Plug 'elmcast/elm-vim'
Plug 'raichoo/purescript-vim'
Plug 'leafgarland/typescript-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'eagletmt/neco-ghc'
Plug 'dart-lang/dart-vim-plugin'
Plug 'fatih/vim-go'
Plug 'alx741/vim-hindent'
Plug 'w0rp/ale'
Plug 'reasonml-editor/vim-reason'
Plug 'fsharp/vim-fsharp'
Plug 'kchmck/vim-coffee-script'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sonph/onehalf', { 'as': 'onehalf' }
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'

call plug#end()

" True colors
if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set autoread
set termguicolors
syntax enable
set cursorline
set t_Co=256
set relativenumber
set background=light
colorscheme one
let g:one_allow_italics = 1
let g:airline_theme='onehalfdark'
let g:deoplete#enable_at_startup = 1
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set copyindent 
set hlsearch
set incsearch
set ignorecase 
set smartcase
set numberwidth=5

let g:ctrlp_working_path_mode = 'ar'
let g:ycm_use_clangd = 0

highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ededed guibg=#c09fd4

"mappings
map  <S-f> <Plug>(easymotion-bd-f)
nmap <S-f> <Plug>(easymotion-overwin-f)
map <C-d> :NERDTreeToggle<CR>
map <C-h> :call WinMove('h')<CR>
map <C-j> :call WinMove('j')<CR>
map <C-k> :call WinMove('k')<CR>
map <C-l> :call WinMove('l')<CR>
map <C-n> :tabnew<CR>
map <C-w> :tabclose<CR>
map <C-u> :call TabMove('u')<CR>
map <C-i> :call TabMove('i')<CR>
noremap ˚ :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap ∆ ddp

function! TabMove(key)
  let t:curtab = tabpagenr()
  let t:diff = 0
  if (a:key == 'u')
    let t:diff = -1
  elseif (a:key == 'i')
    let t:diff = 1
  endif
  let t:nexttab = t:curtab + t:diff
  echo t:diff
  exec "tabn ".t:nexttab
endfunction

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if(match (a:key, '[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Gruvbox theme configuration
let g:gruvbox_bold = 1 
let g:gruvbox_underline = 1
let g:gruvbox_contrast_light = "soft"

"go
let g:go_fmt_command = "gofmt"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"source ~/.vim/statusline.vim

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

let &t_ut=''

