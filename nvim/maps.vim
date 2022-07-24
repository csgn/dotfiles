let g:mapleader = "\<Space>"

" Delete without yank
nnoremap <leader>d "_d
noremap x "_x

" Open current directory
nmap te :tabedit 
"nmap <S-h> :tabprev<Return>
"nmap <S-l> :tabnext<Return>

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-l> <C-w>l

" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

nnoremap <Leader>e :NvimTreeToggle<Return>

inoremap <C-e> <C-o>A
