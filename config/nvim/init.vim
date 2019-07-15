call plug#begin()
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-commentary'
  Plug 'moll/vim-bbye'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'neomake/neomake'
  Plug 'itchyny/lightline.vim'
  Plug 'rjgrazioli/onedark.vim'
  Plug 'w0rp/ale'
  Plug 'jiangmiao/auto-pairs'
  " brew install the_silver_searcher
  Plug 'ggreer/the_silver_searcher'
  " PHP:
  Plug 'justinrainbow/php-doc.vim'
  Plug 'ncm2/ncm2'
  Plug 'StanAngeloff/php.vim'
  Plug 'phpactor/phpactor'
  Plug 'phpactor/ncm2-phpactor'
  Plug 'noahfrederick/vim-laravel'
  Plug 'phpstan/vim-phpstan'
  Plug 'squizlabs/PHP_CodeSniffer'
  Plug 'jwalton512/vim-blade'
  " GIT:
  Plug 'airblade/vim-gitgutter'
  " VUE:
  Plug 'posva/vim-vue'
call plug#end()



" --  [ PLUGINS ]
"
"  NerdTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<CR>

" FZF
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" PHPStan
let g:ale_php_phpstan_executable = '/usr/local/bin/phpstan'
let g:ale_php_phpstan_level = 4
let g:ale_php_phpstan_use_global = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 1
let g:ale_keep_list_window_open=0
let g:ale_set_quickfix=0
let g:ale_list_window_size = 5
let g:ale_php_phpcbf_standard='PSR2'
let g:ale_php_phpcs_standard='phpcs.xml.dist'
let g:ale_php_phpmd_ruleset='phpmd.xml'
let g:ale_linters = {'php': ['phpstan', 'phpmd', 'phpcs']}
let g:ale_linters = {'vue': ['eslint']}
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint'],
  \ 'vue': ['eslint'],
  \}
let g:ale_javascript_eslint_options = '--config ~/.eslintrc'
"let g:ale_javascript_prettier_options = '--config ~/.prettierrc'
let g:ale_fix_on_save = 1



" Gutentags
set statusline+=%{gutentags#statusline()}

" Lightline:
set laststatus=2
set noshowmode
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

" PGP-doc:
inoremap <C-y> :call PhpDocSingle()<CR>
nnoremap <C-y> :call PhpDocSingle()<CR>
vnoremap <C-y> :call PhpDocSingle()<CR>


" -- [ Basic ]
"
" Theme
syntax on
colorscheme onedark

" tab is 4 spaces
syntax enable
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Moving lines:
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" Cursorline
set cursorline


" Move to the previous buffer with "gp"
nnoremap gp :bp<CR>

" Move to the next buffer with "gn"
nnoremap gn :bn<CR>

" List all possible buffers with "gb" and accept a new buffer argument [1]
nnoremap gb :ls<CR>:b
