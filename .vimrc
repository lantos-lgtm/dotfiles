set updatetime=50

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'

Plug 'vim-airline/vim-airline'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdtree'

Plug 'sheerun/vim-polyglot'
Plug 'zah/nim.vim'

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax

call plug#end()

inoremap <space><space> _

" nerd tree
map <C-g> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


" fix tabs
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

au BufReadPost,BufNewFile *.nim setlocal shiftwidth=4
au BufReadPost,BufNewFile *.nim setlocal tabstop=4


let g:coc_global_extensions = [ 'coc-tsserver' ]


let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
set background=dark

" indent
" let g:indent_guides_enable_on_vim_startup = 1
let g:indentLine_char = '│'
" let g:indent_guides_auto_colors = 1
" set line numbers
set number relativenumber
set nu rnu

fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i 

" quick esc
inoremap ii <esc>
