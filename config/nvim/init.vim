call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'garbas/vim-snipmate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'matze/vim-move'
Plug 'itchyny/lightline.vim'
Plug 'stanangeloff/php.vim'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'heracek/html-autoclosetag'
Plug 'tpope/vim-surround'
Plug 'metakirby5/codi.vim'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" Vim:
set t_Co=256


set laststatus=2
let mapleader = "\<Space>"
set relativenumber

colorscheme nord
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
let g:nord_cursor_line_number_background = 1

filetype plugin indent on
set syntax=on
set background=dark


if has("termguicolors")
    set t_8f=�[38;2;%lu;%lu;%lum
    set t_8b=�[48;2;%lu;%lu;%lum
    set termguicolors
endif


set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=0
set autoindent
set smarttab

set cursorline


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
map <Leader>n :NERDTreeToggle<CR>
"close vim if only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" VimMove:
let g:move_key_modifier = 'C'

" LightLine:
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }


