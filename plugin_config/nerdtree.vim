let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
autocmd FileType nerdtree setlocal number relativenumber

" Open NERDTree.
function CustomNerdTreeToggle()
    if &filetype == 'nerdtree'
        :NERDTreeToggle
    elseif g:NERDTree.IsOpen()
        :NERDTreeFocus
    elseif @% == ""
        :NERDTree
    else
        :NERDTreeFind
    endif
endfun
noremap <Leader>e :call CustomNerdTreeToggle()<CR>
