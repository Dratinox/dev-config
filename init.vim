call plug#begin(stdpath('data') . '/plugged')

Plug 'jeetsukumaran/vim-pythonsense'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'mbbill/undotree' 
Plug 'vim-airline/vim-airline' " status bar on bottom
Plug 'vim-airline/vim-airline-themes' 
Plug 'tpope/vim-fugitive' 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'craigemery/vim-autotag'
Plug 'vim-scripts/indentpython.vim'
Plug 'tpope/vim-commentary'
Plug 'lilydjwg/colorizer'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'tpope/vim-surround'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Chiel92/vim-autoformat'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'kiteco/vim-plugin'
Plug 'posva/vim-vue'

call plug#end()

syntax on
colorscheme vim-monokai-tasty
set shiftwidth=4
set expandtab
set number
set relativenumber
set smartcase
set ignorecase
set smartindent
set undofile

set clipboard=unnamedplus

let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'


set cmdheight=2
set updatetime=100
set shortmess+=c

let mapleader=" "

nmap <leader>cn <Plug>(coc-rename)

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " always display the status line


nmap <leader>ff :Files<CR>
nmap <leader>ft :Tags<CR>
nmap <leader>fT :BTags<CR>

nmap <leader>jd <Plug>(coc-definition)
nmap <leader>jr <Plug>(coc-references)
nmap <leader>ne <Plug>(coc-diagnostic-next)
nmap <leader>cs :CocSearch <C-R>=expand("<cword>")<CR><CR>

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

nmap <leader>o o<Esc>k
nmap <leader>O O<Esc>j

nmap <leader>gs :Gedit :<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>

nmap <leader>af :CocCommand prettier.formatFile<CR>
nmap <leader>auf :CocCommand tsserver.executeAutofix<CR>
let g:formatdef_black_longer = '"black -l 119 -q ".(&textwidth ? "-l".&textwidth : "")." -"'
let g:formatters_python = ['black_longer']



nnoremap <silent> // :noh<CR>
" autocmd FileType python let b:coc_suggest_disable = 1

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.cpp :%s/\s\+$//e
autocmd BufWritePre *.c :%s/\s\+$//e

set shell=/bin/fish 
set cursorcolumn " highlights column with cursor

set termguicolors

let g:webdevicons_enable = 1

" custom airline symbols
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:semshi#simplify_markup=v:false

command! -nargs=0 Prettier :CocCommand prettier.formatFile
set inccommand=nosplit " Preview effects of replace and such
