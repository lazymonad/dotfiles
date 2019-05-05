call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'matze/vim-move'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'itchyny/lightline.vim'
Plug 'stanangeloff/php.vim'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'metakirby5/codi.vim'
Plug 'mattn/emmet-vim'
Plug 'makerj/vim-pdf'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'neovimhaskell/haskell-vim'
Plug 'jiangmiao/simple-javascript-indenter'
Plug 'posva/vim-vue'
Plug 'othree/html5.vim'

call plug#end()

" Vim:
set t_Co=256 " Set full colorset


colorscheme onedark " Cool colorscheme
set syntax=on " Enable syntax processing
set background=dark " Set dark background

if has("termguicolors")
    set t_8f=�[38;2;%lu;%lu;%lum
    set t_8b=�[48;2;%lu;%lu;%lum
    set termguicolors
endif

let mapleader = "\<Space>" " Leader is space key
" tabs -> 4 spaces
set tabstop=4 " Nuber of visual spaces per TAB
set shiftwidth=4 " Indenting is 4 spaces
set softtabstop=4 " Number of spaces in tab when editing
set expandtab " TABS are spaces
filetype plugin indent on " Enabling filetypes power 

set showcmd " Show command in last line
set number " Set numbers
set relativenumber " Make numbers to relative
set laststatus=2 " Status line for every window
set scrolloff=10 " Minimal number of lines to keep below the cursor 

set autoindent " Copy indent form current line to new line
set smarttab " TAB in front of the line inserts blank

set autoread " Listen outside file changes
set listchars=nbsp:·,tab:▸\ ,eol:¬ " Set invisibles like TextMate have
set list " everything that isn't explicitly shown as something else
set cursorline " Make cursor as whole line

" No Ex mode (see :help Q)
nnoremap Q <nop>

" sudo write
cmap w!! w !sudo tee > /dev/null %

" Tabs:
" Switch between tabs
nnoremap <leader>l :tabnext<cr>
nnoremap <leader>h :tabprev<cr>
" Close window
nnoremap <leader>w :tabclose<cr>

" New tab
nnoremap <leader>n :tabnew<cr>


" Emmet:
let g:user_emmet_install_global = 0
autocmd FileType html,php,css EmmetInstall



" SnipMate:
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" CtrlP:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" NerdTREE:
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_console_startup=1
map <leader>, :NERDTreeToggle<CR>
"close vim if only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" VimMove:
let g:move_key_modifier = 'C'

" MutliCursors:
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" ALE Fixers:
let g:neoformat_enabled_javascript = ['prettier-eslint', 'prettier', 'eslint']

let g:jsx_ext_required = 0

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'vue': ['prettier'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" LightLine:
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }
