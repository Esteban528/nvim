let mapleader=" "

" faster scrolling
nnoremap <C-j> 10<C-e>
nnoremap <C-k> 10<C-y>
nmap <Leader>s <Plug>(easymotion-s2)

nnoremap <Leader>; $a;<Esc>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" shorter commands
cnoreabbrev tree NERDTreeToggle
cnoreabbrev blame Gblame
cnoreabbrev find NERDTreeFind
cnoreabbrev diff Gdiff
"__________________________________________________

" EMMET CONFIG
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','
let g:user_emmet_settings={
 \'php': {
 \ 'extends':'php'
 \}
 \}

" Snippets configuracion
let g:UtilSnipsExpandTrigger="<tab>"

" Prettier configuracion
command! -nargs=0 Prettier :CocCommand prettier.formatFile
noremap <C_D> :Prettier <CR>

"Configuracion de comentarios
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

" NERDTREE config
let NERDTreeQuitOnOpen=1
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nmap <leader>nt :NERDTreeToggle<CR>

" TablineAirLine

nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>

nnoremap <leader>d :bd<CR>
