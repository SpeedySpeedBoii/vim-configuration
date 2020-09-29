let g:gitgutter_enabled=1
let g:gitgutter_signs=1
let g:gitgutter_map_keys=0
let g:gitgutter_eager=0
let g:gitgutter_sign_priority=0
set updatetime=500

autocmd BufWritePost * GitGutter
