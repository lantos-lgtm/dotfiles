set updatetime=50

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


"Plug 'gruvbox-community/gruvbox'
"Plug 'sainnhe/gruvbox-material'
Plug 'ayu-theme/ayu-vim'

Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'

" git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'sheerun/vim-polyglot'
" language support
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'alaviss/nim.nvim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'

"Plug 'pangloss/vim-javascript'    " JavaScript support
"Plug 'leafgarland/typescript-vim' " TypeScript syntax
"Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'preservim/nerdtree'

" make vim more IDE like
" window management (tmux)
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kassio/neoterm'

" set line numbers
call plug#end()

let g:vimspector_enable_mappings = 'HUMAN'

"let g:LanguageClient_serverCommands = {
"\   'nim': ['~/.nimble/bin/nimlsp'],
"\ }


" nim.vim settings
"   au User asyncomplete_setup call asyncomplete#register_source({
"       \ 'name': 'nim',
"       \ 'whitelist': ['nim'],
"       \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
"       \ })

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

" fix tabs
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

au BufReadPost,BufNewFile *.nim setlocal shiftwidth=4
au BufReadPost,BufNewFile *.nim setlocal tabstop=4


let g:coc_global_extensions = [ 'coc-tsserver' ]


"let g:gruvbox_contrast_dark = 'medium'
"colorscheme gruvbox
"set background=dark
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu


"set termguicolors     " enable true colors support
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu
"highlight VertSplit  guibg=#232b32
"set fillchars+=vert:\|
"neoterm
let g:neoterm_default_mod = 'botright vertical' "opens on the right vertical
let g:neoterm_autoinsert = 1 "automatically switches to the terminal

" indent and line settings
let g:indentLine_char = '│'
set number relativenumber
set nu rnu

" kassio/neoterm
nnoremap <c-q> :Ttoggle<CR>
inoremap <c-q> <Esc>:Ttoggle<CR>
tnoremap <c-q> <c-\><c-n>:Ttoggle<CR>
tnoremap <c-H> <c-\><c-n>:TmuxNavigateLeft<CR>
tnoremap <c-J> <c-\><c-n>:TmuxNavigateDown<CR>
tnoremap <c-K> <c-\><c-n>:TmuxNavigateUp<CR>
tnoremap <c-L> <c-\><c-n>:TmuxNavigateRight<CR>
autocmd BufWinEnter,WinEnter term://* startinsert

" user bound shortcuts
inoremap ii <esc>
noremap <space><space> _
"fzf
nnoremap <c-p> :Files<CR>
" vim-fugitive
nnoremap <leader>gg :G<CR>

"coc.nvim
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
