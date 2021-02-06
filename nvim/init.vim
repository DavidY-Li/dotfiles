let mapleader = ' '
" Plug Plugins {{{
call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kaicataldo/material.vim'
Plug 'itchyny/lightline.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'chrisbra/Colorizer'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/ebnf.vim'
Plug 'KabbAmine/vCoolor.vim'
Plug 'albfan/ag.vim'
Plug 'dstein64/vim-startuptime'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'sbdchd/neoformat'
Plug 'hoov/tmuxline.vim', { 'branch': 'truecolor-lightline' }
Plug 'fluo-lang/fluo.vim'
Plug 'arthurxavierx/vim-caser'
Plug 'ryanoasis/vim-devicons'
Plug 'simnalamburt/vim-mundo'
Plug 'vim-scripts/ebnf.vim'
call plug#end()
" }}}
" Plugin Config {{{
" fuzzy finder files
nnoremap <leader>sf :Files<CR>

" fuzzy finder buffers
nnoremap <leader>sb :Buffers<CR>

" undo tree
nnoremap <leader>ut :MundoToggle<CR>
" }}}
" CoC {{{
" CoC setup
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()

inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <leader>rn <Plug>(coc-rename)

" next CoC diagnostic
nmap <silent> ]n <Plug>(coc-diagnostic-next-error)
nmap <silent> ]b <Plug>(coc-diagnostic-prev-error)

nmap <silent> [n <Plug>(coc-diagnostic-next)
nmap <silent> [b <Plug>(coc-diagnostic-prev)

" jump to useful stuff
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>cr :CocRestart<CR>

" CoC exploere key map
nmap <leader>e :CocCommand explorer<CR>

" CoC show documentation on K
nmap <leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" spellchecker bind
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" }}}
" Discord {{{
" discord rich presence
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_client_id = '566398769386749973'
let g:vimsence_file_explorer_text = 'In NERDTree'
let g:vimsence_file_explorer_details = 'Looking for files'
" }}}
" Theme {{{
" nicer colors
let &t_8f='\<Esc>[38;2;%lu;%lu;%lum'
let &t_8b='\<Esc>[48;2;%lu;%lu;%lum'
set termguicolors

highlight! link CocExplorerGitPathChange gitcommitUnmerged
highlight! link CocExplorerGitContentChange gitcommitHeader
highlight! link CocExplorerGitDeleted gitcommitDiscardedFile
highlight! link CocExplorerGitIgnored Comment
highlight! link CocWarningSign Type

" transparent background
function! AdaptColorscheme()
    highlight clear CursorLine
    highlight Normal ctermbg=none guibg=NONE
    highlight LineNr ctermbg=none guibg=NONE
    highlight Folded ctermbg=none guibg=NONE
    highlight NonText ctermbg=none guibg=NONE
    highlight SpecialKey ctermbg=none guibg=NONE
    highlight VertSplit ctermbg=none guibg=NONE
    highlight SignColumn ctermbg=none guibg=NONE
    highlight EndOfBuffer ctermbg=none guibg=NONE
endfunction
autocmd ColorScheme * call AdaptColorscheme()

let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'

" theme
colorscheme material
" }}}
" Lightline {{{
" remove insert mode indicator (lightline)
set noshowmode

let g:lightline = {'colorscheme' : 'material_vim'}

function SetupLightlineColors() abort
    " transparent background in statusbar
    let l:palette = lightline#palette()

    let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
    let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
    let s:palette.visual.middle = s:palette.normal.middle
    let s:palette.insert.middle = s:palette.normal.middle
    let s:palette.inactive.middle = s:palette.normal.middle
    let s:palette.tabline.middle = s:palette.normal.middle

    call lightline#colorscheme()
endfunction

autocmd VimEnter * call SetupLightlineColors()
" }}}
" Disabled Keys {{{
" disable arrow keys in normal mode
noremap <Left> :echo 'No left for you!'<CR>
noremap <Right> :echo 'No right for you!'<CR>
noremap <Up> :echo 'No up for you!'<CR>
noremap <Down> :echo 'No down for you!'<CR>

" disable page up/down keys (they're annoying!!)
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>
" }}}
" Language Specific Support {{{
augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
    autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
    autocmd BufNewFile,BufRead *.ebnf set filetype=ebnf
    autocmd Filetype cpp,c,haskell,js,typescript,typescriptreact,javascriptreact setlocal shiftwidth=2 tabstop=2
augroup END

let g:formatdef_brittany = '"brittany"'
let g:formatters_haskell  = ['brittany']

nnoremap <leader>f :Neoformat<CR>
au BufWrite *.rs :Neoformat
let g:neoformat_enabled_haskell = ["brittany"]

" Gdb
packadd termdebug
" }}}
" Miscellaneous {{{
" relative line numbers
set number
set relativenumber

" tab stuff
set tabstop=4
set shiftwidth=4
set expandtab
set hidden
set smartindent

" configure python path
let g:python3_host_prog = '/usr/bin/python3'

" vim tabs
set foldmethod=marker foldenable

" toggle vim tabs to syntax highlight
noremap <leader>h :set foldmethod=syntax foldenable!<CR>

" remove highlight
nnoremap <leader>r :noh<CR>

" open nvimrc
nnoremap <leader>conf :e $MYVIMRC<cr>

" leave insert mdoe with jk or kj
inoremap jk <esc>
inoremap kj <esc>
inoremap Jk <esc>
inoremap Kj <esc>
inoremap JK <esc>
inoremap KJ <esc>
inoremap jK <esc>
inoremap kJ <esc>

" shortcut delay
set timeoutlen=300

" detect filetypes
filetype on

" indent marks
let g:indentguides_spacechar = '|'
let g:indentguides_tabchar = '|'

" mouse support
set mouse=a

set undodir=~/.vim/undo
set undofile
set undolevels=10000 
" }}}
