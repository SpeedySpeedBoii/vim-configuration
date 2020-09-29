"let g:ycm_global_ycm_extra_conf = "~/.vim/plugin_config/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_confirm_extra_conf = 1
set completeopt-=preview
let g:ycm_semantic_triggers = {
    \   'c': [ 're!\w{2}' ]
    \ }
