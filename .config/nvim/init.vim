call plug#begin('~/.local/share/nvim/plugged')
autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -ulimit -Wshadow -Wall -Wno-unused-result -std=c++17 -O2 % -o %:r && ./%:r <CR>
autocmd filetype cpp nnoremap <F6> :w <bar> !g++ -ulimit -Wshadow -Wall -Wno-unused-result -std=c++17 -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG % -o %:r && ./%:r <CR>
autocmd filetype cpp nnoremap <F7> :w <bar> !time ./%:r <CR>
autocmd filetype c nnoremap <F5> :w <bar> !gcc -ulimit -Wshadow -Wall -Wno-unused-result -std=c11 -O2 % -o %:r && ./%:r <CR>
autocmd filetype c nnoremap <F6> :w <bar> !gcc -ulimit -Wshadow -Wall -Wno-unused-result -std=c11 -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG % -o %:r && ./%:r <CR>
autocmd filetype c nnoremap <F7> :w <bar> !time ./%:r <CR>
autocmd filetype java nnoremap <F4> :w <bar> !bash /home/juki/tdt4100-v2020-master/ws/platform/src/a <CR>
autocmd filetype java nnoremap <F5> :w <bar> !javac % && cat t \| java -enableassertions %:r <CR>
autocmd filetype java nnoremap <F6> :w <bar> !javac % && java -enableassertions %:r <CR>
autocmd filetype java nnoremap <F7> :w <bar> !javac % && time cat t\| java -enableassertions %:r <CR>
autocmd filetype python nnoremap <F5> :w <bar> !python3 % <CR>
autocmd filetype python nnoremap <F6> :w <bar> !python % <CR>
autocmd filetype python nnoremap <F7> :w <bar> !python3.6 % <CR>
autocmd filetype php nnoremap <F5> :w <bar> !php % <CR>

set encoding=utf8
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set number
set laststatus=2  " always display the status line
set mouse=a " enable scroll with mouse

""" NERDTree config
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
let g:NERDTreeShowHidden = 1
let g:NERDTreeStatusline = ''
let g:NERDTreeWinSize=25
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
" Automaticaly close nvim if NERDTree is only thing left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <F2> :NERDTreeToggle<CR>

""" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" Ignore node_modules
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Web development
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'peitalin/vim-jsx-typescript'   " TS and TSX syntax

" COCVIM config
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR><Paste>
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

Plug 'sbdchd/neoformat'
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1

""" Integrated terminal
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 7
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
" use alt+hjkl to move between split/vsplit panels
"tnoremap <A-h> <C-\><C-n><C-w>h
"tnoremap <A-j> <C-\><C-n><C-w>j
"tnoremap <A-k> <C-\><C-n><C-w>k
"tnoremap <A-l> <C-\><C-n><C-w>l
"nnoremap <A-h> <C-w>h
"nnoremap <A-j> <C-w>j
"nnoremap <A-k> <C-w>k
"nnoremap <A-l> <C-w>l

""" Vim config
set wrap!
set shiftwidth=2 " tab length
set tabstop=2 " tab length
set autoindent
set smartindent
set list
set showbreak=\\ "
set listchars=tab:\·\ ,eol:↵,trail:\ ,nbsp:_,precedes:←,extends:→

" Clipboard for paste and copy globally
set clipboard=unnamedplus
vmap <A-c> "+y
highlight LineNr term=bold cterm=NONE ctermfg=DarkRed ctermbg=NONE gui=NONE guifg=Red guibg=NONE
call plug#end()
