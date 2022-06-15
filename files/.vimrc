syntax on

colorscheme codedark
let g:airline_theme = 'codedark'

let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

set autoindent
set smartindent
set history=500
set hidden
set number
set mouse=a
set cursorline
set clipboard=unnamedplus

let mapleader="\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>pf iprintf("Debug\n");<esc>
nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>wq :wq<cr>

vmap ( xi()<Esc>P
nmap ) ci(<Esc>Plxx
vmap [ xi[]<Esc>P
nmap ] ci[<Esc>Plxx
vmap { xi{}<Esc>P
nmap } ci{<Esc>Plxx
vmap \" xi\"\"<Esc>P
vmap \' xi\'\'<Esc>P
nmap ; A;<Esc>

map <leader>e :NERDTreeToggle<cr>
set encoding=utf8
set guifont=DroidSansMono\ Nerd\ Font\ Mono:h12

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0

let g:airline#extensions#tabline#formatter = 'default'
" navegação entre os buffers
nnoremap <M-Right> :bn<cr>
nnoremap <M-Left> :bp<cr>
nnoremap <c-x> :bp\|bd #<cr>

let g:ctrlp_custom_ignore = '\v[\/]\.(swp|zip)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_show_hidden = 1

filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
map gcc <Plug>NERDCommenterInvert

let g:ale_linters = {'python': ['flake8', 'pylint'], 'javascript': ['eslint']}
let g:ale_completion_enabled = 0

source ~/.vim/coc.nvimrc
