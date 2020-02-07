" Edit/Delete current word.
nnoremap t viwoc
nnoremap T viWoc
nnoremap <C-t> viwod
nnoremap <C-T> viWod

" Delete search marks.
nnoremap <C-@> :noh<CR>

" Insert newline below cursor.
nnoremap <C-o> mzo<Esc>`z

" Copy till end of line.
nnoremap Y y$

" Comfortable navigation in ctrl-n results.
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Makes it easier to select lines and shift them multiple times.
vnoremap > >gv
vnoremap < <gv

" Easier way to escape modes.
inoremap jk <Esc>

" Open NERDTree.
noremap <Tab> :NERDTreeFocus<CR>
