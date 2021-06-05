call plug#begin('~/.local/share/nvim/plugged')
" printf \033c clears
autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -ulimit -Wshadow -Wall -Wno-unused-result -std=c++17 -O2 % -o %:r && ./%:r <CR>
autocmd filetype cpp nnoremap <F6> :w <bar> !g++ -ulimit -Wshadow -Wall -Wno-unused-result -std=c++17 -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG % -o %:r && ./%:r <CR>
autocmd filetype cpp nnoremap <F7> :w <bar> !time ./%:r <CR>
autocmd filetype java nnoremap <F4> :w <bar> !bash /home/j9/tdt4100-v2020-master/ws/platform/src/a <CR>
autocmd filetype java nnoremap <F5> :w <bar> !javac % && cat t \| java -enableassertions %:r <CR>
autocmd filetype java nnoremap <F6> :w <bar> !javac % && java -enableassertions %:r <CR>
autocmd filetype java nnoremap <F7> :w <bar> !javac % && time cat t\| java -enableassertions %:r <CR>
autocmd filetype python nnoremap <F5> :w <bar> !python3 % <CR>
autocmd filetype python nnoremap <F6> :w <bar> !python % <CR>
autocmd filetype python nnoremap <F7> :w <bar> !python3.6 % <CR>
autocmd filetype php nnoremap <F5> :w <bar> !php % <CR>
"autocmd filetype oz nnoremap <F5> :w <bar> !ozc -c % && ozengine %f <CR>
" autocmd filetype scala nnoremap <F5> :w <bar> !scala % <CR>
"autocmd filetype scala nnoremap <F5> :w <bar> !scalac % && scala %:r <CR>
"autocmd filetype scala nnoremap <F6> :w <bar> !scala %:r <CR>

" command! -nargs=* Wrap set wrap linebreak nolist
"
""" nnoremap gb :w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && time g++ -g -std=c++17 -Wall -Wextra -Wno-unused-result -D LOCAL -O2 %:r.cpp -o %:r 2>&1 \| tee %:r.cerr && printf "\n================\n   Running...\n================\n" && time ./%:r < %:r.in > %:r.out 2> %:r.err && printf "\n\n\n\n"<CR>
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'peitalin/vim-jsx-typescript'   " TS and TSX syntax
" Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'Procrat/oz.vim' " Oz
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
""" COC.NVIM autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
set encoding=utf8
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set number
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set laststatus=2  " always display the status line
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
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
let g:coc_global_extensions = [ 'coc-tsserver' ]

Plug '~/.fzf'
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

Plug 'sbdchd/neoformat'
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1

""" NERDTree config
Plug 'scrooloose/nerdtree'
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize=13
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

nnoremap <silent> <F2> :NERDTreeToggle<CR>
Plug 'neomake/neomake'
let g:neomake_python_enabled_makers = ['pylint']
Plug 'morhetz/gruvbox'

""" Autocomplete web
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='æ'

""" Vim config
set wrap!
set shiftwidth=4
set tabstop=4
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
